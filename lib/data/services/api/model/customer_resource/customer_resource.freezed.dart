// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_resource.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomerResource _$CustomerResourceFromJson(Map<String, dynamic> json) {
  return _CustomerResource.fromJson(json);
}

/// @nodoc
mixin _$CustomerResource {
  int get id => throw _privateConstructorUsedError;
  int? get nr => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get from => throw _privateConstructorUsedError;
  ManagedUserVm? get systemUser => throw _privateConstructorUsedError;
  List<Rental>? get rentals => throw _privateConstructorUsedError;
  Location? get location => throw _privateConstructorUsedError;

  /// Serializes this CustomerResource to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerResource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerResourceCopyWith<CustomerResource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerResourceCopyWith<$Res> {
  factory $CustomerResourceCopyWith(
          CustomerResource value, $Res Function(CustomerResource) then) =
      _$CustomerResourceCopyWithImpl<$Res, CustomerResource>;
  @useResult
  $Res call(
      {int id,
      int? nr,
      String firstName,
      String lastName,
      String from,
      ManagedUserVm? systemUser,
      List<Rental>? rentals,
      Location? location});

  $ManagedUserVmCopyWith<$Res>? get systemUser;
  $LocationCopyWith<$Res>? get location;
}

/// @nodoc
class _$CustomerResourceCopyWithImpl<$Res, $Val extends CustomerResource>
    implements $CustomerResourceCopyWith<$Res> {
  _$CustomerResourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerResource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nr = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? from = null,
    Object? systemUser = freezed,
    Object? rentals = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nr: freezed == nr
          ? _value.nr
          : nr // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      systemUser: freezed == systemUser
          ? _value.systemUser
          : systemUser // ignore: cast_nullable_to_non_nullable
              as ManagedUserVm?,
      rentals: freezed == rentals
          ? _value.rentals
          : rentals // ignore: cast_nullable_to_non_nullable
              as List<Rental>?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
    ) as $Val);
  }

  /// Create a copy of CustomerResource
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ManagedUserVmCopyWith<$Res>? get systemUser {
    if (_value.systemUser == null) {
      return null;
    }

    return $ManagedUserVmCopyWith<$Res>(_value.systemUser!, (value) {
      return _then(_value.copyWith(systemUser: value) as $Val);
    });
  }

  /// Create a copy of CustomerResource
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomerResourceImplCopyWith<$Res>
    implements $CustomerResourceCopyWith<$Res> {
  factory _$$CustomerResourceImplCopyWith(_$CustomerResourceImpl value,
          $Res Function(_$CustomerResourceImpl) then) =
      __$$CustomerResourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int? nr,
      String firstName,
      String lastName,
      String from,
      ManagedUserVm? systemUser,
      List<Rental>? rentals,
      Location? location});

  @override
  $ManagedUserVmCopyWith<$Res>? get systemUser;
  @override
  $LocationCopyWith<$Res>? get location;
}

/// @nodoc
class __$$CustomerResourceImplCopyWithImpl<$Res>
    extends _$CustomerResourceCopyWithImpl<$Res, _$CustomerResourceImpl>
    implements _$$CustomerResourceImplCopyWith<$Res> {
  __$$CustomerResourceImplCopyWithImpl(_$CustomerResourceImpl _value,
      $Res Function(_$CustomerResourceImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerResource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nr = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? from = null,
    Object? systemUser = freezed,
    Object? rentals = freezed,
    Object? location = freezed,
  }) {
    return _then(_$CustomerResourceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nr: freezed == nr
          ? _value.nr
          : nr // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      systemUser: freezed == systemUser
          ? _value.systemUser
          : systemUser // ignore: cast_nullable_to_non_nullable
              as ManagedUserVm?,
      rentals: freezed == rentals
          ? _value._rentals
          : rentals // ignore: cast_nullable_to_non_nullable
              as List<Rental>?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerResourceImpl implements _CustomerResource {
  const _$CustomerResourceImpl(
      {required this.id,
      this.nr,
      required this.firstName,
      required this.lastName,
      required this.from,
      this.systemUser,
      final List<Rental>? rentals,
      this.location})
      : _rentals = rentals;

  factory _$CustomerResourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerResourceImplFromJson(json);

  @override
  final int id;
  @override
  final int? nr;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String from;
  @override
  final ManagedUserVm? systemUser;
  final List<Rental>? _rentals;
  @override
  List<Rental>? get rentals {
    final value = _rentals;
    if (value == null) return null;
    if (_rentals is EqualUnmodifiableListView) return _rentals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Location? location;

  @override
  String toString() {
    return 'CustomerResource(id: $id, nr: $nr, firstName: $firstName, lastName: $lastName, from: $from, systemUser: $systemUser, rentals: $rentals, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerResourceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nr, nr) || other.nr == nr) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.systemUser, systemUser) ||
                other.systemUser == systemUser) &&
            const DeepCollectionEquality().equals(other._rentals, _rentals) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      nr,
      firstName,
      lastName,
      from,
      systemUser,
      const DeepCollectionEquality().hash(_rentals),
      location);

  /// Create a copy of CustomerResource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerResourceImplCopyWith<_$CustomerResourceImpl> get copyWith =>
      __$$CustomerResourceImplCopyWithImpl<_$CustomerResourceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerResourceImplToJson(
      this,
    );
  }
}

abstract class _CustomerResource implements CustomerResource {
  const factory _CustomerResource(
      {required final int id,
      final int? nr,
      required final String firstName,
      required final String lastName,
      required final String from,
      final ManagedUserVm? systemUser,
      final List<Rental>? rentals,
      final Location? location}) = _$CustomerResourceImpl;

  factory _CustomerResource.fromJson(Map<String, dynamic> json) =
      _$CustomerResourceImpl.fromJson;

  @override
  int get id;
  @override
  int? get nr;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get from;
  @override
  ManagedUserVm? get systemUser;
  @override
  List<Rental>? get rentals;
  @override
  Location? get location;

  /// Create a copy of CustomerResource
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerResourceImplCopyWith<_$CustomerResourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
