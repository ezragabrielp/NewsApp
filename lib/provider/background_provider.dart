import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BackgroundProvider with ChangeNotifier {
  bool _isLightMode = true;

  bool get isLightMode => _isLightMode;
  set isLightMode(bool value) {
    _isLightMode = value;
    notifyListeners();
  }

  Color get color => (_isLightMode) ? Colors.blueGrey : Colors.amber;
}
