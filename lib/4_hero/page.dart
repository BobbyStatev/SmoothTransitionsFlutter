import 'package:flutter/material.dart';

import '../common/curve_model.dart';
import '../common/data.dart';
import '../common/duration_spin_tile.dart';
import 'hero_page.dart';
import 'navigator.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int forwardDuration = 1000;
  int backwardDuration = 1000;
  ProvidedTransition transition = ProvidedTransition.scale;

  CurveModel? selectedCurve;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          DurationSpinTile(
            titleText: 'Forward duration (in milliseconds)',
            onChanged: (value) => forwardDuration = value.toInt(),
          ),
          DurationSpinTile(
            titleText: 'Backward duration (in milliseconds)',
            onChanged: (value) => backwardDuration = value.toInt(),
          ),
          ListTile(
            title: const Text('Transition'),
            trailing: DropdownButton<ProvidedTransition>(
              value: transition,
              items: ProvidedTransition.values
                  .map(
                    (item) => DropdownMenuItem<ProvidedTransition>(
                      value: item,
                      child: Text(item.name),
                    ),
                  )
                  .toList(),
              onChanged: (newTransition) {
                setState(() {
                  if (newTransition != null) {
                    transition = newTransition;
                  }
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Curve'),
            trailing: DropdownButton<CurveModel>(
              value: selectedCurve,
              items: Data.curves
                  .map(
                    (item) => DropdownMenuItem<CurveModel>(
                      value: item,
                      child: item != null ? Text(item.name) : const SizedBox(),
                    ),
                  )
                  .toList(),
              onChanged: (newCurve) {
                setState(() {
                  selectedCurve = newCurve;
                });
              },
            ),
          ),
          Hero(
            tag: heroTag,
            child: ElevatedButton(
              onPressed: () {
                MyNavigator.pushWithTransition(
                  context,
                  toScreen: const HeroPage(),
                  forwardDurationInMilliseconds: forwardDuration,
                  backwardDurationInMilliseconds: backwardDuration,
                  providedTransition: transition,
                  curve: selectedCurve?.curve,
                );
              },
              child: const Text('Navigate'),
            ),
          )
        ],
      ),
    );
  }
}
