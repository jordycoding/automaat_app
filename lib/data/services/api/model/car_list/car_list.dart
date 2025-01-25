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
class Car with _$Car {
  factory Car({
    required int id,
    required String brand,
    required String model,
    required String picture,
    required String pictureContentType,
    required String fuel, 
    required String options,
    required String licensePlate,
    required int engineSize,
    required int modelYear,
    required DateTime since,
    required double price,
    required int nrOfSeats,
    required String body, 
    required double longitude,
    required double latitude,
  }) = _Car;

  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);
}
