import 'package:flutter/cupertino.dart';

class PlatformNotifier extends ChangeNotifier {
  TargetPlatform? _targetPlatform;
  TargetPlatform? get targetPlatform => _targetPlatform;

  void update(TargetPlatform? newPlatform) {
    _targetPlatform = newPlatform;
    notifyListeners();
  }
}

class FullscreenDialogNotifier extends ChangeNotifier {
  bool _isSelected = false;
  bool get isSelected => _isSelected;

  void update(bool isSelected) {
    _isSelected = isSelected;
    notifyListeners();
  }
}
