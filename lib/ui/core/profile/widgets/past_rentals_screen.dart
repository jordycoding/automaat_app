import 'package:flutter/material.dart';

class PastRentalsScreen extends StatefulWidget {
  const PastRentalsScreen({super.key});

  @override
  State<PastRentalsScreen> createState() => _PastRentalsScreenState();
}

class _PastRentalsScreenState extends State<PastRentalsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Past rentals"),
      ),
      body: Column(),
    );
  }
}
