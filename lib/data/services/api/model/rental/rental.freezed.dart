// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rental.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Rental _$RentalFromJson(Map<String, dynamic> json) {
  return _Rental.fromJson(json);
}

/// @nodoc
mixin _$Rental {
  int get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  String get fromDate => throw _privateConstructorUsedError;
  String get toDate => throw _privateConstructorUsedError;
  State? get state => throw _privateConstructorUsedError;
  List<Inspection>? get inspections => throw _privateConstructorUsedError;
  CustomerResource? get customer => throw _privateConstructorUsedError;
  Car get car => throw _privateConstructorUsedError;

  /// Serializes this Rental to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Rental
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RentalCopyWith<Rental> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentalCopyWith<$Res> {
  factory $RentalCopyWith(Rental value, $Res Function(Rental) then) =
      _$RentalCopyWithImpl<$Res, Rental>;
  @useResult
  $Res call(
      {int id,
      String code,
      double longitude,
      double latitude,
      String fromDate,
      String toDate,
      State? state,
      List<Inspection>? inspections,
      CustomerResource? customer,
      Car car});

  $CustomerResourceCopyWith<$Res>? get customer;
  $CarCopyWith<$Res> get car;
}

/// @nodoc
class _$RentalCopyWithImpl<$Res, $Val extends Rental>
    implements $RentalCopyWith<$Res> {
  _$RentalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Rental
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? fromDate = null,
    Object? toDate = null,
    Object? state = freezed,
    Object? inspections = freezed,
    Object? customer = freezed,
    Object? car = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      fromDate: null == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as String,
      toDate: null == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as String,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as State?,
      inspections: freezed == inspections
          ? _value.inspections
          : inspections // ignore: cast_nullable_to_non_nullable
              as List<Inspection>?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as CustomerResource?,
      car: null == car
          ? _value.car
          : car // ignore: cast_nullable_to_non_nullable
              as Car,
    ) as $Val);
  }

  /// Create a copy of Rental
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerResourceCopyWith<$Res>? get customer {
    if (_value.customer == null) {
      return null;
    }

    return $CustomerResourceCopyWith<$Res>(_value.customer!, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }

  /// Create a copy of Rental
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CarCopyWith<$Res> get car {
    return $CarCopyWith<$Res>(_value.car, (value) {
      return _then(_value.copyWith(car: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RentalImplCopyWith<$Res> implements $RentalCopyWith<$Res> {
  factory _$$RentalImplCopyWith(
          _$RentalImpl value, $Res Function(_$RentalImpl) then) =
      __$$RentalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String code,
      double longitude,
      double latitude,
      String fromDate,
      String toDate,
      State? state,
      List<Inspection>? inspections,
      CustomerResource? customer,
      Car car});

  @override
  $CustomerResourceCopyWith<$Res>? get customer;
  @override
  $CarCopyWith<$Res> get car;
}

/// @nodoc
class __$$RentalImplCopyWithImpl<$Res>
    extends _$RentalCopyWithImpl<$Res, _$RentalImpl>
    implements _$$RentalImplCopyWith<$Res> {
  __$$RentalImplCopyWithImpl(
      _$RentalImpl _value, $Res Function(_$RentalImpl) _then)
      : super(_value, _then);

  /// Create a copy of Rental
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? fromDate = null,
    Object? toDate = null,
    Object? state = freezed,
    Object? inspections = freezed,
    Object? customer = freezed,
    Object? car = null,
  }) {
    return _then(_$RentalImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      fromDate: null == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as String,
      toDate: null == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as String,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as State?,
      inspections: freezed == inspections
          ? _value._inspections
          : inspections // ignore: cast_nullable_to_non_nullable
              as List<Inspection>?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as CustomerResource?,
      car: null == car
          ? _value.car
          : car // ignore: cast_nullable_to_non_nullable
              as Car,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RentalImpl implements _Rental {
  const _$RentalImpl(
      {required this.id,
      required this.code,
      required this.longitude,
      required this.latitude,
      required this.fromDate,
      required this.toDate,
      this.state,
      final List<Inspection>? inspections,
      this.customer,
      required this.car})
      : _inspections = inspections;

  factory _$RentalImpl.fromJson(Map<String, dynamic> json) =>
      _$$RentalImplFromJson(json);

  @override
  final int id;
  @override
  final String code;
  @override
  final double longitude;
  @override
  final double latitude;
  @override
  final String fromDate;
  @override
  final String toDate;
  @override
  final State? state;
  final List<Inspection>? _inspections;
  @override
  List<Inspection>? get inspections {
    final value = _inspections;
    if (value == null) return null;
    if (_inspections is EqualUnmodifiableListView) return _inspections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final CustomerResource? customer;
  @override
  final Car car;

  @override
  String toString() {
    return 'Rental(id: $id, code: $code, longitude: $longitude, latitude: $latitude, fromDate: $fromDate, toDate: $toDate, state: $state, inspections: $inspections, customer: $customer, car: $car)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RentalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.fromDate, fromDate) ||
                other.fromDate == fromDate) &&
            (identical(other.toDate, toDate) || other.toDate == toDate) &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality()
                .equals(other._inspections, _inspections) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.car, car) || other.car == car));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      code,
      longitude,
      latitude,
      fromDate,
      toDate,
      state,
      const DeepCollectionEquality().hash(_inspections),
      customer,
      car);

  /// Create a copy of Rental
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RentalImplCopyWith<_$RentalImpl> get copyWith =>
      __$$RentalImplCopyWithImpl<_$RentalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RentalImplToJson(
      this,
    );
  }
}

abstract class _Rental implements Rental {
  const factory _Rental(
      {required final int id,
      required final String code,
      required final double longitude,
      required final double latitude,
      required final String fromDate,
      required final String toDate,
      final State? state,
      final List<Inspection>? inspections,
      final CustomerResource? customer,
      required final Car car}) = _$RentalImpl;

  factory _Rental.fromJson(Map<String, dynamic> json) = _$RentalImpl.fromJson;

  @override
  int get id;
  @override
  String get code;
  @override
  double get longitude;
  @override
  double get latitude;
  @override
  String get fromDate;
  @override
  String get toDate;
  @override
  State? get state;
  @override
  List<Inspection>? get inspections;
  @override
  CustomerResource? get customer;
  @override
  Car get car;

  /// Create a copy of Rental
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RentalImplCopyWith<_$RentalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
