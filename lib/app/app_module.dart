import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_web/app/app_store.dart';
import 'package:new_marketplace_web/app/core/mock_request_core.dart';
import 'package:new_marketplace_web/app/modules/client/client_module.dart';
import 'package:new_marketplace_web/app/modules/login/login_module.dart';
import 'package:new_marketplace_web/app/modules/register/register_module.dart';
import 'package:new_marketplace_web/app/modules/store/store_module.dart';
import 'package:new_marketplace_web/app/routes/constants_routes.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MockRequestCore()),
    Bind.lazySingleton((i) => AppStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute(ConstantsRoutes.REGISTER, module: RegisterModule()),
    ModuleRoute(ConstantsRoutes.CLIENTROUTE, module: ClientModule()),
    ModuleRoute(ConstantsRoutes.STOREROUTE, module: StoreModule()),
  ];
}

class TemporaryHomePage extends StatelessWidget {
  const TemporaryHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Marketplace Web')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Bem-vindo ao Marketplace Web',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text('Em desenvolvimento...', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Marketplace',
      theme: AppThemeUtils.lightTheme,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
