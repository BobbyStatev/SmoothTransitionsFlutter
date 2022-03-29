import 'package:flutter/material.dart';

import 'animation/animation.dart';

class MyNavigator {
  static void pushWithTransition(
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
        fullscreenDialog: true,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return CircularRevealAnimation(
            animation: CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
            centerAlignment: Alignment.bottomRight,
            child: child,
          );
        },
      ),
    );
  }
}
