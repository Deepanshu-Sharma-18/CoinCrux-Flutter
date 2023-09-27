// Create an enum to represent the available themes.
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../resources/colors.dart';
import '../../../resources/resources.dart';

enum ThemeModeType { Light, Dark }

class ThemeProvider with ChangeNotifier {
  ThemeModeType _themeMode = ThemeModeType.Light;
  ThemeModeType get themeMode => _themeMode;

  Future<void> getTheme() async {
    bool? isDarkTheme = await readTheme("isDarkTheme");
    if (isDarkTheme == null) {
      _themeMode = ThemeModeType.Light;
    } else {
      _themeMode = isDarkTheme ? ThemeModeType.Dark : ThemeModeType.Light;
    }

    notifyListeners();
  }

  void toggleTheme() {
    _themeMode = _themeMode == ThemeModeType.Light
        ? ThemeModeType.Dark
        : ThemeModeType.Light;

    if (_themeMode == ThemeModeType.Dark) {
      R.colors = AppColors(isDarkTheme: true);
    } else {
      R.colors = AppColors(isDarkTheme: false);
    }
    notifyListeners();
    saveTheme(_themeMode == ThemeModeType.Dark);
  }

  Future<void> saveTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isDarkTheme", value);
  }

  Future<bool?> readTheme(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool(key);
  }
}
