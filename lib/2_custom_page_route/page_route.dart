import 'package:flutter/material.dart';

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
            return FadeTransition(opacity: animation1, child: child);
          },
        );

  final int forwardDurationInMilliseconds;
  final int backwardDurationInMilliseconds;
}
