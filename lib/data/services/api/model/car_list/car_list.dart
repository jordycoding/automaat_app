import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_list.freezed.dart';
part 'car_list.g.dart';

@freezed
class Car with _$Car {
  const factory Car({
    required int id,
    required String brand,
    required String model,
    required String picture,
    required String fuel,
    required double price,
  }) = _Car;

  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);
}