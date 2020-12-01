import 'dart:convert';
import 'dart:ui';

import 'package:all_sensors/all_sensors.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sensor_data_visualizer/entities/entities.dart';
import 'package:sensor_data_visualizer/services/services.dart';
import 'package:sensor_data_visualizer/utils/utils.dart';
import 'package:sensor_data_visualizer/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'accelerometer_state.dart';

export 'accelerometer_state.dart' show AccelerometerState;

enum MQTTConfigForm {
  host,
  port,
  username,
  password,
  topic,
  clientIdentifier,
}

class AccelerometerController extends StateNotifier<AccelerometerState> {
  AccelerometerController({
    this.storedEventsSize = 100,
    this.accelerometerService = const AccelerometerService(),
    this.mqttService = const MQTTService(),
  }) : super(const AccelerometerState(mqttConfig: MQTTConfig())) {
    _initState();
  }

  final int storedEventsSize;
  final AccelerometerService accelerometerService;
//  final
  MQTTService mqttService;

  List<LineBarDetail> get lineBarDetails =>
      accelerometerService.getLineBarDetails();

  LineChartData get currentAccelerationLineChartData =>
      accelerometerService.generateLineChartData(state.data);

  Color get cloudColor => state.enableDataUpload ? Get.theme.accentColor : null;

  void updateOffset() {
    state = state.copyWith(data: [], offset: state.data.last);
  }

  void clearOffset() {
    state = state.copyWith(data: [], offset: null);
  }

  Future<void> onCloudTapped() async {
    Get.context.showLoaderOverlay();

    if (state.enableDataUpload) {
      // Disconnect
      mqttService.disconnect;
      state = state.copyWith(enableDataUpload: false);
    } else {
      // Connect
      try {
        await mqttService.connect(state.mqttConfig);
        state = state.copyWith(enableDataUpload: true);
      } on Exception catch (e) {
        Get.dialog(SimpleNotifyDialog(
          titleText: 'Connection Error: ${state.mqttConfig.host}',
          contentText: '$e',
        ));
      }
    }

    Get.context.hideLoaderOverlay();
  }

  /*
  * MQTT config related
  * */
  FormGroup buildMqttConfigForm() => fb.group({
        EnumToString.convertToString(MQTTConfigForm.host): FormControl<String>(
          value: state.mqttConfig.host,
          validators: [Validators.required],
        ),
        EnumToString.convertToString(MQTTConfigForm.port): FormControl<int>(
          value: state.mqttConfig.port,
          validators: [
            Validators.number,
            Validators.max(65535),
            Validators.min(0),
          ],
        ),
        EnumToString.convertToString(MQTTConfigForm.username):
            state.mqttConfig.username,
        EnumToString.convertToString(MQTTConfigForm.password):
            state.mqttConfig.password,
        EnumToString.convertToString(MQTTConfigForm.topic):
            state.mqttConfig.topic,
        EnumToString.convertToString(MQTTConfigForm.clientIdentifier):
            state.mqttConfig.clientIdentifier
      }, []);

  Future<void> saveMqttConfigInLocal() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('mqttConfig', state.mqttConfig.jsonString);
  }

  Future<void> loadMqttConfigFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('mqttConfig');

    if (jsonString != null) {
      state = state.copyWith(
          mqttConfig: MQTTConfig.fromJson(json.decode(jsonString)));
    }
  }

  void updateMqttConfig(Map<String, dynamic> config) {
    final host = config[EnumToString.convertToString(MQTTConfigForm.host)];

    final port = config[EnumToString.convertToString(MQTTConfigForm.port)];

    final username =
        config[EnumToString.convertToString(MQTTConfigForm.username)];

    final password =
        config[EnumToString.convertToString(MQTTConfigForm.password)];

    final topic =
        config[EnumToString.convertToString(MQTTConfigForm.topic)] ?? '';

    final clientIdentifier =
        config[EnumToString.convertToString(MQTTConfigForm.clientIdentifier)];

    state = state.copyWith(
        mqttConfig: MQTTConfig(
      host: host,
      port: port,
      username: username,
      password: password,
      topic: topic ?? '',
      clientIdentifier: clientIdentifier,
    ));

    mqttService.applyConfig(state.mqttConfig);
  }

  /*
  * private functions
  * */

  void _initState() async {
    // MQTT config
    await loadMqttConfigFromLocal();
    mqttService.applyConfig(state.mqttConfig);

    // Subscribe Accelerometer events
    accelerometerEvents.listen(_onEvent);
  }

  void _onEvent(AccelerometerEvent event) async {
    _storeEvent(event);
    _publishDataWithMQTT(event);
  }

  // Publish data with MQTT
  void _publishDataWithMQTT(AccelerometerEvent event) {
    if (state.enableDataUpload) {
      mqttService.publish(
        config: state.mqttConfig,
        data: AccelerationData.fromEvent(event).jsonString,
      );
    }
  }

  // Store event data in state
  void _storeEvent(AccelerometerEvent event) {
    var data = AccelerationData.fromEvent(event);

    if (state.offset != null) {
      data -= state.offset;
    }

    final currentDataSet = [...state.data, data];

    if (currentDataSet.length > storedEventsSize) {
      currentDataSet.removeAt(0);
    }

    state = state.copyWith(data: currentDataSet);
  }
}
