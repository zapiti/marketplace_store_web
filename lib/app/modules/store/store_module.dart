import 'package:new_marketplace_web/app/modules/store/modules/account/page/account_alter_my_wallet_page.dart';
import 'package:new_marketplace_web/app/modules/store/modules/account/page/account_alter_pass_page.dart';
import 'package:new_marketplace_web/app/modules/store/modules/account/page/account_help_page.dart';
import 'package:new_marketplace_web/app/modules/store/modules/account/page/account_my_wallet_page.dart';
import 'package:new_marketplace_web/app/modules/store/modules/home/home_module.dart';
import 'package:new_marketplace_web/app/modules/store/modules/my_store/my_store_module.dart';
import 'package:new_marketplace_web/app/modules/store/modules/my_store/my_store_store.dart';
import 'package:new_marketplace_web/app/modules/store/repository/store_repository.dart';

import 'package:new_marketplace_web/app/modules/store/store_page.dart';
import 'package:new_marketplace_web/app/modules/store/store_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:new_marketplace_web/app/routes/constants_routes.dart';

import 'modules/account/account_module.dart';
import 'modules/account/account_store.dart';
import 'modules/account/repository/account_repository.dart';
import 'modules/my_store/page/add_product_store_page.dart';
import 'modules/my_store/page/alter_my_store_page.dart';
import 'modules/my_store/repository/my_store_repository.dart';

class StoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MyStoreRepository()),
    Bind.lazySingleton((i) => MyStoreStore()),
    Bind.lazySingleton((i) => StoreStore()),
    Bind.lazySingleton((i) => StoreRepository()),
    Bind.lazySingleton((i) => AccountStore()),
    Bind.lazySingleton((i) => AccountRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => StorePage(),
      children: [
        ModuleRoute(ConstantsRoutes.HOME_STORE_PAGE,
            module: HomeModule(), transition: TransitionType.fadeIn),
        ModuleRoute(ConstantsRoutes.MY_STORE_PAGE,
            module: MyStoreModule(), transition: TransitionType.fadeIn),
        ModuleRoute(ConstantsRoutes.ACCOUNTSTOREPAGE,
            module: AccountModule(), transition: TransitionType.fadeIn),
        ChildRoute(ConstantsRoutes.ALTERPASSSTORE,
            child: (_, args) => AccountAlterPassPage(),
            transition: TransitionType.fadeIn),
        ChildRoute(ConstantsRoutes.HELPSTORE,
            child: (_, args) => AccountHelpPage(),
            transition: TransitionType.fadeIn),
        ChildRoute(ConstantsRoutes.ALTER_STORE_PAGE,
            child: (_, args) => AlterMyStorePage(),
            transition: TransitionType.fadeIn),
        ChildRoute(ConstantsRoutes.ALTER_PRODUCT_STORE_PAGE,
            child: (_, args) => AddProductStorePage(),
            transition: TransitionType.fadeIn),
        ChildRoute(ConstantsRoutes.WALLET,
            child: (_, args) => AccountMyWalletPage(),
            transition: TransitionType.fadeIn),
        ChildRoute(ConstantsRoutes.ALTERWALLET,
            child: (_, args) => AccountAlterMyWalletPage(),
            transition: TransitionType.fadeIn)
      ],
    ),
  ];
}
