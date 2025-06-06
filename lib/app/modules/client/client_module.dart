import 'package:new_marketplace_web/app/modules/client/modules/bag/bag_module.dart';
import 'package:new_marketplace_web/app/modules/client/modules/delivery/delivery_module.dart';
import 'package:new_marketplace_web/app/modules/client/modules/delivery/delivery_store.dart';
import 'package:new_marketplace_web/app/modules/client/client_page.dart';
import 'package:new_marketplace_web/app/modules/client/client_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_web/app/modules/client/modules/cart/cart_store.dart';
import 'package:new_marketplace_web/app/modules/client/modules/order/order_module.dart';

import 'package:new_marketplace_web/app/routes/constants_routes.dart';

import 'modules/account/account_client_store.dart';
import 'modules/account/account_module.dart';
import 'modules/account/page/account_alter_pass_page.dart';
import 'modules/account/page/account_help_page.dart';
import 'modules/account/repository/account_client_repository.dart';
import 'modules/bag/bag_store.dart';
import 'modules/bag/repository/bag_repository.dart';
import 'modules/home/home_module.dart';
import 'modules/home/home_store.dart';
import 'modules/home/page/home/initial_home_page.dart';
import 'modules/home/page/store/detail_store_page.dart';
import 'modules/home/repository/home_repository.dart';

class ClientModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DeliveryStore()),
    Bind.lazySingleton((i) => ClientStore()),
    Bind.lazySingleton((i) => HomeRepository()),
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => BagStore()),
    Bind.lazySingleton((i) => BagRepository()),
    Bind.lazySingleton((i) => AccountClientRepository()),
    Bind.lazySingleton((i) => AccountClientStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => ClientPage(),
        children: [
          //region <!home>
          ModuleRoute(ConstantsRoutes.HOME_CLIENT_PAGE,
              module: HomeModule(), transition: TransitionType.fadeIn),
          ChildRoute(ConstantsRoutes.HOME_SHOP_CLIENT_PAGE + ":id",
              child: (_, args) => DetailStorePage(args.params['id'], args.data),
              transition: TransitionType.fadeIn),
          //endregion

          //region <!Pedidos>
          ModuleRoute(ConstantsRoutes.ORDER_CLIENT_PAGE,
              module: OrderModule(), transition: TransitionType.fadeIn),
          //endregion

          //region <!Pedidos>
          ModuleRoute(ConstantsRoutes.BAG_CLIENT_PAGE,
              module: BagModule(), transition: TransitionType.fadeIn),
          //endregion

          //region <!Entrega>
          ModuleRoute(ConstantsRoutes.DELIVERY_CLIENT_PAGE,
              module: DeliveryModule(), transition: TransitionType.fadeIn),

          //endregion

          //region <!Conta>
          ModuleRoute(ConstantsRoutes.ACCOUNTCLIENTPAGE,
              module: AccountModule(), transition: TransitionType.fadeIn),
          ChildRoute(ConstantsRoutes.ALTERPASSCLIENT,
              child: (_, args) => AccountAlterPassPage(),
              transition: TransitionType.fadeIn),
          ChildRoute(ConstantsRoutes.HELPCLIENT,
              child: (_, args) => AccountHelpPage(),
              transition: TransitionType.fadeIn),
          //endregion
        ])
  ];
}
