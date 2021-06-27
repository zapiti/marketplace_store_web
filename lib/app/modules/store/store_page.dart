import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/components/appbar/custom_store_app_bar.dart';
import 'package:marketplace_store_web/app/components/drawer/custom_store_drawer.dart';
import 'package:marketplace_store_web/app/modules/store/store_store.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';

class StorePage extends StatefulWidget {
  @override
  StorePageState createState() => StorePageState();
}

class StorePageState extends ModularState<StorePage, StoreStore> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Modular.to.navigate(ConstantsRoutes.CALL_STORE_HOMEPAGE);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomStoreAppBar(controller),
      body: RouterOutlet(),      drawer: Utils.isSmalSize(
        BoxConstraints(maxWidth: MediaQuery.of(context).size.width))
        ? null
        : CustomStoreDrawer(controller)
    );
  }
}
