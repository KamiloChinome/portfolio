import 'package:flutter/material.dart';
import 'package:portfolio/utils/local_storage.dart';

class LanguageProvider extends ChangeNotifier {
  String _language = 'en';
  String get language => _language;

  LanguageProvider() {
    _loadLanguage();
  }

  _loadLanguage() async {
    final languagePrefs = LocalStorage.prefs.getString('language');
    if (languagePrefs != null) {
      _language = languagePrefs;
      notifyListeners();
    }
  }

  Future<void> _saveLanguage(String language) async {
    final languagePrefs = LocalStorage.prefs;
    await languagePrefs.setString('language', language);
  }

  void changeLanguage() {
    if (_language == 'es') {
      _language = 'en';
    } else if (_language == 'en') {
      _language = 'es';
    }
    _saveLanguage(_language);
    notifyListeners();
  }
}
