import 'package:flutter/material.dart';

void showErrorDialog( context, String? error,String? message) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(error ?? 'Error'),
      content: Text(message ?? 'An Unknown Error Occurred'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
