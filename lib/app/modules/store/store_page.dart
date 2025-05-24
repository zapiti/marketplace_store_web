import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_web/app/components/appbar/custom_store_app_bar.dart';
import 'package:new_marketplace_web/app/components/drawer/custom_store_drawer.dart';
import 'package:new_marketplace_web/app/modules/store/store_store.dart';
import 'package:new_marketplace_web/app/routes/constants_routes.dart';
import 'package:new_marketplace_web/app/utils/utils.dart';

class StorePage extends StatefulWidget {
  @override
  StorePageState createState() => StorePageState();
}

class StorePageState extends State<StorePage> {
  final storeControl = Modular.get<StoreStore>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Modular.to.navigate(ConstantsRoutes.CALL_STORE_HOMEPAGE);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomStoreAppBar(storeControl),
        body: RouterOutlet(),
        drawer: Utils.isSmalSize(
                BoxConstraints(maxWidth: MediaQuery.of(context).size.width))
            ? null
            : CustomStoreDrawer(storeControl));
  }
}
