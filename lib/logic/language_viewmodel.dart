import 'package:flutter/material.dart';
import 'package:mock_plant_care_app/core/l10n/l10n.dart';

class LanguageService extends ChangeNotifier {
  Locale _locale = const Locale('ku');
  Locale get locale => _locale;
  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }
}
