import 'package:flutter/material.dart';

class MyNavigator {
  void push(
    BuildContext context, {
    required Widget toScreen,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => toScreen,
      ),
    );
  }
}
