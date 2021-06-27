import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/components/appbar/custom_client_app_bar.dart';
import 'package:marketplace_store_web/app/components/drawer/custom_client_drawer.dart';
import 'package:marketplace_store_web/app/modules/client/client_store.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';

class ClientPage extends StatefulWidget {
  @override
  ClientPageState createState() => ClientPageState();
}

class ClientPageState extends ModularState<ClientPage, ClientStore> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      Modular.to.navigate(ConstantsRoutes.CALL_CLIENT_HOMEPAGE);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomClientAppBar(controller),
        body: RouterOutlet(),
        drawer: Utils.isSmalSize(
                BoxConstraints(maxWidth: MediaQuery.of(context).size.width))
            ? null
            : CustomClientDrawer(controller));
  }
}
