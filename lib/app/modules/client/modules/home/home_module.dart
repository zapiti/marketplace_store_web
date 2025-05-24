import 'package:new_marketplace_web/app/modules/client/modules/home/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_web/app/modules/client/modules/home/page/home/initial_home_page.dart';
import 'package:new_marketplace_web/app/modules/client/modules/home/page/store/detail_store_page.dart';
import 'package:new_marketplace_web/app/modules/client/modules/home/repository/home_repository.dart';
import 'package:new_marketplace_web/app/routes/constants_routes.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [

  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}
