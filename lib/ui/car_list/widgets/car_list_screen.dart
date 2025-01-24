import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/car_list_viewmodel.dart';
import 'car_card.dart';

class CarListScreen extends StatefulWidget {
  const CarListScreen({super.key});

  @override
  State<CarListScreen> createState() => _CarListScreenState();
}

class _CarListScreenState extends State<CarListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CarListViewModel>().loadCars();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beschikbare Auto\'s'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<CarListViewModel>().loadCars(forceRefresh: true),
          ),
        ],
      ),
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
                  Text('Fout: ${viewModel.error}'),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => viewModel.loadCars(),
                    child: const Text('Probeer opnieuw'),
                  ),
                ],
              ),
            );
          }

          if (viewModel.cars.isEmpty) {
            return const Center(child: Text('Geen auto\'s beschikbaar'));
          }

          return RefreshIndicator(
            onRefresh: () => viewModel.loadCars(forceRefresh: true),
            child: ListView.builder(
              itemCount: viewModel.cars.length,
              itemBuilder: (context, index) => CarCard(car: viewModel.cars[index]),
            ),
          );
        },
      ),
    );
  }
}