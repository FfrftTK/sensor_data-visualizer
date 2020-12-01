// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'acceleration_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
AccelerationData _$AccelerationDataFromJson(Map<String, dynamic> json) {
  return _AccelerationData.fromJson(json);
}

/// @nodoc
class _$AccelerationDataTearOff {
  const _$AccelerationDataTearOff();

// ignore: unused_element
  _AccelerationData call(
      {double x = 0,
      double y = 0,
      double z = 0,
      @required DateTime timestamp}) {
    return _AccelerationData(
      x: x,
      y: y,
      z: z,
      timestamp: timestamp,
    );
  }

// ignore: unused_element
  AccelerationData fromJson(Map<String, Object> json) {
    return AccelerationData.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $AccelerationData = _$AccelerationDataTearOff();

/// @nodoc
mixin _$AccelerationData {
  double get x;
  double get y;
  double get z;
  DateTime get timestamp;

  Map<String, dynamic> toJson();
  $AccelerationDataCopyWith<AccelerationData> get copyWith;
}

/// @nodoc
abstract class $AccelerationDataCopyWith<$Res> {
  factory $AccelerationDataCopyWith(
          AccelerationData value, $Res Function(AccelerationData) then) =
      _$AccelerationDataCopyWithImpl<$Res>;
  $Res call({double x, double y, double z, DateTime timestamp});
}

/// @nodoc
class _$AccelerationDataCopyWithImpl<$Res>
    implements $AccelerationDataCopyWith<$Res> {
  _$AccelerationDataCopyWithImpl(this._value, this._then);

  final AccelerationData _value;
  // ignore: unused_field
  final $Res Function(AccelerationData) _then;

  @override
  $Res call({
    Object x = freezed,
    Object y = freezed,
    Object z = freezed,
    Object timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      x: x == freezed ? _value.x : x as double,
      y: y == freezed ? _value.y : y as double,
      z: z == freezed ? _value.z : z as double,
      timestamp:
          timestamp == freezed ? _value.timestamp : timestamp as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$AccelerationDataCopyWith<$Res>
    implements $AccelerationDataCopyWith<$Res> {
  factory _$AccelerationDataCopyWith(
          _AccelerationData value, $Res Function(_AccelerationData) then) =
      __$AccelerationDataCopyWithImpl<$Res>;
  @override
  $Res call({double x, double y, double z, DateTime timestamp});
}

/// @nodoc
class __$AccelerationDataCopyWithImpl<$Res>
    extends _$AccelerationDataCopyWithImpl<$Res>
    implements _$AccelerationDataCopyWith<$Res> {
  __$AccelerationDataCopyWithImpl(
      _AccelerationData _value, $Res Function(_AccelerationData) _then)
      : super(_value, (v) => _then(v as _AccelerationData));

  @override
  _AccelerationData get _value => super._value as _AccelerationData;

  @override
  $Res call({
    Object x = freezed,
    Object y = freezed,
    Object z = freezed,
    Object timestamp = freezed,
  }) {
    return _then(_AccelerationData(
      x: x == freezed ? _value.x : x as double,
      y: y == freezed ? _value.y : y as double,
      z: z == freezed ? _value.z : z as double,
      timestamp:
          timestamp == freezed ? _value.timestamp : timestamp as DateTime,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_AccelerationData implements _AccelerationData {
  const _$_AccelerationData(
      {this.x = 0, this.y = 0, this.z = 0, @required this.timestamp})
      : assert(x != null),
        assert(y != null),
        assert(z != null),
        assert(timestamp != null);

  factory _$_AccelerationData.fromJson(Map<String, dynamic> json) =>
      _$_$_AccelerationDataFromJson(json);

  @JsonKey(defaultValue: 0)
  @override
  final double x;
  @JsonKey(defaultValue: 0)
  @override
  final double y;
  @JsonKey(defaultValue: 0)
  @override
  final double z;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'AccelerationData(x: $x, y: $y, z: $z, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AccelerationData &&
            (identical(other.x, x) ||
                const DeepCollectionEquality().equals(other.x, x)) &&
            (identical(other.y, y) ||
                const DeepCollectionEquality().equals(other.y, y)) &&
            (identical(other.z, z) ||
                const DeepCollectionEquality().equals(other.z, z)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(x) ^
      const DeepCollectionEquality().hash(y) ^
      const DeepCollectionEquality().hash(z) ^
      const DeepCollectionEquality().hash(timestamp);

  @override
  _$AccelerationDataCopyWith<_AccelerationData> get copyWith =>
      __$AccelerationDataCopyWithImpl<_AccelerationData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AccelerationDataToJson(this);
  }
}

abstract class _AccelerationData implements AccelerationData {
  const factory _AccelerationData(
      {double x,
      double y,
      double z,
      @required DateTime timestamp}) = _$_AccelerationData;

  factory _AccelerationData.fromJson(Map<String, dynamic> json) =
      _$_AccelerationData.fromJson;

  @override
  double get x;
  @override
  double get y;
  @override
  double get z;
  @override
  DateTime get timestamp;
  @override
  _$AccelerationDataCopyWith<_AccelerationData> get copyWith;
}
