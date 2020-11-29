import 'package:all_sensors/all_sensors.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'accelerometer_state.freezed.dart';

@freezed
abstract class AccelerometerState with _$AccelerometerState {
  const factory AccelerometerState({
    @Default([]) List<AccelerationData> data,
    AccelerationData offset,
  }) = _AccelerometerState;
}

@immutable
class AccelerationData {
  const AccelerationData._({
    @required this.event,
    @required this.timestamp,
  });

  AccelerationData.fromEvent(AccelerometerEvent event)
      : this._(event: event, timestamp: DateTime.now());

  final AccelerometerEvent event;
  final DateTime timestamp;

  @override
  AccelerationData operator -(AccelerometerEvent event) {
    return AccelerationData._(
      event: AccelerometerEvent(
        this.event.x - event.x,
        this.event.y - event.y,
        this.event.z - event.z,
      ),
      timestamp: timestamp,
    );
  }
}
