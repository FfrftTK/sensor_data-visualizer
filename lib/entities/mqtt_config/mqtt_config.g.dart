// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mqtt_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MQTTConfig _$_$_MQTTConfigFromJson(Map<String, dynamic> json) {
  return _$_MQTTConfig(
    host: json['host'] as String ?? '',
    clientIdentifier: json['clientIdentifier'] as String ?? 'mobile_client',
    port: json['port'] as int ?? 1883,
    topic: json['topic'] as String ?? '',
    username: json['username'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$_$_MQTTConfigToJson(_$_MQTTConfig instance) =>
    <String, dynamic>{
      'host': instance.host,
      'clientIdentifier': instance.clientIdentifier,
      'port': instance.port,
      'topic': instance.topic,
      'username': instance.username,
      'password': instance.password,
    };
