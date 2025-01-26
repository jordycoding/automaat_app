import 'dart:convert';
import 'dart:io';

import 'package:automaat_app/data/services/api/model/rental/rental.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InspectionScreen extends StatefulWidget {
  final Rental rental;

  const InspectionScreen({super.key, required this.rental});

  @override
  State<InspectionScreen> createState() => _InspectionScreen();
}

class _InspectionScreen extends State<InspectionScreen> {
  DateTime selectedDate = DateTime.now();
  File? _imageFile;
  String? _imageBase64;
  String? _imageContentType;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _odometerController = TextEditingController();
  final TextEditingController _resultController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String? _validateImage() {
    if (_imageFile == null) {
      return 'Please select an image';
    }
    return null;
  }

  String? _validateDate() {
    if (selectedDate == DateTime.now()) {
      return 'Please select a valid date';
    }
    return null;
  }

  Future<void> _pickDate() async {
    final DateTime picked = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(2024),
            lastDate: DateTime(2026)) ??
        selectedDate;

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      final File imageFile = File(pickedImage.path);

      // Convert image to Base64
      final bytes = await imageFile.readAsBytes();
      final String base64Image = base64Encode(bytes);

      setState(() {
        _imageFile = imageFile;
        _imageBase64 = base64Image;
        _imageContentType = _getMimeType(pickedImage.path);
      });
    }
  }

  String _getMimeType(String path) {
    if (path.endsWith('.png')) {
      return 'image/png';
    } else if (path.endsWith('.jpg') || path.endsWith('.jpeg')) {
      return 'image/jpeg';
    }
    return 'application/octet-stream'; // Default fallback
  }

  @override
  Widget build(BuildContext context) {
    final rental = widget.rental;
    return Scaffold(
      appBar: AppBar(
        title: Text("File inspection for ${rental.code}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: _codeController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: "Code",
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a code";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _odometerController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: "Odometer",
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a odometer";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _resultController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: "Result",
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a result";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: "Description",
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a description";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Date",
                ),
                controller: TextEditingController(
                    text: selectedDate.toLocal().toString().split(' ')[0]),
                readOnly: true,
                onTap: _pickDate,
                validator: (String? value) => _validateDate(),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: TextEditingController(text: _imageFile?.path),
                decoration: const InputDecoration(
                  labelText: 'Image',
                ),
                validator: (String? value) => _validateImage(),
                readOnly: true,
                onTap: _pickImage,
              ),
              if (_imageBase64 != null)
                Image.memory(
                  base64Decode(_imageBase64!),
                  height: 200, // Adjust the height of the image as needed
                  width: double.infinity, // Or set a specific width
                  fit: BoxFit.cover,
                ),
              const SizedBox(height: 20),
              FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(40),
                ),
                onPressed: () {
                  _formKey.currentState!.validate();
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
