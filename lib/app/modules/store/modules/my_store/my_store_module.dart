import 'package:new_marketplace_web/app/modules/store/modules/my_store/my_store_page.dart';
import 'package:new_marketplace_web/app/modules/store/modules/my_store/my_store_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class MyStoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MyStoreStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => MyStorePage())
  ];
}
