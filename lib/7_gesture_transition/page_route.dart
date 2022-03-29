import 'package:flutter/material.dart';

import 'animation/animation.dart';

class CustomPageRoute<T> extends PageRouteBuilder<T> {
  CustomPageRoute({
    required WidgetBuilder builder,
    this.forwardDurationInMilliseconds = 300,
    this.backwardDurationInMilliseconds = 300,
  }) : super(
          pageBuilder: (context, animation1, animation2) => builder(context),
          transitionDuration:
              Duration(milliseconds: forwardDurationInMilliseconds),
          reverseTransitionDuration:
              Duration(milliseconds: backwardDurationInMilliseconds),
          transitionsBuilder: (context, animation1, animation2, child) {
            return CircularRevealAnimation(
              animation: CurvedAnimation(
                parent: animation1,
                curve: Curves.easeInOut,
              ),
              centerAlignment: Alignment.bottomRight,
              child: child,
            );
          },
          opaque: false,
        );

  final int forwardDurationInMilliseconds;
  final int backwardDurationInMilliseconds;
}
