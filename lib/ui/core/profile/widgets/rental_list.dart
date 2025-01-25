import 'package:automaat_app/data/services/api/model/rental/rental.dart';
import 'package:flutter/material.dart';

class RentalList extends StatelessWidget {
  const RentalList({super.key, required this.rentals});

  final List<Rental> rentals;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
