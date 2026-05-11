import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('ar'),
    const Locale('ku'),
  ];

  static String getNativeName(String code) {
    switch (code) {
      case 'ar':
        return 'العربية';
      case 'ku':
        return 'کوردی';
      case 'en':
      default:
        return 'English';
    }
  }
}

class KurdishMaterialLocalizations extends DefaultMaterialLocalizations {
  const KurdishMaterialLocalizations();

  static const LocalizationsDelegate<MaterialLocalizations> delegate =
      _KurdishMaterialLocalizationsDelegate();
}

class _KurdishMaterialLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const _KurdishMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ku';

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      const KurdishMaterialLocalizations();

  @override
  bool shouldReload(_KurdishMaterialLocalizationsDelegate old) => false;
}
