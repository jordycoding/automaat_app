import 'package:flutter/material.dart';

TextEditingController _textFieldController = TextEditingController();

Future<String?> displayInputDialog(BuildContext context,
    [String? title, String? placeholder]) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title ?? "Input"),
        content: TextField(
          controller: _textFieldController,
          decoration: InputDecoration(hintText: placeholder ?? ""),
        ),
        actions: <Widget>[
          TextButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.pop(context, null);
            },
          ),
          TextButton(
            child: Text("Ok"),
            onPressed: () {
              _textFieldController.clear();
              Navigator.pop(context, _textFieldController.value.text);
            },
          )
        ],
      );
    },
  );
}
