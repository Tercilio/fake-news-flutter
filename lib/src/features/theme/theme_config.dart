import 'package:basearch/src/features/theme/theme_preference.dart';
import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
  ThemePreference themePreference = ThemePreference();

  bool _darkStatus = false;

  bool get isDark => _darkStatus;

  setDarkStatus(bool status) {
    _darkStatus = status;
    themePreference.setDarkTheme(status);

    notifyListeners();
  }
}
