import 'package:marketplace_store_web/app/modules/client/modules/bag/repository/bag_repository.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'bag_page.dart';
import 'bag_store.dart';

class BagModule extends Module {
  @override
  final List<Bind> binds = [


  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => BagPage()),
  ];
}
