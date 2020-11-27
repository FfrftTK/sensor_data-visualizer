import 'package:all_sensors/all_sensors.dart';
import 'package:state_notifier/state_notifier.dart';

class Accelerometer {
  Accelerometer({
    this.x = 0,
    this.y = 0,
    this.z = 0,
  });

  Accelerometer.fromAccelerometerEvent(AccelerometerEvent event) {
    x = event.x;
    y = event.y;
    z = event.z;
  }

  double x;
  double y;
  double z;

  @override
  String toString() {
    return '($x, $y, $z)';
  }
}

class AccelerometerController extends StateNotifier<Accelerometer> {
  AccelerometerController() : super(Accelerometer()) {
    initState();
  }

  void initState() {
    // Subscribe Accelerometer events
    accelerometerEvents.listen((AccelerometerEvent event) {
      state = Accelerometer.fromAccelerometerEvent(event);
    });
  }
}
