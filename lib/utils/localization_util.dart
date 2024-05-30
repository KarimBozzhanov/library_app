import 'dart:io';

import 'package:library_app/config/locale.dart';

bool isSupportedLanguages(String languageCode) => AppLocale.supportedLocales
    .map((e) => e.languageCode)
    .contains(languageCode);

String defaultLocale() {
  final systemLanguageCode = Platform.localeName.split('_')[0];
  return isSupportedLanguages(systemLanguageCode) ? systemLanguageCode : AppLocale.ruKey;
}
