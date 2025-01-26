import 'package:automaat_app/data/services/api/model/rental/rental.dart';
import 'package:flutter/material.dart';

class InspectionScreen extends StatefulWidget {
  final Rental rental;

  const InspectionScreen({super.key, required this.rental});

  @override
  State<InspectionScreen> createState() => _InspectionScreen();
}

class _InspectionScreen extends State<InspectionScreen> {
  @override
  Widget build(BuildContext context) {
    final rental = widget.rental;
    return Scaffold(
      appBar: AppBar(
        title: Text("File inspection for ${rental.code}"),
      ),
    );
  }
}
