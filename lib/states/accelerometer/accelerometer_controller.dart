import 'package:all_sensors/all_sensors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:sensor_data_visualizer/services/services.dart';
import 'package:sensor_data_visualizer/utils/utils.dart';

import 'accelerometer_state.dart';

export 'accelerometer_state.dart' show AccelerometerState, AccelerationData;

class AccelerometerController extends StateNotifier<AccelerometerState> {
  AccelerometerController({
    this.storedEventsSize = 100,
    this.accelerometerService = const AccelerometerService(),
//    this.mqttService = const MQTTService(
//        serverUrl: 'ws://localhost',
//        clientIdentifier: 'sensor_data_visualizer',
//        port: 9001),
  }) : super(const AccelerometerState()) {
    _initState();
  }

  final int storedEventsSize;
  final AccelerometerService accelerometerService;
//  final
//  MQTTService mqttService;

  List<LineBarDetail> get lineBarDetails =>
      accelerometerService.getLineBarDetails();

  LineChartData get currentAccelerationLineChartData =>
      accelerometerService.generateLineChartData(state.data);

  void updateOffset() {
    state = state.copyWith(data: [], offset: state.data.last);
  }

  void clearOffset() {
    state = state.copyWith(data: [], offset: null);
  }

  /*
  * private functions
  * */

  void _initState() async {
//    mqttService
//      ..init()
//      ..connect();

    // Subscribe Accelerometer events
    accelerometerEvents.listen(_storeEvent);
  }

  void _storeEvent(AccelerometerEvent event) {
    var data = AccelerationData.fromEvent(event);

    if (state.offset != null) {
      data -= state.offset?.event;
    }

    final currentData = [...state.data, data];

    if (currentData.length > storedEventsSize) {
      currentData.removeAt(0);
    }

    state = state.copyWith(data: currentData);
  }
}
