import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slidy',debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: AppThemeUtils.colorPrimary),
      supportedLocales: [const Locale('pt', 'BR')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
    ).modular();
  }
}