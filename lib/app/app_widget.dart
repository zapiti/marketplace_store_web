import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/app_store.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

import 'components/load/load_view_element.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marketplace',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: AppThemeUtils.colorPrimary),
      supportedLocales: [const Locale('pt', 'BR')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      builder: (context, child) => StreamBuilder<bool>(
          stream: Modular.get<AppStore>().loadElement.stream,
          initialData: false,
          builder: (context, state) =>
              LoadViewElement(state.data ?? false, child ?? SizedBox())),
    ).modular();
  }
}
