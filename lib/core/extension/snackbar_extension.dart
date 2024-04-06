import 'package:flutter/material.dart';

extension CustomSnackbar on BuildContext {
  void showCustomSnackBar(String message) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
  }
}
