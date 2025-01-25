// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_list_holder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CarListHolder _$CarListHolderFromJson(Map<String, dynamic> json) {
  return _CarListHolder.fromJson(json);
}

/// @nodoc
mixin _$CarListHolder {
  List<Car> get data => throw _privateConstructorUsedError;

  /// Serializes this CarListHolder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CarListHolder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarListHolderCopyWith<CarListHolder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarListHolderCopyWith<$Res> {
  factory $CarListHolderCopyWith(
          CarListHolder value, $Res Function(CarListHolder) then) =
      _$CarListHolderCopyWithImpl<$Res, CarListHolder>;
  @useResult
  $Res call({List<Car> data});
}

/// @nodoc
class _$CarListHolderCopyWithImpl<$Res, $Val extends CarListHolder>
    implements $CarListHolderCopyWith<$Res> {
  _$CarListHolderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CarListHolder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Car>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarListHolderImplCopyWith<$Res>
    implements $CarListHolderCopyWith<$Res> {
  factory _$$CarListHolderImplCopyWith(
          _$CarListHolderImpl value, $Res Function(_$CarListHolderImpl) then) =
      __$$CarListHolderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Car> data});
}

/// @nodoc
class __$$CarListHolderImplCopyWithImpl<$Res>
    extends _$CarListHolderCopyWithImpl<$Res, _$CarListHolderImpl>
    implements _$$CarListHolderImplCopyWith<$Res> {
  __$$CarListHolderImplCopyWithImpl(
      _$CarListHolderImpl _value, $Res Function(_$CarListHolderImpl) _then)
      : super(_value, _then);

  /// Create a copy of CarListHolder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$CarListHolderImpl(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Car>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarListHolderImpl implements _CarListHolder {
  const _$CarListHolderImpl(final List<Car> data) : _data = data;

  factory _$CarListHolderImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarListHolderImplFromJson(json);

  final List<Car> _data;
  @override
  List<Car> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'CarListHolder(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarListHolderImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of CarListHolder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarListHolderImplCopyWith<_$CarListHolderImpl> get copyWith =>
      __$$CarListHolderImplCopyWithImpl<_$CarListHolderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarListHolderImplToJson(
      this,
    );
  }
}

abstract class _CarListHolder implements CarListHolder {
  const factory _CarListHolder(final List<Car> data) = _$CarListHolderImpl;

  factory _CarListHolder.fromJson(Map<String, dynamic> json) =
      _$CarListHolderImpl.fromJson;

  @override
  List<Car> get data;

  /// Create a copy of CarListHolder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarListHolderImplCopyWith<_$CarListHolderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
