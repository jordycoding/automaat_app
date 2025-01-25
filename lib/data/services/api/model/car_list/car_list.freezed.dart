// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CarList {
  List<Car> get data => throw _privateConstructorUsedError;

  /// Create a copy of CarList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarListCopyWith<CarList> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarListCopyWith<$Res> {
  factory $CarListCopyWith(CarList value, $Res Function(CarList) then) =
      _$CarListCopyWithImpl<$Res, CarList>;
  @useResult
  $Res call({List<Car> data});
}

/// @nodoc
class _$CarListCopyWithImpl<$Res, $Val extends CarList>
    implements $CarListCopyWith<$Res> {
  _$CarListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CarList
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
abstract class _$$CarListImplCopyWith<$Res> implements $CarListCopyWith<$Res> {
  factory _$$CarListImplCopyWith(
          _$CarListImpl value, $Res Function(_$CarListImpl) then) =
      __$$CarListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Car> data});
}

/// @nodoc
class __$$CarListImplCopyWithImpl<$Res>
    extends _$CarListCopyWithImpl<$Res, _$CarListImpl>
    implements _$$CarListImplCopyWith<$Res> {
  __$$CarListImplCopyWithImpl(
      _$CarListImpl _value, $Res Function(_$CarListImpl) _then)
      : super(_value, _then);

  /// Create a copy of CarList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$CarListImpl(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Car>,
    ));
  }
}

/// @nodoc

class _$CarListImpl implements _CarList {
  _$CarListImpl(final List<Car> data) : _data = data;

  final List<Car> _data;
  @override
  List<Car> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'CarList(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarListImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of CarList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarListImplCopyWith<_$CarListImpl> get copyWith =>
      __$$CarListImplCopyWithImpl<_$CarListImpl>(this, _$identity);
}

abstract class _CarList implements CarList {
  factory _CarList(final List<Car> data) = _$CarListImpl;

  @override
  List<Car> get data;

  /// Create a copy of CarList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarListImplCopyWith<_$CarListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Car _$CarFromJson(Map<String, dynamic> json) {
  return _Car.fromJson(json);
}

/// @nodoc
mixin _$Car {
  int get id => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  String get picture => throw _privateConstructorUsedError;
  String get pictureContentType => throw _privateConstructorUsedError;
  String get fuel => throw _privateConstructorUsedError;
  String get options => throw _privateConstructorUsedError;
  String get licensePlate => throw _privateConstructorUsedError;
  int get engineSize => throw _privateConstructorUsedError;
  int get modelYear => throw _privateConstructorUsedError;
  DateTime get since => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get nrOfSeats => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;

  /// Serializes this Car to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Car
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarCopyWith<Car> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarCopyWith<$Res> {
  factory $CarCopyWith(Car value, $Res Function(Car) then) =
      _$CarCopyWithImpl<$Res, Car>;
  @useResult
  $Res call(
      {int id,
      String brand,
      String model,
      String picture,
      String pictureContentType,
      String fuel,
      String options,
      String licensePlate,
      int engineSize,
      int modelYear,
      DateTime since,
      double price,
      int nrOfSeats,
      String body,
      double longitude,
      double latitude});
}

/// @nodoc
class _$CarCopyWithImpl<$Res, $Val extends Car> implements $CarCopyWith<$Res> {
  _$CarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Car
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? brand = null,
    Object? model = null,
    Object? picture = null,
    Object? pictureContentType = null,
    Object? fuel = null,
    Object? options = null,
    Object? licensePlate = null,
    Object? engineSize = null,
    Object? modelYear = null,
    Object? since = null,
    Object? price = null,
    Object? nrOfSeats = null,
    Object? body = null,
    Object? longitude = null,
    Object? latitude = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      pictureContentType: null == pictureContentType
          ? _value.pictureContentType
          : pictureContentType // ignore: cast_nullable_to_non_nullable
              as String,
      fuel: null == fuel
          ? _value.fuel
          : fuel // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as String,
      licensePlate: null == licensePlate
          ? _value.licensePlate
          : licensePlate // ignore: cast_nullable_to_non_nullable
              as String,
      engineSize: null == engineSize
          ? _value.engineSize
          : engineSize // ignore: cast_nullable_to_non_nullable
              as int,
      modelYear: null == modelYear
          ? _value.modelYear
          : modelYear // ignore: cast_nullable_to_non_nullable
              as int,
      since: null == since
          ? _value.since
          : since // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      nrOfSeats: null == nrOfSeats
          ? _value.nrOfSeats
          : nrOfSeats // ignore: cast_nullable_to_non_nullable
              as int,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarImplCopyWith<$Res> implements $CarCopyWith<$Res> {
  factory _$$CarImplCopyWith(_$CarImpl value, $Res Function(_$CarImpl) then) =
      __$$CarImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String brand,
      String model,
      String picture,
      String pictureContentType,
      String fuel,
      String options,
      String licensePlate,
      int engineSize,
      int modelYear,
      DateTime since,
      double price,
      int nrOfSeats,
      String body,
      double longitude,
      double latitude});
}

/// @nodoc
class __$$CarImplCopyWithImpl<$Res> extends _$CarCopyWithImpl<$Res, _$CarImpl>
    implements _$$CarImplCopyWith<$Res> {
  __$$CarImplCopyWithImpl(_$CarImpl _value, $Res Function(_$CarImpl) _then)
      : super(_value, _then);

  /// Create a copy of Car
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? brand = null,
    Object? model = null,
    Object? picture = null,
    Object? pictureContentType = null,
    Object? fuel = null,
    Object? options = null,
    Object? licensePlate = null,
    Object? engineSize = null,
    Object? modelYear = null,
    Object? since = null,
    Object? price = null,
    Object? nrOfSeats = null,
    Object? body = null,
    Object? longitude = null,
    Object? latitude = null,
  }) {
    return _then(_$CarImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      pictureContentType: null == pictureContentType
          ? _value.pictureContentType
          : pictureContentType // ignore: cast_nullable_to_non_nullable
              as String,
      fuel: null == fuel
          ? _value.fuel
          : fuel // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as String,
      licensePlate: null == licensePlate
          ? _value.licensePlate
          : licensePlate // ignore: cast_nullable_to_non_nullable
              as String,
      engineSize: null == engineSize
          ? _value.engineSize
          : engineSize // ignore: cast_nullable_to_non_nullable
              as int,
      modelYear: null == modelYear
          ? _value.modelYear
          : modelYear // ignore: cast_nullable_to_non_nullable
              as int,
      since: null == since
          ? _value.since
          : since // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      nrOfSeats: null == nrOfSeats
          ? _value.nrOfSeats
          : nrOfSeats // ignore: cast_nullable_to_non_nullable
              as int,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarImpl implements _Car {
  _$CarImpl(
      {required this.id,
      required this.brand,
      required this.model,
      required this.picture,
      required this.pictureContentType,
      required this.fuel,
      required this.options,
      required this.licensePlate,
      required this.engineSize,
      required this.modelYear,
      required this.since,
      required this.price,
      required this.nrOfSeats,
      required this.body,
      required this.longitude,
      required this.latitude});

  factory _$CarImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarImplFromJson(json);

  @override
  final int id;
  @override
  final String brand;
  @override
  final String model;
  @override
  final String picture;
  @override
  final String pictureContentType;
  @override
  final String fuel;
  @override
  final String options;
  @override
  final String licensePlate;
  @override
  final int engineSize;
  @override
  final int modelYear;
  @override
  final DateTime since;
  @override
  final double price;
  @override
  final int nrOfSeats;
  @override
  final String body;
  @override
  final double longitude;
  @override
  final double latitude;

  @override
  String toString() {
    return 'Car(id: $id, brand: $brand, model: $model, picture: $picture, pictureContentType: $pictureContentType, fuel: $fuel, options: $options, licensePlate: $licensePlate, engineSize: $engineSize, modelYear: $modelYear, since: $since, price: $price, nrOfSeats: $nrOfSeats, body: $body, longitude: $longitude, latitude: $latitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.picture, picture) || other.picture == picture) &&
            (identical(other.pictureContentType, pictureContentType) ||
                other.pictureContentType == pictureContentType) &&
            (identical(other.fuel, fuel) || other.fuel == fuel) &&
            (identical(other.options, options) || other.options == options) &&
            (identical(other.licensePlate, licensePlate) ||
                other.licensePlate == licensePlate) &&
            (identical(other.engineSize, engineSize) ||
                other.engineSize == engineSize) &&
            (identical(other.modelYear, modelYear) ||
                other.modelYear == modelYear) &&
            (identical(other.since, since) || other.since == since) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.nrOfSeats, nrOfSeats) ||
                other.nrOfSeats == nrOfSeats) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      brand,
      model,
      picture,
      pictureContentType,
      fuel,
      options,
      licensePlate,
      engineSize,
      modelYear,
      since,
      price,
      nrOfSeats,
      body,
      longitude,
      latitude);

  /// Create a copy of Car
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarImplCopyWith<_$CarImpl> get copyWith =>
      __$$CarImplCopyWithImpl<_$CarImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarImplToJson(
      this,
    );
  }
}

abstract class _Car implements Car {
  factory _Car(
      {required final int id,
      required final String brand,
      required final String model,
      required final String picture,
      required final String pictureContentType,
      required final String fuel,
      required final String options,
      required final String licensePlate,
      required final int engineSize,
      required final int modelYear,
      required final DateTime since,
      required final double price,
      required final int nrOfSeats,
      required final String body,
      required final double longitude,
      required final double latitude}) = _$CarImpl;

  factory _Car.fromJson(Map<String, dynamic> json) = _$CarImpl.fromJson;

  @override
  int get id;
  @override
  String get brand;
  @override
  String get model;
  @override
  String get picture;
  @override
  String get pictureContentType;
  @override
  String get fuel;
  @override
  String get options;
  @override
  String get licensePlate;
  @override
  int get engineSize;
  @override
  int get modelYear;
  @override
  DateTime get since;
  @override
  double get price;
  @override
  int get nrOfSeats;
  @override
  String get body;
  @override
  double get longitude;
  @override
  double get latitude;

  /// Create a copy of Car
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarImplCopyWith<_$CarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
