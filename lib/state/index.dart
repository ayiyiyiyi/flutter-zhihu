import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  static ThemeData _dark = ThemeData(
      primaryColor: Colors.black,
      accentColor: Colors.blue,
      brightness: Brightness.dark
  );
  static ThemeData _light = ThemeData(
      primaryColor: Colors.white,
      accentColor: Colors.teal,
      brightness: Brightness.light
  );
  ThemeData _currentTheme = _dark;
  ThemeData get currentTheme => _currentTheme;
  void switchToDark () {
    _currentTheme = _dark;
    notifyListeners();
  }
  void switchToLight () {
    _currentTheme = _light;
    notifyListeners();
  }
  bool get isDark => _currentTheme == _dark;
}