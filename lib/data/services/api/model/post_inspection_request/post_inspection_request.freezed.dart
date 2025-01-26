// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_inspection_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostInspectionRequest _$PostInspectionRequestFromJson(
    Map<String, dynamic> json) {
  return _PostInspectionRequest.fromJson(json);
}

/// @nodoc
mixin _$PostInspectionRequest {
  String get code => throw _privateConstructorUsedError;
  int get odometer => throw _privateConstructorUsedError;
  String get result => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get photo => throw _privateConstructorUsedError;
  String get photoContentType => throw _privateConstructorUsedError;
  String get completed => throw _privateConstructorUsedError;
  Object? get photos => throw _privateConstructorUsedError;
  Object? get repairs => throw _privateConstructorUsedError;
  IdHolder get car => throw _privateConstructorUsedError;
  Object? get employee => throw _privateConstructorUsedError;
  Object? get rental => throw _privateConstructorUsedError;

  /// Serializes this PostInspectionRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostInspectionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostInspectionRequestCopyWith<PostInspectionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostInspectionRequestCopyWith<$Res> {
  factory $PostInspectionRequestCopyWith(PostInspectionRequest value,
          $Res Function(PostInspectionRequest) then) =
      _$PostInspectionRequestCopyWithImpl<$Res, PostInspectionRequest>;
  @useResult
  $Res call(
      {String code,
      int odometer,
      String result,
      String description,
      String photo,
      String photoContentType,
      String completed,
      Object? photos,
      Object? repairs,
      IdHolder car,
      Object? employee,
      Object? rental});

  $IdHolderCopyWith<$Res> get car;
}

/// @nodoc
class _$PostInspectionRequestCopyWithImpl<$Res,
        $Val extends PostInspectionRequest>
    implements $PostInspectionRequestCopyWith<$Res> {
  _$PostInspectionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostInspectionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? odometer = null,
    Object? result = null,
    Object? description = null,
    Object? photo = null,
    Object? photoContentType = null,
    Object? completed = null,
    Object? photos = freezed,
    Object? repairs = freezed,
    Object? car = null,
    Object? employee = freezed,
    Object? rental = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      odometer: null == odometer
          ? _value.odometer
          : odometer // ignore: cast_nullable_to_non_nullable
              as int,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      photoContentType: null == photoContentType
          ? _value.photoContentType
          : photoContentType // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as String,
      photos: freezed == photos ? _value.photos : photos,
      repairs: freezed == repairs ? _value.repairs : repairs,
      car: null == car
          ? _value.car
          : car // ignore: cast_nullable_to_non_nullable
              as IdHolder,
      employee: freezed == employee ? _value.employee : employee,
      rental: freezed == rental ? _value.rental : rental,
    ) as $Val);
  }

  /// Create a copy of PostInspectionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IdHolderCopyWith<$Res> get car {
    return $IdHolderCopyWith<$Res>(_value.car, (value) {
      return _then(_value.copyWith(car: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostInspectionRequestImplCopyWith<$Res>
    implements $PostInspectionRequestCopyWith<$Res> {
  factory _$$PostInspectionRequestImplCopyWith(
          _$PostInspectionRequestImpl value,
          $Res Function(_$PostInspectionRequestImpl) then) =
      __$$PostInspectionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      int odometer,
      String result,
      String description,
      String photo,
      String photoContentType,
      String completed,
      Object? photos,
      Object? repairs,
      IdHolder car,
      Object? employee,
      Object? rental});

  @override
  $IdHolderCopyWith<$Res> get car;
}

/// @nodoc
class __$$PostInspectionRequestImplCopyWithImpl<$Res>
    extends _$PostInspectionRequestCopyWithImpl<$Res,
        _$PostInspectionRequestImpl>
    implements _$$PostInspectionRequestImplCopyWith<$Res> {
  __$$PostInspectionRequestImplCopyWithImpl(_$PostInspectionRequestImpl _value,
      $Res Function(_$PostInspectionRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostInspectionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? odometer = null,
    Object? result = null,
    Object? description = null,
    Object? photo = null,
    Object? photoContentType = null,
    Object? completed = null,
    Object? photos = freezed,
    Object? repairs = freezed,
    Object? car = null,
    Object? employee = freezed,
    Object? rental = freezed,
  }) {
    return _then(_$PostInspectionRequestImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      odometer: null == odometer
          ? _value.odometer
          : odometer // ignore: cast_nullable_to_non_nullable
              as int,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      photoContentType: null == photoContentType
          ? _value.photoContentType
          : photoContentType // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as String,
      photos: freezed == photos ? _value.photos : photos,
      repairs: freezed == repairs ? _value.repairs : repairs,
      car: null == car
          ? _value.car
          : car // ignore: cast_nullable_to_non_nullable
              as IdHolder,
      employee: freezed == employee ? _value.employee : employee,
      rental: freezed == rental ? _value.rental : rental,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostInspectionRequestImpl implements _PostInspectionRequest {
  const _$PostInspectionRequestImpl(
      {required this.code,
      required this.odometer,
      required this.result,
      required this.description,
      required this.photo,
      required this.photoContentType,
      required this.completed,
      required this.photos,
      required this.repairs,
      required this.car,
      required this.employee,
      required this.rental});

  factory _$PostInspectionRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostInspectionRequestImplFromJson(json);

  @override
  final String code;
  @override
  final int odometer;
  @override
  final String result;
  @override
  final String description;
  @override
  final String photo;
  @override
  final String photoContentType;
  @override
  final String completed;
  @override
  final Object? photos;
  @override
  final Object? repairs;
  @override
  final IdHolder car;
  @override
  final Object? employee;
  @override
  final Object? rental;

  @override
  String toString() {
    return 'PostInspectionRequest(code: $code, odometer: $odometer, result: $result, description: $description, photo: $photo, photoContentType: $photoContentType, completed: $completed, photos: $photos, repairs: $repairs, car: $car, employee: $employee, rental: $rental)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostInspectionRequestImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.odometer, odometer) ||
                other.odometer == odometer) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.photoContentType, photoContentType) ||
                other.photoContentType == photoContentType) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            const DeepCollectionEquality().equals(other.photos, photos) &&
            const DeepCollectionEquality().equals(other.repairs, repairs) &&
            (identical(other.car, car) || other.car == car) &&
            const DeepCollectionEquality().equals(other.employee, employee) &&
            const DeepCollectionEquality().equals(other.rental, rental));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      odometer,
      result,
      description,
      photo,
      photoContentType,
      completed,
      const DeepCollectionEquality().hash(photos),
      const DeepCollectionEquality().hash(repairs),
      car,
      const DeepCollectionEquality().hash(employee),
      const DeepCollectionEquality().hash(rental));

  /// Create a copy of PostInspectionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostInspectionRequestImplCopyWith<_$PostInspectionRequestImpl>
      get copyWith => __$$PostInspectionRequestImplCopyWithImpl<
          _$PostInspectionRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostInspectionRequestImplToJson(
      this,
    );
  }
}

abstract class _PostInspectionRequest implements PostInspectionRequest {
  const factory _PostInspectionRequest(
      {required final String code,
      required final int odometer,
      required final String result,
      required final String description,
      required final String photo,
      required final String photoContentType,
      required final String completed,
      required final Object? photos,
      required final Object? repairs,
      required final IdHolder car,
      required final Object? employee,
      required final Object? rental}) = _$PostInspectionRequestImpl;

  factory _PostInspectionRequest.fromJson(Map<String, dynamic> json) =
      _$PostInspectionRequestImpl.fromJson;

  @override
  String get code;
  @override
  int get odometer;
  @override
  String get result;
  @override
  String get description;
  @override
  String get photo;
  @override
  String get photoContentType;
  @override
  String get completed;
  @override
  Object? get photos;
  @override
  Object? get repairs;
  @override
  IdHolder get car;
  @override
  Object? get employee;
  @override
  Object? get rental;

  /// Create a copy of PostInspectionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostInspectionRequestImplCopyWith<_$PostInspectionRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
