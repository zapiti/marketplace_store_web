import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart' as app_widget;

void main() {
  runApp(ModularApp(module: AppModule(), child: app_widget.AppWidget()));
}
