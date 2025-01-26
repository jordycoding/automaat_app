import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:automaat_app/config/constants.dart';
import 'package:automaat_app/ui/car_detail/view_model/car_detail_viewmodel.dart';
import 'package:automaat_app/data/services/api/model/car_list/car_list.dart';
import 'package:automaat_app/routing/app_routes.dart';

class CarDetailScreen extends StatelessWidget {
  const CarDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auto details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(AppRoutes.carList),
        ),
      ),
      body: Consumer<CarDetailViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (vm.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Fout bij het laden'),
                  Text(
                    vm.error?.toString() ?? 'Unknown error',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: vm.refresh,
                    child: const Text('Probeer opnieuw'),
                  ),
                ],
              ),
            );
          }

          final car = vm.car;
          if (car == null) {
            return const Center(child: Text('Auto niet gevonden'));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: _CarDetailTable(car: car),
          );
        },
      ),
    );
  }
}

class _CarDetailTable extends StatelessWidget {
  final Car car;

  const _CarDetailTable({required this.car});

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {0: FixedColumnWidth(150), 1: FlexColumnWidth()},
      border: TableBorder.all(color: Colors.grey.shade300),
      children: [
        _buildRow('Merk', car.brand),
        _buildRow('Model', car.model),
        _buildRow('Kenteken', car.licensePlate),
        _buildRow('Brandstof', car.fuel),
        _buildRow('Carrosserie', car.body),
        _buildRow('Motorinhoud', '${car.engineSize} cc'),
        _buildRow('Bouwjaar', car.modelYear.toString()),
        _buildRow('Zitplaatsen', car.nrOfSeats.toString()),
        _buildRow('Dagprijs', '€${car.price.toStringAsFixed(2)}'),
        _buildRow('Opties', car.options ?? 'Geen'),
        _buildRow('In gebruik sinds', car.since.toString()),
        _buildRow('Locatie', '${car.latitude}, ${car.longitude}'),
      ],
    );
  }

  TableRow _buildRow(String label, String value) {
    return TableRow(
      decoration: BoxDecoration(color: Colors.grey.shade50),
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(value),
        ),
      ],
    );
  }
}