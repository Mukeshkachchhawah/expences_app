import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;

  bool get themeValue => _isDark;

  /// set function
  set themeValue(bool newValue) {
    _isDark = newValue;
    _saveThemeToPreference(newValue);
    notifyListeners();
  }

  ThemeProvider() {
    _loadThemeFromPreferences();
  }

  /// Save theme preference to SharedPreferences

  Future<void> _saveThemeToPreference(bool newValue) async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool('isDarkTheme', newValue);
  }

  /// Load theme preference from SharedPreferences

  void _loadThemeFromPreferences() async {
    final pref = await SharedPreferences.getInstance();
    _isDark = pref.getBool('isDarkTheme') ?? false;
    notifyListeners();
  }
}
