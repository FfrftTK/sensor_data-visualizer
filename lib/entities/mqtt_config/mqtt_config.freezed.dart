// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'mqtt_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
MQTTConfig _$MQTTConfigFromJson(Map<String, dynamic> json) {
  return _MQTTConfig.fromJson(json);
}

/// @nodoc
class _$MQTTConfigTearOff {
  const _$MQTTConfigTearOff();

// ignore: unused_element
  _MQTTConfig call(
      {String host = '',
      String clientIdentifier = 'mobile_client',
      int port = 1883,
      String topic = '',
      String username,
      String password}) {
    return _MQTTConfig(
      host: host,
      clientIdentifier: clientIdentifier,
      port: port,
      topic: topic,
      username: username,
      password: password,
    );
  }

// ignore: unused_element
  MQTTConfig fromJson(Map<String, Object> json) {
    return MQTTConfig.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $MQTTConfig = _$MQTTConfigTearOff();

/// @nodoc
mixin _$MQTTConfig {
  String get host;
  String get clientIdentifier;
  int get port;
  String get topic;
  String get username;
  String get password;

  Map<String, dynamic> toJson();
  $MQTTConfigCopyWith<MQTTConfig> get copyWith;
}

/// @nodoc
abstract class $MQTTConfigCopyWith<$Res> {
  factory $MQTTConfigCopyWith(
          MQTTConfig value, $Res Function(MQTTConfig) then) =
      _$MQTTConfigCopyWithImpl<$Res>;
  $Res call(
      {String host,
      String clientIdentifier,
      int port,
      String topic,
      String username,
      String password});
}

/// @nodoc
class _$MQTTConfigCopyWithImpl<$Res> implements $MQTTConfigCopyWith<$Res> {
  _$MQTTConfigCopyWithImpl(this._value, this._then);

  final MQTTConfig _value;
  // ignore: unused_field
  final $Res Function(MQTTConfig) _then;

  @override
  $Res call({
    Object host = freezed,
    Object clientIdentifier = freezed,
    Object port = freezed,
    Object topic = freezed,
    Object username = freezed,
    Object password = freezed,
  }) {
    return _then(_value.copyWith(
      host: host == freezed ? _value.host : host as String,
      clientIdentifier: clientIdentifier == freezed
          ? _value.clientIdentifier
          : clientIdentifier as String,
      port: port == freezed ? _value.port : port as int,
      topic: topic == freezed ? _value.topic : topic as String,
      username: username == freezed ? _value.username : username as String,
      password: password == freezed ? _value.password : password as String,
    ));
  }
}

/// @nodoc
abstract class _$MQTTConfigCopyWith<$Res> implements $MQTTConfigCopyWith<$Res> {
  factory _$MQTTConfigCopyWith(
          _MQTTConfig value, $Res Function(_MQTTConfig) then) =
      __$MQTTConfigCopyWithImpl<$Res>;
  @override
  $Res call(
      {String host,
      String clientIdentifier,
      int port,
      String topic,
      String username,
      String password});
}

/// @nodoc
class __$MQTTConfigCopyWithImpl<$Res> extends _$MQTTConfigCopyWithImpl<$Res>
    implements _$MQTTConfigCopyWith<$Res> {
  __$MQTTConfigCopyWithImpl(
      _MQTTConfig _value, $Res Function(_MQTTConfig) _then)
      : super(_value, (v) => _then(v as _MQTTConfig));

  @override
  _MQTTConfig get _value => super._value as _MQTTConfig;

  @override
  $Res call({
    Object host = freezed,
    Object clientIdentifier = freezed,
    Object port = freezed,
    Object topic = freezed,
    Object username = freezed,
    Object password = freezed,
  }) {
    return _then(_MQTTConfig(
      host: host == freezed ? _value.host : host as String,
      clientIdentifier: clientIdentifier == freezed
          ? _value.clientIdentifier
          : clientIdentifier as String,
      port: port == freezed ? _value.port : port as int,
      topic: topic == freezed ? _value.topic : topic as String,
      username: username == freezed ? _value.username : username as String,
      password: password == freezed ? _value.password : password as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_MQTTConfig implements _MQTTConfig {
  const _$_MQTTConfig(
      {this.host = '',
      this.clientIdentifier = 'mobile_client',
      this.port = 1883,
      this.topic = '',
      this.username,
      this.password})
      : assert(host != null),
        assert(clientIdentifier != null),
        assert(port != null),
        assert(topic != null);

  factory _$_MQTTConfig.fromJson(Map<String, dynamic> json) =>
      _$_$_MQTTConfigFromJson(json);

  @JsonKey(defaultValue: '')
  @override
  final String host;
  @JsonKey(defaultValue: 'mobile_client')
  @override
  final String clientIdentifier;
  @JsonKey(defaultValue: 1883)
  @override
  final int port;
  @JsonKey(defaultValue: '')
  @override
  final String topic;
  @override
  final String username;
  @override
  final String password;

  @override
  String toString() {
    return 'MQTTConfig(host: $host, clientIdentifier: $clientIdentifier, port: $port, topic: $topic, username: $username, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MQTTConfig &&
            (identical(other.host, host) ||
                const DeepCollectionEquality().equals(other.host, host)) &&
            (identical(other.clientIdentifier, clientIdentifier) ||
                const DeepCollectionEquality()
                    .equals(other.clientIdentifier, clientIdentifier)) &&
            (identical(other.port, port) ||
                const DeepCollectionEquality().equals(other.port, port)) &&
            (identical(other.topic, topic) ||
                const DeepCollectionEquality().equals(other.topic, topic)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(host) ^
      const DeepCollectionEquality().hash(clientIdentifier) ^
      const DeepCollectionEquality().hash(port) ^
      const DeepCollectionEquality().hash(topic) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(password);

  @override
  _$MQTTConfigCopyWith<_MQTTConfig> get copyWith =>
      __$MQTTConfigCopyWithImpl<_MQTTConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MQTTConfigToJson(this);
  }
}

abstract class _MQTTConfig implements MQTTConfig {
  const factory _MQTTConfig(
      {String host,
      String clientIdentifier,
      int port,
      String topic,
      String username,
      String password}) = _$_MQTTConfig;

  factory _MQTTConfig.fromJson(Map<String, dynamic> json) =
      _$_MQTTConfig.fromJson;

  @override
  String get host;
  @override
  String get clientIdentifier;
  @override
  int get port;
  @override
  String get topic;
  @override
  String get username;
  @override
  String get password;
  @override
  _$MQTTConfigCopyWith<_MQTTConfig> get copyWith;
}
