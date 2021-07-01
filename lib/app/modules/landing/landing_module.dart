import 'package:marketplace_store_web/app/modules/landing/landing_page.dart';
import 'package:marketplace_store_web/app/modules/landing/landing_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class LandingModule extends Module {
  @override
  final List<Bind> binds = [

  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => LandingPage()),
  ];
}
