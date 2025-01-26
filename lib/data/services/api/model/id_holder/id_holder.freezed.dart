// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'id_holder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IdHolder _$IdHolderFromJson(Map<String, dynamic> json) {
  return _IdHolder.fromJson(json);
}

/// @nodoc
mixin _$IdHolder {
  int get id => throw _privateConstructorUsedError;

  /// Serializes this IdHolder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IdHolder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IdHolderCopyWith<IdHolder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdHolderCopyWith<$Res> {
  factory $IdHolderCopyWith(IdHolder value, $Res Function(IdHolder) then) =
      _$IdHolderCopyWithImpl<$Res, IdHolder>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$IdHolderCopyWithImpl<$Res, $Val extends IdHolder>
    implements $IdHolderCopyWith<$Res> {
  _$IdHolderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IdHolder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IdHolderImplCopyWith<$Res>
    implements $IdHolderCopyWith<$Res> {
  factory _$$IdHolderImplCopyWith(
          _$IdHolderImpl value, $Res Function(_$IdHolderImpl) then) =
      __$$IdHolderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$IdHolderImplCopyWithImpl<$Res>
    extends _$IdHolderCopyWithImpl<$Res, _$IdHolderImpl>
    implements _$$IdHolderImplCopyWith<$Res> {
  __$$IdHolderImplCopyWithImpl(
      _$IdHolderImpl _value, $Res Function(_$IdHolderImpl) _then)
      : super(_value, _then);

  /// Create a copy of IdHolder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$IdHolderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IdHolderImpl implements _IdHolder {
  const _$IdHolderImpl({required this.id});

  factory _$IdHolderImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdHolderImplFromJson(json);

  @override
  final int id;

  @override
  String toString() {
    return 'IdHolder(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdHolderImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of IdHolder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IdHolderImplCopyWith<_$IdHolderImpl> get copyWith =>
      __$$IdHolderImplCopyWithImpl<_$IdHolderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdHolderImplToJson(
      this,
    );
  }
}

abstract class _IdHolder implements IdHolder {
  const factory _IdHolder({required final int id}) = _$IdHolderImpl;

  factory _IdHolder.fromJson(Map<String, dynamic> json) =
      _$IdHolderImpl.fromJson;

  @override
  int get id;

  /// Create a copy of IdHolder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IdHolderImplCopyWith<_$IdHolderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
