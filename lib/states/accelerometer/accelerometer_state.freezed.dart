// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'accelerometer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AccelerometerStateTearOff {
  const _$AccelerometerStateTearOff();

// ignore: unused_element
  _AccelerometerState call(
      {List<AccelerationData> data = const [],
      AccelerationData offset,
      bool enableDataUpload = false,
      @required MQTTConfig mqttConfig}) {
    return _AccelerometerState(
      data: data,
      offset: offset,
      enableDataUpload: enableDataUpload,
      mqttConfig: mqttConfig,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AccelerometerState = _$AccelerometerStateTearOff();

/// @nodoc
mixin _$AccelerometerState {
  List<AccelerationData> get data;
  AccelerationData get offset;
  bool get enableDataUpload;
  MQTTConfig get mqttConfig;

  $AccelerometerStateCopyWith<AccelerometerState> get copyWith;
}

/// @nodoc
abstract class $AccelerometerStateCopyWith<$Res> {
  factory $AccelerometerStateCopyWith(
          AccelerometerState value, $Res Function(AccelerometerState) then) =
      _$AccelerometerStateCopyWithImpl<$Res>;
  $Res call(
      {List<AccelerationData> data,
      AccelerationData offset,
      bool enableDataUpload,
      MQTTConfig mqttConfig});

  $AccelerationDataCopyWith<$Res> get offset;
  $MQTTConfigCopyWith<$Res> get mqttConfig;
}

/// @nodoc
class _$AccelerometerStateCopyWithImpl<$Res>
    implements $AccelerometerStateCopyWith<$Res> {
  _$AccelerometerStateCopyWithImpl(this._value, this._then);

  final AccelerometerState _value;
  // ignore: unused_field
  final $Res Function(AccelerometerState) _then;

  @override
  $Res call({
    Object data = freezed,
    Object offset = freezed,
    Object enableDataUpload = freezed,
    Object mqttConfig = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed ? _value.data : data as List<AccelerationData>,
      offset: offset == freezed ? _value.offset : offset as AccelerationData,
      enableDataUpload: enableDataUpload == freezed
          ? _value.enableDataUpload
          : enableDataUpload as bool,
      mqttConfig:
          mqttConfig == freezed ? _value.mqttConfig : mqttConfig as MQTTConfig,
    ));
  }

  @override
  $AccelerationDataCopyWith<$Res> get offset {
    if (_value.offset == null) {
      return null;
    }
    return $AccelerationDataCopyWith<$Res>(_value.offset, (value) {
      return _then(_value.copyWith(offset: value));
    });
  }

  @override
  $MQTTConfigCopyWith<$Res> get mqttConfig {
    if (_value.mqttConfig == null) {
      return null;
    }
    return $MQTTConfigCopyWith<$Res>(_value.mqttConfig, (value) {
      return _then(_value.copyWith(mqttConfig: value));
    });
  }
}

/// @nodoc
abstract class _$AccelerometerStateCopyWith<$Res>
    implements $AccelerometerStateCopyWith<$Res> {
  factory _$AccelerometerStateCopyWith(
          _AccelerometerState value, $Res Function(_AccelerometerState) then) =
      __$AccelerometerStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<AccelerationData> data,
      AccelerationData offset,
      bool enableDataUpload,
      MQTTConfig mqttConfig});

  @override
  $AccelerationDataCopyWith<$Res> get offset;
  @override
  $MQTTConfigCopyWith<$Res> get mqttConfig;
}

/// @nodoc
class __$AccelerometerStateCopyWithImpl<$Res>
    extends _$AccelerometerStateCopyWithImpl<$Res>
    implements _$AccelerometerStateCopyWith<$Res> {
  __$AccelerometerStateCopyWithImpl(
      _AccelerometerState _value, $Res Function(_AccelerometerState) _then)
      : super(_value, (v) => _then(v as _AccelerometerState));

  @override
  _AccelerometerState get _value => super._value as _AccelerometerState;

  @override
  $Res call({
    Object data = freezed,
    Object offset = freezed,
    Object enableDataUpload = freezed,
    Object mqttConfig = freezed,
  }) {
    return _then(_AccelerometerState(
      data: data == freezed ? _value.data : data as List<AccelerationData>,
      offset: offset == freezed ? _value.offset : offset as AccelerationData,
      enableDataUpload: enableDataUpload == freezed
          ? _value.enableDataUpload
          : enableDataUpload as bool,
      mqttConfig:
          mqttConfig == freezed ? _value.mqttConfig : mqttConfig as MQTTConfig,
    ));
  }
}

/// @nodoc
class _$_AccelerometerState implements _AccelerometerState {
  const _$_AccelerometerState(
      {this.data = const [],
      this.offset,
      this.enableDataUpload = false,
      @required this.mqttConfig})
      : assert(data != null),
        assert(enableDataUpload != null),
        assert(mqttConfig != null);

  @JsonKey(defaultValue: const [])
  @override
  final List<AccelerationData> data;
  @override
  final AccelerationData offset;
  @JsonKey(defaultValue: false)
  @override
  final bool enableDataUpload;
  @override
  final MQTTConfig mqttConfig;

  @override
  String toString() {
    return 'AccelerometerState(data: $data, offset: $offset, enableDataUpload: $enableDataUpload, mqttConfig: $mqttConfig)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AccelerometerState &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.offset, offset) ||
                const DeepCollectionEquality().equals(other.offset, offset)) &&
            (identical(other.enableDataUpload, enableDataUpload) ||
                const DeepCollectionEquality()
                    .equals(other.enableDataUpload, enableDataUpload)) &&
            (identical(other.mqttConfig, mqttConfig) ||
                const DeepCollectionEquality()
                    .equals(other.mqttConfig, mqttConfig)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(offset) ^
      const DeepCollectionEquality().hash(enableDataUpload) ^
      const DeepCollectionEquality().hash(mqttConfig);

  @override
  _$AccelerometerStateCopyWith<_AccelerometerState> get copyWith =>
      __$AccelerometerStateCopyWithImpl<_AccelerometerState>(this, _$identity);
}

abstract class _AccelerometerState implements AccelerometerState {
  const factory _AccelerometerState(
      {List<AccelerationData> data,
      AccelerationData offset,
      bool enableDataUpload,
      @required MQTTConfig mqttConfig}) = _$_AccelerometerState;

  @override
  List<AccelerationData> get data;
  @override
  AccelerationData get offset;
  @override
  bool get enableDataUpload;
  @override
  MQTTConfig get mqttConfig;
  @override
  _$AccelerometerStateCopyWith<_AccelerometerState> get copyWith;
}
