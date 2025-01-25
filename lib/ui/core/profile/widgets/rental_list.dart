import 'package:automaat_app/data/services/api/model/rental/rental.dart';
import 'package:flutter/material.dart';

class RentalList extends StatelessWidget {
  const RentalList({super.key, required this.rentals});

  final List<Rental> rentals;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rentals.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final item = rentals[index];
        return Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.car_rental),
                title: Text("${item.car.brand} ${item.car.model}"),
                subtitle: Text("From ${item.fromDate} ${item.toDate}"),
              )
            ],
          ),
        );
      },
    );
  }
}
