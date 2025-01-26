import 'dart:convert';
import 'dart:typed_data';

import 'package:automaat_app/data/services/api/model/rental/rental.dart';
import 'package:flutter/material.dart';

class RentalDetailScreen extends StatefulWidget {
  final Rental rental;

  const RentalDetailScreen({super.key, required this.rental});

  @override
  State<RentalDetailScreen> createState() => _RentalDetailScreenState();
}

class _RentalDetailScreenState extends State<RentalDetailScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime toDate = DateTime.parse(widget.rental.toDate);
    DateTime currentDate = DateTime.now();

    Duration diff = currentDate.difference(toDate);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Rental ${widget.rental.code}",
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 10),
              Text("Car", style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 5),
              Text(
                  "Model: ${widget.rental.car?.brand} ${widget.rental.car?.model}"),
              Text(
                  "Fuel: ${widget.rental.car?.fuel[0].toUpperCase()}${widget.rental.car?.fuel.substring(1).toLowerCase()}"),
              Text("Price: €${widget.rental.car?.price}/day"),
              Text("Year: ${widget.rental.car?.modelYear}"),
              Text("License plate: ${widget.rental.car?.licensePlate}"),
              Text("No. of seats: ${widget.rental.car?.nrOfSeats}"),
              Text("Engine size: ${widget.rental.car?.engineSize}"),
              const SizedBox(height: 5),
              if (widget.rental.car?.picture != null &&
                  widget.rental.car!.picture.isNotEmpty)
                Image.memory(
                  _getPictureBytes(widget
                      .rental.car!.picture), // Convert base64 string to bytes
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200, // Adjust as needed
                ),
              const SizedBox(height: 10),
              Text("Rental", style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 5),
              Text("From: ${widget.rental.fromDate}"),
              Text("To: ${widget.rental.toDate} (${(diff.inDays).abs()} days)"),
              Text(
                  "State: ${widget.rental.state?.name[0].toUpperCase()}${widget.rental.state?.name.substring(1).toLowerCase()}"),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FilledButton(
                    onPressed: () {},
                    child: const Text("File inspection"),
                  ),
                  FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text("Delete rental"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Uint8List _getPictureBytes(String pictureBase64) {
    // Decode the base64 string to bytes
    return base64Decode(pictureBase64);
  }
}
