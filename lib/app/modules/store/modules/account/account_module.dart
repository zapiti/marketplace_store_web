import 'package:marketplace_store_web/app/modules/store/modules/account/account_page.dart';
import 'package:marketplace_store_web/app/modules/store/modules/account/account_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class AccountModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AccountStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => AccountPage())
  ];
}
