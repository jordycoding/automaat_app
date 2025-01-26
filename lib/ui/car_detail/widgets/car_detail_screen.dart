import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      body: const Placeholder(), 
    );
  }
}