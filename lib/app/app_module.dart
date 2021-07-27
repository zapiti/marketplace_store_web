import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/app_store.dart';
import 'package:marketplace_store_web/app/guard/router_permission_guard.dart';
import 'package:marketplace_store_web/app/modules/client/client_module.dart';
import 'package:marketplace_store_web/app/modules/landing/landing_module.dart';
import 'package:marketplace_store_web/app/modules/login/login_module.dart';
import 'package:marketplace_store_web/app/modules/store/store_module.dart';

import 'package:marketplace_store_web/app/routes/constants_routes.dart';

import 'core/request_core.dart';
import 'modules/client/modules/cart/cart_store.dart';
import 'modules/landing/landing_store.dart';
import 'modules/login/repository/auth_repository.dart';
import 'modules/register/register_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => Dio()),
    Bind.lazySingleton((i) => CartStore()),
    Bind.lazySingleton((i) => AppStore()),
    Bind.lazySingleton((i) => AuthRepository()),
    Bind.lazySingleton((i) => LandingStore()),
    Bind.lazySingleton((i) => RequestCore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute,
        module: LandingModule(), transition: TransitionType.fadeIn),
    ModuleRoute(ConstantsRoutes.LANDING,
        module: LandingModule(), transition: TransitionType.fadeIn),
    ModuleRoute(ConstantsRoutes.LOGIN,
        module: LoginModule(), transition: TransitionType.fadeIn),
    ModuleRoute(ConstantsRoutes.REGISTERPAGE,
        module: RegisterModule(), transition: TransitionType.fadeIn),
    ModuleRoute(ConstantsRoutes.STOREROUTE,
        module: StoreModule(), transition: TransitionType.fadeIn,guards: [RouterPermissionGuard()]),
    ModuleRoute(ConstantsRoutes.CLIENTROUTE,
        module: ClientModule(), transition: TransitionType.fadeIn,guards: [RouterPermissionGuard()]),
  ];
}
