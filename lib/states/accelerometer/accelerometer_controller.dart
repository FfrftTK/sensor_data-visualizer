import 'package:all_sensors/all_sensors.dart';
import 'package:hooks_riverpod/all.dart';

import 'accelerometer_state.dart';

export 'accelerometer_state.dart' show AccelerometerState, AccelerationData;

class AccelerometerController extends StateNotifier<AccelerometerState> {
  AccelerometerController({this.storedEventsSize = 20})
      : super(const AccelerometerState()) {
    initState();
  }

  final int storedEventsSize;

  void initState() {
    // Subscribe Accelerometer events
    accelerometerEvents.listen(_storeEvent);
  }

//  List<List<double>> get accelerations =>
//      state.events.map((e) => [e.x, e.y, e.z]).toList();

  void _storeEvent(AccelerometerEvent event) {
    final currentData = [
      ...state.data,
      AccelerationData(
        event: event,
        timestamp: DateTime.now(),
      )
    ];

    if (currentData.length > storedEventsSize) {
      currentData.removeAt(0);
    }

    state = state.copyWith(data: currentData);
  }
}
