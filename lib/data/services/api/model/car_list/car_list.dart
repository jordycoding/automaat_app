import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_list.freezed.dart';
part 'car_list.g.dart';

@freezed
abstract class CarList with _$CarList {
  factory CarList(List<Car> data) = _CarList;

  factory CarList.fromJson(List<dynamic> json) {
    return CarList(json.map((e) => Car.fromJson(e as Map<String, dynamic>)).toList());
  }
}

@freezed
abstract class Car with _$Car {
  factory Car({
    required int id,
    required String brand,
    required String model,
    required String picture,
    required String fuel, 
    required double price,
    required String pictureContentType,
    required String options,
    required String licensePlate,
    required int engineSize,
    required int modelYear,
    required DateTime since,
    required int nrOfSeats,
    required String body, 
    required double latitude,
  }) = _Car;

  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);
}