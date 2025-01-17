import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {

  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  Future<void> getTheme() async {
    try {
      final pref = await SharedPreferences.getInstance();
      final isDarkMode = pref.getBool("darkMode") ?? false;
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
      notifyListeners();
    } catch(e) {
      debugPrint("Error getTheme preferences: $e");
    }
  }

  Future<void> setTheme() async {
    try{
      final pref = await SharedPreferences.getInstance();
      if(_themeMode == ThemeMode.light) {
        _themeMode = ThemeMode.dark;
        await pref.setBool("darkMode", true);
      } else {
        _themeMode = ThemeMode.light;
        await pref.setBool("darkMode", false);
      }
      notifyListeners();
    } catch(e) {
      debugPrint("Error setTheme preferences: $e");
    }
  }
}