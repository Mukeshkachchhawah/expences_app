import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;

  /// get function
  bool get themeValue {
    return _isDark;
  }

  /// set function
  set themeValue(bool newValue) {
    _isDark = newValue;
    notifyListeners();
  }
}
