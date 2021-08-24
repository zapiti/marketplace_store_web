
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/modules/client/modules/account/repository/account_client_repository.dart';

import 'account_page.dart';
import 'account_client_store.dart';


class AccountModule extends Module {
  @override
  final List<Bind> binds = [

  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => AccountPage())
  ];
}
