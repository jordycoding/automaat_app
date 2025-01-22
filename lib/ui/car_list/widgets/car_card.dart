import 'package:flutter/material.dart';
import '/data/services/api/model/register_request/car_data.dart';

class CarCard extends StatelessWidget {
  final Car car;

  const CarCard({Key? key, required this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: car.picture.isNotEmpty
            ? Image.network('https://jouwbackend.nl/${car.picture}')
            : Icon(Icons.car_repair, size: 50),
        title: Text('${car.brand} ${car.model}'),
        subtitle: Text('Prijs: €${car.price.toStringAsFixed(2)}\nBrandstof: ${car.fuel}'),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          // Voeg navigatie toe naar detailscherm indien nodig
        },
      ),
    );
  }
}
