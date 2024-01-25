import 'package:flutter/material.dart';

import '../../constant/color_palette.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeMode = lightMode;
  bool _isLight = true;

  bool get isLight => _isLight;
  ThemeData get themeMode => _themeMode;

  set themeMode(ThemeData themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  set isLight(bool isLight) {
    _isLight = isLight;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeMode == lightMode) {
      themeMode = darkMode;
      isLight = false;
    } else {
      themeMode = lightMode;
      isLight = true;
    }
  }
}
