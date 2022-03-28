import 'package:flutter/material.dart';
import 'package:smooth_transitions/2_custom_page_route/page_route.dart';

class MyNavigator {
  static void pushUsingPageRouteBuilder(
    BuildContext context, {
    required Widget toScreen,
    required int forwardDurationInMilliseconds,
    required int backwardDurationInMilliseconds,
  }) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => toScreen,
        transitionDuration:
            Duration(milliseconds: forwardDurationInMilliseconds),
        reverseTransitionDuration:
            Duration(milliseconds: backwardDurationInMilliseconds),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  static void pushUsingCustomPageRoute(
    BuildContext context, {
    required Widget toScreen,
    required int forwardDurationInMilliseconds,
    required int backwardDurationInMilliseconds,
  }) {
    Navigator.push(
      context,
      CustomPageRoute(
        builder: (context) => toScreen,
        forwardDurationInMilliseconds: forwardDurationInMilliseconds,
        backwardDurationInMilliseconds: backwardDurationInMilliseconds,
      ),
    );
  }
}
