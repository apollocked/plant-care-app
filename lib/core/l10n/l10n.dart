// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/cupertino.dart';
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

  @override
  TextDirection get textDirection => TextDirection.rtl;

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

class KurdishWidgetsLocalizations extends DefaultWidgetsLocalizations {
  const KurdishWidgetsLocalizations();

  @override
  TextDirection get textDirection => TextDirection.rtl;

  static const LocalizationsDelegate<WidgetsLocalizations> delegate =
      _KurdishWidgetsLocalizationsDelegate();
}

class _KurdishWidgetsLocalizationsDelegate
    extends LocalizationsDelegate<WidgetsLocalizations> {
  const _KurdishWidgetsLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ku';

  @override
  Future<WidgetsLocalizations> load(Locale locale) async =>
      const KurdishWidgetsLocalizations();

  @override
  bool shouldReload(_KurdishWidgetsLocalizationsDelegate old) => false;
}

class KurdishCupertinoLocalizations extends DefaultCupertinoLocalizations {
  const KurdishCupertinoLocalizations();

  @override
  TextDirection get textDirection => TextDirection.rtl;

  static const LocalizationsDelegate<CupertinoLocalizations> delegate =
      _KurdishCupertinoLocalizationsDelegate();
}

class _KurdishCupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const _KurdishCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ku';

  @override
  Future<CupertinoLocalizations> load(Locale locale) async =>
      const KurdishCupertinoLocalizations();

  @override
  bool shouldReload(_KurdishCupertinoLocalizationsDelegate old) => false;
}
