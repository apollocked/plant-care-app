import 'package:flutter/material.dart';
import 'package:mock_plant_care_app/core/l10n/l10n.dart';
import 'package:mock_plant_care_app/data/services/storage_service.dart';

class LanguageService extends ChangeNotifier {
  LanguageService(this._storageService);
  final StorageService _storageService;
  Locale _locale = const Locale('en');
  Locale get locale => _locale;

  void loadLocale() {
    final String? languageCode = _storageService.getLanguage();
    if (languageCode != null && L10n.all.any((l) => l.languageCode == languageCode)) {
      _locale = Locale(languageCode);
      notifyListeners();
    }
  }

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    _storageService.saveLanguage(locale.languageCode);
    notifyListeners();
  }
}
