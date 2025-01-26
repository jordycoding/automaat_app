import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:automaat_app/routing/app_routes.dart';
import 'package:automaat_app/config/constants.dart';
import 'package:automaat_app/ui/car_list/view_model/car_list_viewmodel.dart';
import 'dart:convert';
import 'dart:typed_data';

class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Available cars')),
      body: Consumer<CarListViewModel>(
        builder: (context, viewModel, _) {
          if (viewModel.isLoading && viewModel.cars.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${viewModel.error}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => viewModel.loadCars(),
                    child: const Text('Reload'),
                  ),
                ],
              ),
            );
          }

          if (viewModel.cars.isEmpty) {
            return const Center(child: Text('No cars available'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: viewModel.cars.length,
            itemBuilder: (context, index) => Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                onTap: () {
                  final carId = viewModel.cars[index].id;
                  context.go('${AppRoutes.carDetails}/$carId');
                },
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: viewModel.cars[index].picture.isNotEmpty
                      ? _buildBase64Image(viewModel.cars[index].picture)
                      : const Icon(Icons.directions_car, size: 30),
                ),
                title: Text(
                  '${viewModel.cars[index].brand} ${viewModel.cars[index].model}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text(
                      '€${viewModel.cars[index].price.toStringAsFixed(2)}/day',
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Fuel: ${viewModel.cars[index].fuel}',
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                minVerticalPadding: 0,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBase64Image(String base64String) {
    try {
      return Image.memory(
        base64Decode(base64String),
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.grey[200],
          child: const Icon(Icons.error_outline, color: Colors.red),
        ),
      );
    } catch (e) {
      return Container(
        color: Colors.grey[200],
        child: const Icon(Icons.error_outline, color: Colors.red),
      );
    }
  }
}