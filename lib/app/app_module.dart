import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/modules/client/client_module.dart';
import 'package:marketplace_store_web/app/modules/landing/landing_module.dart';
import 'package:marketplace_store_web/app/modules/login/login_module.dart';
import 'package:marketplace_store_web/app/modules/store/store_module.dart';

import 'package:marketplace_store_web/app/routes/constants_routes.dart';

import 'modules/client/modules/cart/cart_store.dart';
import 'modules/register/register_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [    Bind.lazySingleton((i) => CartStore()),];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LandingModule(),transition: TransitionType.fadeIn),
    ModuleRoute(ConstantsRoutes.LOGIN, module: LoginModule(),transition: TransitionType.fadeIn),
    ModuleRoute(ConstantsRoutes.REGISTERPAGE, module: RegisterModule(),transition: TransitionType.fadeIn),
    ModuleRoute(ConstantsRoutes.STOREROUTE, module: StoreModule(),transition: TransitionType.fadeIn),
    ModuleRoute(ConstantsRoutes.CLIENTROUTE, module: ClientModule(),transition: TransitionType.fadeIn),
  ];

}