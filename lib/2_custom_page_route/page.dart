import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

import '../second_screen.dart';
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

  Widget buildSegment(String text) {
    return Text(
      text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          CupertinoSlidingSegmentedControl<int>(
            padding: const EdgeInsets.all(8),
            groupValue: 0,
            children: {
              0: buildSegment("PageRouteBuilder"),
              1: buildSegment("expand PageRoute"),
            },
            onValueChanged: (value) {
              usePageRouteBuilder = (value == 0);
            },
          ),
          ListTile(
            title: const Text('Forward duration'),
            trailing: SizedBox(
              width: 140,
              child: SpinBox(
                min: 0,
                max: 2000,
                value: 500,
                step: 100,
                onChanged: (value) => forwardDuration = value.toInt(),
              ),
            ),
          ),
          ListTile(
            title: const Text('Backward duration'),
            trailing: SizedBox(
              width: 140,
              child: SpinBox(
                min: 0,
                max: 2000,
                value: 500,
                step: 100,
                onChanged: (value) => backwardDuration = value.toInt(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (usePageRouteBuilder) {
                MyNavigator.pushUsingPageRouteBuilder(
                  context,
                  toScreen: const SecondScreen(),
                  forwardDurationInMilliseconds: forwardDuration,
                  backwardDurationInMilliseconds: backwardDuration,
                );
              } else {
                MyNavigator.pushUsingCustomPageRoute(
                  context,
                  toScreen: const SecondScreen(),
                  forwardDurationInMilliseconds: forwardDuration,
                  backwardDurationInMilliseconds: backwardDuration,
                );
              }
            },
            child: const Text('Navigate'),
          )
        ],
      ),
    );
  }
}
