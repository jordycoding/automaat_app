part of 'car_data.dart';

class Car {
  final int id;
  final String brand;
  final String model;
  final String picture;
  final String fuel;
  final double price;

  Car({
    required this.id,
    required this.brand,
    required this.model,
    required this.picture,
    required this.fuel,
    required this.price,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'],
      brand: json['brand'],
      model: json['model'],
      picture: json['picture'] ?? '',
      fuel: json['fuel'],
      price: json['price'].toDouble(),
    );
  }
}