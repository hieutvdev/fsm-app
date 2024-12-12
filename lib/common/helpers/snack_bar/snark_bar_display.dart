import 'package:flutter/material.dart';

class SnackBarDisplay {
  static void show(BuildContext context, String message,
      {Color? backgroundColor, Color? textColor, Duration? duration}) {
    final snackBar = SnackBar(
      content:
          Text(message, style: TextStyle(color: textColor ?? Colors.white)),
      backgroundColor: backgroundColor ?? Colors.black,
      duration: duration ?? const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showSuccess(BuildContext context, String message) {
    show(context, message, backgroundColor: Colors.green);
  }

  static void showError(BuildContext context, String message) {
    show(context, message, backgroundColor: Colors.red);
  }

  static void showInfo(BuildContext context, String message) {
    show(context, message, backgroundColor: Colors.blue);
  }

  static void showWarning(BuildContext context, String message) {
    show(context, message, backgroundColor: Colors.orange);
  }
}
