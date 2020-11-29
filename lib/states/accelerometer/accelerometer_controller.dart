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

  void _initState() {
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
