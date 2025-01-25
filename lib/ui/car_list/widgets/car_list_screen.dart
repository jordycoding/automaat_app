import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:automaat_app/config/constants.dart';
import 'package:automaat_app/ui/car_list/view_model/car_list_viewmodel.dart';

class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available cars'),
      ),
      body: Consumer<CarListViewModel>(
        builder: (context, viewModel, _) {
          // Toon laadindicator
          if (viewModel.isLoading && viewModel.cars.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          // Toon foutmelding
          if (viewModel.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${viewModel.error}'),
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
              child: ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: viewModel.cars[index].picture.isNotEmpty
                      ? Image.network(
                          '${AppConstants.serverUrl}/${viewModel.cars[index].picture}',
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.directions_car),
                ),
                title: Text(
                  '${viewModel.cars[index].brand} ${viewModel.cars[index].model}',
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text('€${viewModel.cars[index].price.toStringAsFixed(2)}/day'),
                    Text('Fuel: ${viewModel.cars[index].fuel}'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}