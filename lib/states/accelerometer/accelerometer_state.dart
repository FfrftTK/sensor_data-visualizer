import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sensor_data_visualizer/entities/entities.dart';

part 'accelerometer_state.freezed.dart';

@freezed
abstract class AccelerometerState with _$AccelerometerState {
  const factory AccelerometerState({
    @Default([]) List<AccelerationData> data,
    AccelerationData offset,
    @Default(false) bool enableDataUpload,
    @Required() MQTTConfig mqttConfig,
  }) = _AccelerometerState;
}
