import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/modules/store/modules/home/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
  ChildRoute(Modular.initialRoute, child: (_, args) => HomePage())
  ];

}