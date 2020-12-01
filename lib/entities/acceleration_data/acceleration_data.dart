import 'package:all_sensors/all_sensors.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'acceleration_data.freezed.dart';

@freezed
abstract class AccelerationData with _$AccelerationData {
  const factory AccelerationData({
    @Default(0) double x,
    @Default(0) double y,
    @Default(0) double z,
    @Required() DateTime timestamp,
  }) = _AccelerationData;

  factory AccelerationData.fromEvent(AccelerometerEvent event) =>
      AccelerationData(
          x: event.x, y: event.y, z: event.z, timestamp: DateTime.now());

  AccelerationData operator -(AccelerationData other) {
    return AccelerationData(
      x: x - other.x,
      y: y - other.y,
      z: z - other.z,
      timestamp: timestamp,
    );
  }
}

extension on AccelerationData {
  Duration timeDifference(AccelerationData other) =>
      timestamp.difference(other.timestamp);
}
