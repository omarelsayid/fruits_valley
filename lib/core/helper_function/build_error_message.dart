import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void buildErrorMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      content: Text(message),
    ),
  );
}
