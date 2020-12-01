import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'mqtt_config.freezed.dart';
part 'mqtt_config.g.dart';

@freezed
abstract class MQTTConfig with _$MQTTConfig {
  const factory MQTTConfig({
    @Default('') String host,
    @Default('mobile_client') String clientIdentifier,
    @Default(1883) int port,
    @Default('') String topic,
    String username,
    String password,
  }) = _MQTTConfig;

  factory MQTTConfig.fromJson(Map<String, dynamic> json) =>
      _$MQTTConfigFromJson(json);
}

extension MQTTConfigExtension on MQTTConfig {
  String get jsonString => json.encode(toJson());
}
