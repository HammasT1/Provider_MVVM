import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void setTheme(ThemeMode? themeMode) {
    if (themeMode != null && themeMode != _themeMode) {
      _themeMode = themeMode;
      notifyListeners();
    }
  }
}