// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rental_list_holder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RentalListHolder _$RentalListHolderFromJson(Map<String, dynamic> json) {
  return _RentalListHolder.fromJson(json);
}

/// @nodoc
mixin _$RentalListHolder {
  List<Rental> get data => throw _privateConstructorUsedError;

  /// Serializes this RentalListHolder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RentalListHolder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RentalListHolderCopyWith<RentalListHolder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentalListHolderCopyWith<$Res> {
  factory $RentalListHolderCopyWith(
          RentalListHolder value, $Res Function(RentalListHolder) then) =
      _$RentalListHolderCopyWithImpl<$Res, RentalListHolder>;
  @useResult
  $Res call({List<Rental> data});
}

/// @nodoc
class _$RentalListHolderCopyWithImpl<$Res, $Val extends RentalListHolder>
    implements $RentalListHolderCopyWith<$Res> {
  _$RentalListHolderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RentalListHolder
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
              as List<Rental>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RentalListHolderImplCopyWith<$Res>
    implements $RentalListHolderCopyWith<$Res> {
  factory _$$RentalListHolderImplCopyWith(_$RentalListHolderImpl value,
          $Res Function(_$RentalListHolderImpl) then) =
      __$$RentalListHolderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Rental> data});
}

/// @nodoc
class __$$RentalListHolderImplCopyWithImpl<$Res>
    extends _$RentalListHolderCopyWithImpl<$Res, _$RentalListHolderImpl>
    implements _$$RentalListHolderImplCopyWith<$Res> {
  __$$RentalListHolderImplCopyWithImpl(_$RentalListHolderImpl _value,
      $Res Function(_$RentalListHolderImpl) _then)
      : super(_value, _then);

  /// Create a copy of RentalListHolder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$RentalListHolderImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Rental>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RentalListHolderImpl implements _RentalListHolder {
  const _$RentalListHolderImpl({required final List<Rental> data})
      : _data = data;

  factory _$RentalListHolderImpl.fromJson(Map<String, dynamic> json) =>
      _$$RentalListHolderImplFromJson(json);

  final List<Rental> _data;
  @override
  List<Rental> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'RentalListHolder(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RentalListHolderImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of RentalListHolder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RentalListHolderImplCopyWith<_$RentalListHolderImpl> get copyWith =>
      __$$RentalListHolderImplCopyWithImpl<_$RentalListHolderImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RentalListHolderImplToJson(
      this,
    );
  }
}

abstract class _RentalListHolder implements RentalListHolder {
  const factory _RentalListHolder({required final List<Rental> data}) =
      _$RentalListHolderImpl;

  factory _RentalListHolder.fromJson(Map<String, dynamic> json) =
      _$RentalListHolderImpl.fromJson;

  @override
  List<Rental> get data;

  /// Create a copy of RentalListHolder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RentalListHolderImplCopyWith<_$RentalListHolderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
