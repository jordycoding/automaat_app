import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:automaat_app/routing/app_routes.dart';
import 'package:automaat_app/ui/car_detail/view_model/car_detail_viewmodel.dart';
import 'package:automaat_app/data/services/api/model/car_list/car_list.dart';
import 'dart:convert';

class CarDetailScreen extends StatelessWidget {
  const CarDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(AppRoutes.carList),
        ),
      ),
      body: Consumer<CarDetailViewModel>(
        builder: (context, viewModel, _) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.error != null) {
            return Center(child: Text('Error: ${viewModel.error}'));
          }

          if (viewModel.car == null) {
            return const Center(child: Text('Car not found'));
          }

          return Column(
            children: [
              _buildCarDetails(context, viewModel.car!),
              _buildReservationSection(context, viewModel),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCarDetails(BuildContext context, Car car) {
  return Expanded(
    child: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Voeg hier de afbeelding toe
        SizedBox(
          height: 200, // Pas de hoogte aan naar wens
          child: car.picture.isNotEmpty
              ? Image.memory(
                  base64Decode(car.picture),
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[200],
                    child: const Icon(Icons.error_outline, color: Colors.red),
                  ),
                )
              : Container(
                  color: Colors.grey[200],
                  child: const Icon(Icons.directions_car, size: 50),
                ),
        ),
        const SizedBox(height: 16),
        // Bestaande details
        Text(car.model, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text('Year: ${car.modelYear}'),
        Text('Price per day: \$${car.price}'),
      ],
    ),
  );
}

  Widget _buildReservationSection(
      BuildContext context, CarDetailViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          if (viewModel.fromDate != null && viewModel.toDate != null)
            Text(
              'Selected: ${viewModel.fromDate!.toLocal().toString().split(' ')[0]} '
              '- ${viewModel.toDate!.toLocal().toString().split(' ')[0]}',
            ),
          if (viewModel.reservationError != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Error: ${viewModel.reservationError}',
                style: const TextStyle(color: Colors.red),
              ),
            ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => _showDatePicker(context, viewModel),
            child: const Text('Select Dates'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: viewModel.isReserving
                ? null
                : () => _confirmReservation(context, viewModel),
            child: viewModel.isReserving
                ? const CircularProgressIndicator()
                : const Text('Reserve Now'),
          ),
        ],
      ),
    );
  }

  Future<void> _showDatePicker(
      BuildContext context, CarDetailViewModel viewModel) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialDateRange: viewModel.fromDate != null && viewModel.toDate != null
          ? DateTimeRange(start: viewModel.fromDate!, end: viewModel.toDate!)
          : null,
    );

    if (picked != null) {
      viewModel.setDates(picked.start, picked.end);
    }
  }

  Future<void> _confirmReservation(
    BuildContext context, CarDetailViewModel viewModel) async {
  await viewModel.reserveCar();

  if (context.mounted) {
    final success = viewModel.reservationError == null;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          success
              ? 'Reservation successful!'
              : 'Failed to reserve: ${viewModel.reservationError}',
        ),
        backgroundColor: success ? Colors.green : Colors.red,
      ),
    );

    if (success) {
      context.go(AppRoutes.carList);
    }
  }
}
}