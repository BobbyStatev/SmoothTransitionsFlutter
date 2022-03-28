import 'package:flutter/cupertino.dart';

class PlatformNotifier extends ChangeNotifier {
  TargetPlatform? _targetPlatform;
  TargetPlatform? get targetPlatform => _targetPlatform;

  void update(TargetPlatform newPlatform) {
    _targetPlatform = newPlatform;
    notifyListeners();
  }
}
