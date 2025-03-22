import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:automaat_app/ui/car_list/view_model/car_list_viewmodel.dart';

class CarListScreen extends StatefulWidget {
  const CarListScreen({Key? key}) : super(key: key);

  @override
  State<CarListScreen> createState() => _CarListScreenState();
}

class _CarListScreenState extends State<CarListScreen> {
  String? _selectedMake;
  String? _selectedBody;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CarListViewModel>();
    final allMakes = viewModel.availableMakes;
    final allBodies = viewModel.availableBodies;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Cars'),
      ),
      body: Column(
        children: [
          _buildFilterRow(viewModel, allMakes, allBodies),
          Expanded(child: _buildCarList(viewModel)),
        ],
      ),
    );
  }

  Widget _buildFilterRow(
    CarListViewModel viewModel,
    List<String> allMakes,
    List<String> allBodies,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: DropdownButton<String?>(
              isExpanded: true,
              value: _selectedMake,
              hint: const Text('Select Make'),
              items: [
                const DropdownMenuItem(value: null, child: Text('All Makes')),
                ...allMakes.map((make) => DropdownMenuItem(
                      value: make,
                      child: Text(make),
                    )),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedMake = value;
                });
                viewModel.filterCars(
                  make: _selectedMake,
                  body: _selectedBody,
                );
              },
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: DropdownButton<String?>(
              isExpanded: true,
              value: _selectedBody,
              hint: const Text('Select Body'),
              items: [
                const DropdownMenuItem(value: null, child: Text('All Bodies')),
                ...allBodies.map((body) => DropdownMenuItem(
                      value: body,
                      child: Text(body),
                    )),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedBody = value;
                });
                viewModel.filterCars(
                  make: _selectedMake,
                  body: _selectedBody,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarList(CarListViewModel viewModel) {
    if (viewModel.isLoading && viewModel.cars.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    if (viewModel.error != null) {
      return Center(child: Text('Error: ${viewModel.error}'));
    }
    if (viewModel.cars.isEmpty) {
      return const Center(child: Text('No cars available'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: viewModel.cars.length,
      itemBuilder: (context, index) {
        final car = viewModel.cars[index];
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            title: Text('${car.brand} ${car.model}'),
            subtitle: Text('Price: €${car.price}/day, Fuel: ${car.fuel}'),
            onTap: () {
              context.push('/car-details/${car.id}');
            },
          ),
        );
      },
    );
  }
}
