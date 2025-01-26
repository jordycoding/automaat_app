import 'dart:convert';
import 'dart:typed_data';

import 'package:automaat_app/data/services/api/model/rental/rental.dart';
import 'package:automaat_app/routing/app_routes.dart';
import 'package:automaat_app/ui/profile/view_models/rental_detail_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

class RentalDetailScreen extends StatefulWidget {
  final Rental rental;
  final RentalDetailViewmodel viewModel;

  const RentalDetailScreen(
      {super.key, required this.rental, required this.viewModel});

  @override
  State<RentalDetailScreen> createState() => _RentalDetailScreenState();
}

class _RentalDetailScreenState extends State<RentalDetailScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.deleteRental.addListener(_onResult);
  }

  @override
  void didUpdateWidget(covariant RentalDetailScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.deleteRental.removeListener(_onResult);
    widget.viewModel.deleteRental.addListener(_onResult);
  }

  @override
  void dipsose() {
    widget.viewModel.deleteRental.removeListener(_onResult);
    super.dispose();
  }

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
              Text("Location", style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 5),
              if (widget.rental.latitude.isFinite &&
                  widget.rental.longitude.isFinite &&
                  !widget.rental.latitude.isNaN &&
                  !widget.rental.longitude.isNaN)
                Container(
                  height: 600,
                  alignment: Alignment.center,
    padding: const EdgeInsets.all(16.0),
                  child: FlutterMap(
                    options: MapOptions(
                        initialCenter: LatLng(
                            widget.rental.latitude, widget.rental.longitude),
                        initialZoom: 9),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: "com.example.automaat_app",
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: LatLng(widget.rental.latitude,
                                widget.rental.longitude),
                            width: 60,
                            height: 60,
                            child: const Icon(
                              Icons.car_rental,
                              size: 60,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FilledButton(
                    onPressed: () {
                      context.push(AppRoutes.rentalInspection,
                          extra: widget.rental.toJson());
                    },
                    child: const Text("File inspection"),
                  ),
                  FilledButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Delete rental?"),
                            content: const Text(
                                "Are you sure you want to delete the rental? This cannot be undone."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  widget.viewModel.deleteRental
                                      .execute(widget.rental.id);
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Yes"),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("No"))
                            ],
                          );
                        },
                      );
                    },
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

  void _onResult() async {
    if (widget.viewModel.deleteRental.completed) {
      widget.viewModel.deleteRental.clearResult();
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Success"),
            content: const Text("The rental has been deleted"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  context.pop();
                },
                child: const Text("Ok"),
              ),
            ],
          );
        },
      );
    }
    if (widget.viewModel.deleteRental.error) {
      widget.viewModel.deleteRental.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("There was an error deleting the rental"),
        ),
      );
    }
  }
}
