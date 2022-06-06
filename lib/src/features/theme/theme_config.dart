import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
  bool _darkStatus = false;

  isDak() => _darkStatus;

  setDarkStatus(bool status) {
    _darkStatus = status;

    notifyListeners();
  }
}
