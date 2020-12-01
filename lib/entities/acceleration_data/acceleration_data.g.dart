// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'acceleration_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccelerationData _$_$_AccelerationDataFromJson(Map<String, dynamic> json) {
  return _$_AccelerationData(
    x: (json['x'] as num)?.toDouble() ?? 0,
    y: (json['y'] as num)?.toDouble() ?? 0,
    z: (json['z'] as num)?.toDouble() ?? 0,
    timestamp: json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
  );
}

Map<String, dynamic> _$_$_AccelerationDataToJson(
        _$_AccelerationData instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
      'timestamp': instance.timestamp?.toIso8601String(),
    };
