import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyNavigator {
  static void push(
    BuildContext context, {
    required Widget toScreen,
    required bool fullscreenDialog,
  }) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => toScreen,
        fullscreenDialog: fullscreenDialog,
      ),
    );
  }
}
