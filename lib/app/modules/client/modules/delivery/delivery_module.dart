import 'package:marketplace_store_web/app/modules/client/modules/cart/cart_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/modules/client/modules/delivery/repository/delivery_repository.dart';

import 'delivery_page.dart';
import 'delivery_store.dart';

class DeliveryModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DeliveryStore()),
    Bind.lazySingleton((i) => DeliveryRepository()),

  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => DeliveryPage()),
  ];
}
