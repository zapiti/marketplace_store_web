
import 'package:flutter_modular/flutter_modular.dart';

import 'account_page.dart';
import 'account_store.dart';


class AccountModule extends Module {
  @override
  final List<Bind> binds = [

  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => AccountPage())
  ];
}
