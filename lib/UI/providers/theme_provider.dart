import 'package:flutter/material.dart';
import 'package:portfolio/utils/local_storage.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = true;

  _loadTheme() async {
    final themePrefs = LocalStorage.prefs.getBool('theme');
    if (themePrefs != null) {
      _isDarkMode = themePrefs;
      notifyListeners();
    }
  }

  Future<void> _saveLanguage(String language) async {
    final themePrefs = LocalStorage.prefs;
    await themePrefs.setString('language', language);
  }

  void changeTheme(bool isDarkMode) {}
}
