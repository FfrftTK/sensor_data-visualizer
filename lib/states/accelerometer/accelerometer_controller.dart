import 'package:all_sensors/all_sensors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:velocity_visualizer/services/services.dart';
import 'package:velocity_visualizer/utils/utils.dart';

import 'accelerometer_state.dart';

export 'accelerometer_state.dart' show AccelerometerState, AccelerationData;

class AccelerometerController extends StateNotifier<AccelerometerState> {
  AccelerometerController({
    this.storedEventsSize = 100,
    this.accelerometerService = const AccelerometerService(),
  }) : super(const AccelerometerState()) {
    _initState();
  }

  final int storedEventsSize;
  final AccelerometerService accelerometerService;

  void _initState() {
    // Subscribe Accelerometer events
    accelerometerEvents.listen(_storeEvent);
  }

  List<LineBarDetail> get lineBarDetails =>
      accelerometerService.getLineBarDetails();

  LineChartData get currentAccelerationLineChartData =>
      accelerometerService.generateLineChartData(state.data);

  AccelerationData get latestData => state.data.last;

  void _storeEvent(AccelerometerEvent event) {
    final currentData = [...state.data, AccelerationData.fromEvent(event)];

    if (currentData.length > storedEventsSize) {
      currentData.removeAt(0);
    }

    state = state.copyWith(data: currentData);
  }
}
