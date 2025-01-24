// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'managed_user_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ManagedUserVm _$ManagedUserVmFromJson(Map<String, dynamic> json) {
  return _ManagedUserVm.fromJson(json);
}

/// @nodoc
mixin _$ManagedUserVm {
  int get id => throw _privateConstructorUsedError;
  String? get login => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  bool get activated => throw _privateConstructorUsedError;
  String get langKey => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;
  String? get createdDate => throw _privateConstructorUsedError;
  String? get lastModifiedBy => throw _privateConstructorUsedError;
  String? get lastModifiedDate => throw _privateConstructorUsedError;
  List<String>? get authorities => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;

  /// Serializes this ManagedUserVm to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ManagedUserVm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ManagedUserVmCopyWith<ManagedUserVm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManagedUserVmCopyWith<$Res> {
  factory $ManagedUserVmCopyWith(
          ManagedUserVm value, $Res Function(ManagedUserVm) then) =
      _$ManagedUserVmCopyWithImpl<$Res, ManagedUserVm>;
  @useResult
  $Res call(
      {int id,
      String? login,
      String firstName,
      String lastName,
      String email,
      String? imageUrl,
      bool activated,
      String langKey,
      String? createdBy,
      String? createdDate,
      String? lastModifiedBy,
      String? lastModifiedDate,
      List<String>? authorities,
      String? password});
}

/// @nodoc
class _$ManagedUserVmCopyWithImpl<$Res, $Val extends ManagedUserVm>
    implements $ManagedUserVmCopyWith<$Res> {
  _$ManagedUserVmCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ManagedUserVm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? login = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? imageUrl = freezed,
    Object? activated = null,
    Object? langKey = null,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? lastModifiedBy = freezed,
    Object? lastModifiedDate = freezed,
    Object? authorities = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      login: freezed == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      activated: null == activated
          ? _value.activated
          : activated // ignore: cast_nullable_to_non_nullable
              as bool,
      langKey: null == langKey
          ? _value.langKey
          : langKey // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      lastModifiedBy: freezed == lastModifiedBy
          ? _value.lastModifiedBy
          : lastModifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      lastModifiedDate: freezed == lastModifiedDate
          ? _value.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      authorities: freezed == authorities
          ? _value.authorities
          : authorities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ManagedUserVmImplCopyWith<$Res>
    implements $ManagedUserVmCopyWith<$Res> {
  factory _$$ManagedUserVmImplCopyWith(
          _$ManagedUserVmImpl value, $Res Function(_$ManagedUserVmImpl) then) =
      __$$ManagedUserVmImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? login,
      String firstName,
      String lastName,
      String email,
      String? imageUrl,
      bool activated,
      String langKey,
      String? createdBy,
      String? createdDate,
      String? lastModifiedBy,
      String? lastModifiedDate,
      List<String>? authorities,
      String? password});
}

/// @nodoc
class __$$ManagedUserVmImplCopyWithImpl<$Res>
    extends _$ManagedUserVmCopyWithImpl<$Res, _$ManagedUserVmImpl>
    implements _$$ManagedUserVmImplCopyWith<$Res> {
  __$$ManagedUserVmImplCopyWithImpl(
      _$ManagedUserVmImpl _value, $Res Function(_$ManagedUserVmImpl) _then)
      : super(_value, _then);

  /// Create a copy of ManagedUserVm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? login = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? imageUrl = freezed,
    Object? activated = null,
    Object? langKey = null,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? lastModifiedBy = freezed,
    Object? lastModifiedDate = freezed,
    Object? authorities = freezed,
    Object? password = freezed,
  }) {
    return _then(_$ManagedUserVmImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      login: freezed == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      activated: null == activated
          ? _value.activated
          : activated // ignore: cast_nullable_to_non_nullable
              as bool,
      langKey: null == langKey
          ? _value.langKey
          : langKey // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      lastModifiedBy: freezed == lastModifiedBy
          ? _value.lastModifiedBy
          : lastModifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      lastModifiedDate: freezed == lastModifiedDate
          ? _value.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      authorities: freezed == authorities
          ? _value._authorities
          : authorities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ManagedUserVmImpl implements _ManagedUserVm {
  const _$ManagedUserVmImpl(
      {required this.id,
      this.login,
      required this.firstName,
      required this.lastName,
      required this.email,
      this.imageUrl,
      required this.activated,
      required this.langKey,
      this.createdBy,
      this.createdDate,
      this.lastModifiedBy,
      this.lastModifiedDate,
      final List<String>? authorities,
      this.password})
      : _authorities = authorities;

  factory _$ManagedUserVmImpl.fromJson(Map<String, dynamic> json) =>
      _$$ManagedUserVmImplFromJson(json);

  @override
  final int id;
  @override
  final String? login;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String? imageUrl;
  @override
  final bool activated;
  @override
  final String langKey;
  @override
  final String? createdBy;
  @override
  final String? createdDate;
  @override
  final String? lastModifiedBy;
  @override
  final String? lastModifiedDate;
  final List<String>? _authorities;
  @override
  List<String>? get authorities {
    final value = _authorities;
    if (value == null) return null;
    if (_authorities is EqualUnmodifiableListView) return _authorities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? password;

  @override
  String toString() {
    return 'ManagedUserVm(id: $id, login: $login, firstName: $firstName, lastName: $lastName, email: $email, imageUrl: $imageUrl, activated: $activated, langKey: $langKey, createdBy: $createdBy, createdDate: $createdDate, lastModifiedBy: $lastModifiedBy, lastModifiedDate: $lastModifiedDate, authorities: $authorities, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManagedUserVmImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.activated, activated) ||
                other.activated == activated) &&
            (identical(other.langKey, langKey) || other.langKey == langKey) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.lastModifiedBy, lastModifiedBy) ||
                other.lastModifiedBy == lastModifiedBy) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                other.lastModifiedDate == lastModifiedDate) &&
            const DeepCollectionEquality()
                .equals(other._authorities, _authorities) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      login,
      firstName,
      lastName,
      email,
      imageUrl,
      activated,
      langKey,
      createdBy,
      createdDate,
      lastModifiedBy,
      lastModifiedDate,
      const DeepCollectionEquality().hash(_authorities),
      password);

  /// Create a copy of ManagedUserVm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ManagedUserVmImplCopyWith<_$ManagedUserVmImpl> get copyWith =>
      __$$ManagedUserVmImplCopyWithImpl<_$ManagedUserVmImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ManagedUserVmImplToJson(
      this,
    );
  }
}

abstract class _ManagedUserVm implements ManagedUserVm {
  const factory _ManagedUserVm(
      {required final int id,
      final String? login,
      required final String firstName,
      required final String lastName,
      required final String email,
      final String? imageUrl,
      required final bool activated,
      required final String langKey,
      final String? createdBy,
      final String? createdDate,
      final String? lastModifiedBy,
      final String? lastModifiedDate,
      final List<String>? authorities,
      final String? password}) = _$ManagedUserVmImpl;

  factory _ManagedUserVm.fromJson(Map<String, dynamic> json) =
      _$ManagedUserVmImpl.fromJson;

  @override
  int get id;
  @override
  String? get login;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get email;
  @override
  String? get imageUrl;
  @override
  bool get activated;
  @override
  String get langKey;
  @override
  String? get createdBy;
  @override
  String? get createdDate;
  @override
  String? get lastModifiedBy;
  @override
  String? get lastModifiedDate;
  @override
  List<String>? get authorities;
  @override
  String? get password;

  /// Create a copy of ManagedUserVm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ManagedUserVmImplCopyWith<_$ManagedUserVmImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
