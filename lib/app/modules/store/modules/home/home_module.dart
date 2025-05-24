import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:new_marketplace_web/app/modules/store/modules/home/home_page.dart';
import 'package:new_marketplace_web/app/modules/store/modules/home/home_store.dart';
import 'package:new_marketplace_web/app/modules/store/modules/home/repository/home_repository.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => HomeRepository()),
    Bind.lazySingleton((i) => HomeStore()),

  ];

  @override
  final List<ModularRoute> routes = [
  ChildRoute(Modular.initialRoute, child: (_, args) => HomePage())
  ];

}