import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'constants.dart';
import 'localization.dart';
import 'localization_en.dart';
import 'localization_ja.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Localization> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        Languages.english.languageCode,
        Languages.japanese.languageCode
      ].contains(locale.languageCode);

  @override
  Future<Localization> load(Locale locale) => _load(locale);

  static Future<Localization> _load(Locale locale) async {
    final String name =
        (locale.countryCode == null || locale.countryCode!.isEmpty)
            ? locale.languageCode
            : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    Intl.defaultLocale = localeName;

    if (locale.languageCode == Languages.english.languageCode) {
      return LocalizationEN();
    } else if (locale.languageCode == Languages.japanese.languageCode) {
      return LocalizationJA();
    } else {
      return LocalizationEN();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Localization> old) => false;
}
