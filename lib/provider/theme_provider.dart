import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode;

  ThemeProvider(this._themeMode);

  // Get current theme mode
  ThemeMode get themeMode => _themeMode;

  // Set new theme mode and notify listeners
  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  // Get the current theme data based on the current theme mode
  ThemeData getThemeData() {
    switch (_themeMode) {
      case ThemeMode.light:
        return ThemeData.light().copyWith(
            // Add your light theme properties here
            );
      case ThemeMode.dark:
        return ThemeData.dark().copyWith(
            // Add your dark theme properties here
            );
      default:
        return ThemeData.light().copyWith(
            // Add default theme properties here
            );
    }
  }
}
