import 'package:marketplace_store_web/app/modules/client/modules/home/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [

    Bind.lazySingleton((i) => HomeStore()),

  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage())
  ];
}
