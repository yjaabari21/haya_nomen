import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends ChangeNotifier {
  Locale _locale = const Locale('ar');

  Locale get locale => _locale;

  Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();

    _locale = const Locale('ar');
    await prefs.setString('languageCode', 'ar');

    notifyListeners();
  }

  Future<void> changeLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    _locale = const Locale('ar');
    await prefs.setString('languageCode', 'ar');

    notifyListeners();
  }
}
