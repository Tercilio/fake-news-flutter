import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
  bool _darkStatus = false;

  isDak() => _darkStatus;

  setDarkStatus(bool status) {
    _darkStatus = status;

    notifyListeners();
  }
}


  // @action
  // void changeTheme() {
  //   if (isDark) {
  //     themeType = ThemeData.light();
  //   } else {
  //     themeType = ThemeData.dark();
  //   }
  //   saveThemePreferences();
  // }

  // void saveThemePreferences() {
  //   SharedPreferences.getInstance().then((instance) {
  //     instance.setBool('isDark', isDark);
  //   });
  // }

  // Future<void> loadTheme() async {
  //   final prefs = await SharedPreferences.getInstance();

  //   bool? isDarkP = prefs.getBool('isDark');

  //   if (isDarkP != null && isDarkP == true) {
  //     themeType = ThemeData.dark();
  //   } else {
  //     themeType = ThemeData.light();
  //   }
  // }
