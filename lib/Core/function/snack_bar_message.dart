import 'package:flutter/material.dart';

void snackBarMessage({
  required BuildContext context,
  required String text,
  Color? backgroundColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(text), backgroundColor: backgroundColor),
  );
}
