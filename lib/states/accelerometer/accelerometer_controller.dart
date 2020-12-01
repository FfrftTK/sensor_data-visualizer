import 'dart:ui';

import 'package:all_sensors/all_sensors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sensor_data_visualizer/entities/entities.dart';
import 'package:sensor_data_visualizer/services/services.dart';
import 'package:sensor_data_visualizer/utils/utils.dart';

import 'accelerometer_state.dart';

export 'accelerometer_state.dart' show AccelerometerState;

class AccelerometerController extends StateNotifier<AccelerometerState> {
  AccelerometerController({
    this.storedEventsSize = 100,
    this.accelerometerService = const AccelerometerService(),
    this.mqttService = const MQTTService(
      serverUrl: '192.168.68.100',
      clientIdentifier: 'sensor_data_visualizer',
      port: 1883,
    ),
  }) : super(const AccelerometerState()) {
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
        await mqttService.connect();
        state = state.copyWith(enableDataUpload: true);
      } on Exception catch (e) {
        print(e);
        // Get.dialog();
      }
    }

    Get.context.hideLoaderOverlay();
  }

  /*
  * private functions
  * */

  void _initState() async {
    mqttService.init();
    // ..connect();

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
        topic: 'test',
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
