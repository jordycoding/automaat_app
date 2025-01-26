// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rental_location_patch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RentalLocationPatch _$RentalLocationPatchFromJson(Map<String, dynamic> json) {
  return _RentalLocationPatch.fromJson(json);
}

/// @nodoc
mixin _$RentalLocationPatch {
  int get id => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  /// Serializes this RentalLocationPatch to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RentalLocationPatch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RentalLocationPatchCopyWith<RentalLocationPatch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentalLocationPatchCopyWith<$Res> {
  factory $RentalLocationPatchCopyWith(
          RentalLocationPatch value, $Res Function(RentalLocationPatch) then) =
      _$RentalLocationPatchCopyWithImpl<$Res, RentalLocationPatch>;
  @useResult
  $Res call({int id, double latitude, double longitude});
}

/// @nodoc
class _$RentalLocationPatchCopyWithImpl<$Res, $Val extends RentalLocationPatch>
    implements $RentalLocationPatchCopyWith<$Res> {
  _$RentalLocationPatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RentalLocationPatch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RentalLocationPatchImplCopyWith<$Res>
    implements $RentalLocationPatchCopyWith<$Res> {
  factory _$$RentalLocationPatchImplCopyWith(_$RentalLocationPatchImpl value,
          $Res Function(_$RentalLocationPatchImpl) then) =
      __$$RentalLocationPatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, double latitude, double longitude});
}

/// @nodoc
class __$$RentalLocationPatchImplCopyWithImpl<$Res>
    extends _$RentalLocationPatchCopyWithImpl<$Res, _$RentalLocationPatchImpl>
    implements _$$RentalLocationPatchImplCopyWith<$Res> {
  __$$RentalLocationPatchImplCopyWithImpl(_$RentalLocationPatchImpl _value,
      $Res Function(_$RentalLocationPatchImpl) _then)
      : super(_value, _then);

  /// Create a copy of RentalLocationPatch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$RentalLocationPatchImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RentalLocationPatchImpl implements _RentalLocationPatch {
  const _$RentalLocationPatchImpl(
      {required this.id, required this.latitude, required this.longitude});

  factory _$RentalLocationPatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$RentalLocationPatchImplFromJson(json);

  @override
  final int id;
  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'RentalLocationPatch(id: $id, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RentalLocationPatchImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, latitude, longitude);

  /// Create a copy of RentalLocationPatch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RentalLocationPatchImplCopyWith<_$RentalLocationPatchImpl> get copyWith =>
      __$$RentalLocationPatchImplCopyWithImpl<_$RentalLocationPatchImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RentalLocationPatchImplToJson(
      this,
    );
  }
}

abstract class _RentalLocationPatch implements RentalLocationPatch {
  const factory _RentalLocationPatch(
      {required final int id,
      required final double latitude,
      required final double longitude}) = _$RentalLocationPatchImpl;

  factory _RentalLocationPatch.fromJson(Map<String, dynamic> json) =
      _$RentalLocationPatchImpl.fromJson;

  @override
  int get id;
  @override
  double get latitude;
  @override
  double get longitude;

  /// Create a copy of RentalLocationPatch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RentalLocationPatchImplCopyWith<_$RentalLocationPatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
