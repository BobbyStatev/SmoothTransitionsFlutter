import 'package:flutter/material.dart';
import 'package:positioned_tap_detector_2/positioned_tap_detector_2.dart';

import '../common/curve_model.dart';
import '../common/duration_spin_tile.dart';
import '../common/second_page.dart';
import 'navigator.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool usePageRouteBuilder = true;
  int forwardDuration = 1000;
  int backwardDuration = 1000;
  Offset? offset;

  CurveModel? selectedCurve;
  GlobalKey buttonKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MyNavigator.pushWithTransition(
            context,
            toScreen: const SecondPage(),
            forwardDurationInMilliseconds: forwardDuration,
            backwardDurationInMilliseconds: backwardDuration,
          );
        },
        child: const Icon(
          Icons.animation,
        ),
      ),
    );
  }
}
