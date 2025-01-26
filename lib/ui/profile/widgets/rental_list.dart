import 'package:automaat_app/data/services/api/model/rental/rental.dart';
import 'package:flutter/material.dart';

class RentalList extends StatelessWidget {
  const RentalList({super.key, required this.rentals, this.onClick});

  final List<Rental> rentals;
  final Function(dynamic item)? onClick;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rentals.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = rentals[index];
        return Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.car_rental),
                title: Text(item.car != null
                    ? "${item.car!.brand} ${item.car!.model} (${item.car!.modelYear})"
                    : "Rental ${item.code}"),
                subtitle: Text(
                    "From ${item.fromDate} ${item.toDate} ${item.state?.name[0].toUpperCase()}${item.state?.name.substring(1)}"),
                onTap: () {
                  if (onClick != null) {
                    onClick!(item);
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }
}
