import 'package:flutter/material.dart';
import 'package:portfolio/utils/local_storage.dart';

class LanguageProvider extends ChangeNotifier {
  String _language = 'en';
  String get language => _language;
  set language(String value) {
    _language = value;
    notifyListeners();
  }

  LanguageProvider() {
    _loadLanguage();
  }

  _loadLanguage() async {
    final languagePrefs = LocalStorage.prefs.getString('language');
    if (languagePrefs != null) {
      language = languagePrefs;
    }
  }

  Future<void> _saveLanguage(String language) async {
    final languagePrefs = LocalStorage.prefs;
    await languagePrefs.setString('language', language);
  }

  void changeLanguage() {
    if (language == 'es') {
      language = 'en';
    } else if (language == 'en') {
      language = 'es';
    }
    _saveLanguage(language);
  }
}
