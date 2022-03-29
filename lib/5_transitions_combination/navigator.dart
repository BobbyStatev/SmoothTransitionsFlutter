import 'package:flutter/material.dart';

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
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: Tween<double>(
                begin: 0.0,
                end: 0.5,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: const Interval(
                    0.0,
                    0.5,
                    curve: Curves.bounceInOut,
                  ),
                ),
              ),
              child: ScaleTransition(
                scale: Tween<double>(
                  begin: 1.8,
                  end: 2,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: const Interval(
                      0.50,
                      1.00,
                      curve: Curves.linear,
                    ),
                  ),
                ),
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1.0, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
