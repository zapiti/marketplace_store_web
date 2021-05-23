import 'package:marketplace_store_web/app/modules/client/client_page.dart';
import 'package:marketplace_store_web/app/modules/client/client_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:marketplace_store_web/app/routes/constants_routes.dart';

import 'modules/account/account_module.dart';
import 'modules/account/page/account_alter_pass_page.dart';
import 'modules/account/page/account_help_page.dart';
import 'modules/home/home_module.dart';

class ClientModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ClientStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => ClientPage(),
        children: [
          ModuleRoute(ConstantsRoutes.HOME_CLIENT_PAGE,
              module: HomeModule(), transition: TransitionType.fadeIn),

          ModuleRoute(ConstantsRoutes.ACCOUNTCLIENTPAGE,
              module: AccountModule(), transition: TransitionType.fadeIn),
          ChildRoute(ConstantsRoutes.ALTERPASSCLIENT,
              child: (_, args) => AccountAlterPassPage(), transition: TransitionType.fadeIn),
          ChildRoute(ConstantsRoutes.HELPCLIENT,
              child: (_, args) => AccountHelpPage(), transition: TransitionType.fadeIn),
        ])
  ];
}
