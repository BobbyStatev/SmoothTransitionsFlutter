import 'package:flutter/material.dart';

enum ProvidedTransition {
  slide,
  fade,
  scale,
  rotation,
}

class MyNavigator {
  static void pushWithTransition(
    BuildContext context, {
    required Widget toScreen,
    required int forwardDurationInMilliseconds,
    required int backwardDurationInMilliseconds,
    required ProvidedTransition providedTransition,
    required Curve? curve,
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
          if (curve != null) {
            animation = CurvedAnimation(
              parent: animation,
              curve: curve,
            );
          }
          switch (providedTransition) {
            case ProvidedTransition.fade:
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            case ProvidedTransition.scale:
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            case ProvidedTransition.rotation:
              return RotationTransition(
                turns: animation,
                child: child,
              );
            case ProvidedTransition.slide:
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
          }
        },
      ),
    );
  }
}
