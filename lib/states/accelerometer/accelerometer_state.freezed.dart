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
      {List<AccelerationData> data = const [], AccelerationData offset}) {
    return _AccelerometerState(
      data: data,
      offset: offset,
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

  $AccelerometerStateCopyWith<AccelerometerState> get copyWith;
}

/// @nodoc
abstract class $AccelerometerStateCopyWith<$Res> {
  factory $AccelerometerStateCopyWith(
          AccelerometerState value, $Res Function(AccelerometerState) then) =
      _$AccelerometerStateCopyWithImpl<$Res>;
  $Res call({List<AccelerationData> data, AccelerationData offset});
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
  }) {
    return _then(_value.copyWith(
      data: data == freezed ? _value.data : data as List<AccelerationData>,
      offset: offset == freezed ? _value.offset : offset as AccelerationData,
    ));
  }
}

/// @nodoc
abstract class _$AccelerometerStateCopyWith<$Res>
    implements $AccelerometerStateCopyWith<$Res> {
  factory _$AccelerometerStateCopyWith(
          _AccelerometerState value, $Res Function(_AccelerometerState) then) =
      __$AccelerometerStateCopyWithImpl<$Res>;
  @override
  $Res call({List<AccelerationData> data, AccelerationData offset});
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
  }) {
    return _then(_AccelerometerState(
      data: data == freezed ? _value.data : data as List<AccelerationData>,
      offset: offset == freezed ? _value.offset : offset as AccelerationData,
    ));
  }
}

/// @nodoc
class _$_AccelerometerState implements _AccelerometerState {
  const _$_AccelerometerState({this.data = const [], this.offset})
      : assert(data != null);

  @JsonKey(defaultValue: const [])
  @override
  final List<AccelerationData> data;
  @override
  final AccelerationData offset;

  @override
  String toString() {
    return 'AccelerometerState(data: $data, offset: $offset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AccelerometerState &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.offset, offset) ||
                const DeepCollectionEquality().equals(other.offset, offset)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(offset);

  @override
  _$AccelerometerStateCopyWith<_AccelerometerState> get copyWith =>
      __$AccelerometerStateCopyWithImpl<_AccelerometerState>(this, _$identity);
}

abstract class _AccelerometerState implements AccelerometerState {
  const factory _AccelerometerState(
      {List<AccelerationData> data,
      AccelerationData offset}) = _$_AccelerometerState;

  @override
  List<AccelerationData> get data;
  @override
  AccelerationData get offset;
  @override
  _$AccelerometerStateCopyWith<_AccelerometerState> get copyWith;
}
