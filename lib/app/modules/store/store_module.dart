import 'package:marketplace_store_web/app/modules/store/modules/home/home_module.dart';
import 'package:marketplace_store_web/app/modules/store/modules/my_store/my_store_module.dart';

import 'package:marketplace_store_web/app/modules/store/store_page.dart';
import 'package:marketplace_store_web/app/modules/store/store_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:marketplace_store_web/app/routes/constants_routes.dart';

import 'modules/account/account_module.dart';

class StoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => StoreStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => StorePage(),
      children: [
        ModuleRoute(ConstantsRoutes.HOMEPAGE,
            module: HomeModule(), transition: TransitionType.fadeIn),
        ModuleRoute(ConstantsRoutes.MY_STORE_PAGE,
            module: MyStoreModule(), transition: TransitionType.fadeIn),
        ModuleRoute(ConstantsRoutes.ACCOUNTPAGE,
            module: AccountModule(), transition: TransitionType.fadeIn),
      ],
    ),
  ];
}
