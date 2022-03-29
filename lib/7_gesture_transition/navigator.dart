import 'package:flutter/material.dart';
import 'page_route.dart';

class MyNavigator {
  static void pushWithTransition(
    BuildContext context, {
    required Widget toScreen,
    required int forwardDurationInMilliseconds,
    required int backwardDurationInMilliseconds,
  }) {
    Navigator.push(
      context,
      CustomPageRoute(
        builder: (context) => toScreen,
      ),
    );
  }
}
