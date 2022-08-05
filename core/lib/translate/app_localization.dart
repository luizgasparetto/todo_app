import 'dart:ui';

import 'package:core/translate/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalization {
  static const localizationsDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static const supportedLocales = [
    Locale('en', ''),
    Locale('ar', ''),
    Locale('pt', ''),
    Locale('it', ''),
    Locale('ja', ''),
    Locale('es', ''),
    Locale('de', ''),
    Locale('fr', ''),
    Locale('zh', ''),
    Locale('hi', ''),
  ];
}
