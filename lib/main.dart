import 'package:automaat_app/config/dependencies.dart';
import 'package:automaat_app/data/repositories/car_list/car_repository.dart';
import 'package:automaat_app/data/services/api/api_client.dart';
import 'package:automaat_app/routing/app_routes.dart';
import 'package:automaat_app/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ...providers, 
        Provider(
          create: (context) => CarRepository(context.read<ApiClient>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Automaat App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router(context.read()),
    );
  }
}