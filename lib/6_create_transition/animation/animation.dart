import 'package:flutter/material.dart';
import 'clipper.dart';

class CircularRevealAnimation extends StatelessWidget {
  const CircularRevealAnimation({
    required this.animation,
    required this.child,
    this.centerAlignment,
    this.centerOffset,
    this.minRadius,
    this.maxRadius,
    Key? key,
  }) : super(key: key);

  final Alignment? centerAlignment;
  final Offset? centerOffset;
  final double? minRadius;
  final double? maxRadius;
  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? _) {
        return ClipPath(
          clipper: CircularRevealClipper(
            fraction: animation.value,
            centerAlignment: centerAlignment,
            centerOffset: centerOffset,
            minRadius: minRadius,
            maxRadius: maxRadius,
          ),
          child: child,
        );
      },
    );
  }
}
