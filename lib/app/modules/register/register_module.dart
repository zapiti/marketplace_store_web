import 'package:marketplace_store_web/app/modules/register/register_page.dart';
import 'package:marketplace_store_web/app/modules/register/register_store.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/modules/register/repository/register_repository.dart';

class RegisterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegisterStore()),  Bind.lazySingleton((i) => RegisterRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => RegisterPage()),
  ];
}
