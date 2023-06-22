import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resource/navigation_service.dart';

class AppLocalizations {
  final Locale? locale;
  AppLocalizations({
    this.locale,
  });
  // static BuildContext? currentContext = navigatorKey.currentContext;
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(
        context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  late Map<String, String> _localizedStrings;

  Future loadJsonLanguage() async {
    String jsonString =
        await rootBundle.loadString("assets/lang/${locale!.languageCode}.json");

    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  String translate(String key) => _localizedStrings[key] ?? "";
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale: locale);
    await localizations.loadJsonLanguage();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}

// todo : check this
tr(BuildContext context,String key) {
  return AppLocalizations.of(context)!.translate(key);
}
// extension TranslateX on String {
//   String tr(context,BuildContext context) {
//     return AppLocalizations.of(context)!.translate(this);
//   }
//
// }
