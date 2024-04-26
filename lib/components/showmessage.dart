import 'package:flutter/material.dart';

void showMessage(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: message.contains('Error') ? Colors.red : Colors.blue[200],
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
