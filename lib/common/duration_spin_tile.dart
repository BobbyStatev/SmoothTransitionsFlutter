import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

class DurationSpinTile extends StatelessWidget {
  const DurationSpinTile({
    required this.onChanged,
    required this.titleText,
    Key? key,
  }) : super(key: key);

  final ValueChanged<double> onChanged;
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(titleText),
      subtitle: SpinBox(
        min: 0,
        max: 2000,
        value: 500,
        step: 100,
        onChanged: onChanged,
      ),
    );
  }
}
