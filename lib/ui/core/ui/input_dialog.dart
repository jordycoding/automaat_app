import 'package:flutter/material.dart';

TextEditingController _textFieldController = TextEditingController();
TextEditingController _textFieldController2 = TextEditingController();

Future<(String?, String?)?> displayInputDialog(BuildContext context,
    [String? title,
    String? placeholder,
    bool? secondTextBox = false,
    String? placeholder2,
    bool? numInput = false]) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title ?? "Input"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _textFieldController,
              keyboardType:
                  numInput! ? TextInputType.number : TextInputType.text,
              decoration: InputDecoration(hintText: placeholder ?? ""),
            ),
            if (secondTextBox!) ...[
              const SizedBox(height: 10),
              TextField(
                controller: _textFieldController2,
                keyboardType:
                    numInput! ? TextInputType.number : TextInputType.text,
                decoration: InputDecoration(hintText: placeholder2 ?? ""),
              ),
            ],
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.pop(context, null);
            },
          ),
          TextButton(
            child: const Text("Ok"),
            onPressed: () {
              final text = _textFieldController.value.text;
              final text2 = _textFieldController2.value.text;
              _textFieldController.clear();
              _textFieldController2.clear();
              Navigator.pop(context, (text, text2));
            },
          )
        ],
      );
    },
  );
}
