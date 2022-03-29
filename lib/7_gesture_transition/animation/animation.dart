import 'package:flutter/material.dart';
import 'clipper.dart';

class CircularRevealAnimation extends StatefulWidget {
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
  State<CircularRevealAnimation> createState() =>
      _CircularRevealAnimationState();
}

class _CircularRevealAnimationState extends State<CircularRevealAnimation>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  final GlobalKey _childKey = GlobalKey();
  static const double _kMinFlingVelocity = 1.0;

  double get _childHeight {
    final RenderBox renderBox =
        _childKey.currentContext!.findRenderObject()! as RenderBox;
    return renderBox.size.height;
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
  }

  void _handleDragStart(DragStartDetails details) {
    Navigator.of(context).didStartUserGesture();
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    setState(() {
      _animationController.value += details.primaryDelta! / _childHeight;
    });
  }

  void _handleDragEnd(DragEndDetails details, {bool? isClosing}) {
    final bool animateForward;

    // If the user releases the page before mid screen with sufficient velocity,
    // or after mid screen, we should animate the page out. Otherwise, the page
    // should be animated back in.
    if (details.velocity.pixelsPerSecond.direction >= _kMinFlingVelocity) {
      animateForward = details.velocity.pixelsPerSecond.distance > 0;
    } else {
      animateForward = _animationController.value > 0.5;
    }
    if (animateForward) {
      Navigator.pop(context);
    } else {
      _animationController.animateBack(
        0.0,
        duration: const Duration(milliseconds: 200),
      );
    }
    Navigator.of(context).didStopUserGesture();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragStart: _handleDragStart,
      onVerticalDragUpdate: _handleDragUpdate,
      onVerticalDragEnd: _handleDragEnd,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? _) {
          return ClipPath(
            key: _childKey,
            clipper: CircularRevealClipper(
              fraction: widget.animation.value - _animationController.value > 0
                  ? widget.animation.value - _animationController.value
                  : 0,
              centerAlignment: widget.centerAlignment,
              centerOffset: widget.centerOffset,
              minRadius: widget.minRadius,
              maxRadius: widget.maxRadius,
            ),
            child: widget.child,
          );
        },
      ),
    );
  }
}
