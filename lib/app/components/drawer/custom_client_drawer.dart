import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:new_marketplace_web/app/modules/client/client_store.dart';
import 'package:new_marketplace_web/app/routes/constants_routes.dart';

import 'package:new_marketplace_web/app/utils/image/image_logo_widget.dart';
import 'package:new_marketplace_web/app/utils/utils.dart';

import 'drawer_button_widget.dart';

class CustomClientDrawer extends StatelessWidget {
  final ClientStore controller;

  CustomClientDrawer(this.controller);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Utils.isSmalSize(constraints)
          ? Container(
              width: 0,
              height: 0,
            )
          : Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              width: 300,
              child: SafeArea(
                  top: false,
                  bottom: true,
                  right: true,
                  left: true,
                  child: Observer(
                      builder: (ctx) => ListView(
                              padding: EdgeInsets.only(bottom: 80),
                              children: [
                                getLogoIcon(),
                                SizedBox(height: 15),
                                DrawerButton(
                                    active: controller.currentIndex == 0,
                                    context: context,
                                    title: "Home",
                                    iconData: Icons.home,
                                    menutitle: null,
                                    onPressed: () {
                                      Navigator.pop(context);
                                      controller.addCurrentIndex(0);
                                      Modular.to.navigate(
                                          ConstantsRoutes.CALL_CLIENT_HOMEPAGE);
                                    }),
                                DrawerButton(
                                    active: controller.currentIndex == 1,
                                    context: context,
                                    title: "Pedidos",
                                    iconData: Icons.store,
                                    menutitle: null,
                                    onPressed: () {
                                      Navigator.pop(context);
                                      controller.addCurrentIndex(1);
                                      Modular.to.navigate(
                                          ConstantsRoutes.CALL_ORDER_CLIENT_PAGE);
                                    }),
                                DrawerButton(
                                    active: controller.currentIndex == 2,
                                    context: context,
                                    title: "Entregas",
                                    iconData: Icons.delivery_dining,
                                    menutitle: null,
                                    onPressed: () {
                                      Navigator.pop(context);
                                      controller.addCurrentIndex(2);
                                      Modular.to.navigate(
                                          ConstantsRoutes.CALL_DELIVERY_CLIENT_PAGE);
                                    }),
                                DrawerButton(
                                    active: controller.currentIndex == 3,
                                    context: context,
                                    title: "Sacola",
                                    iconData: Icons.shopping_cart,
                                    menutitle: null,
                                    onPressed: () {
                                      Navigator.pop(context);
                                      controller.addCurrentIndex(3);
                                      Modular.to.navigate(
                                          ConstantsRoutes.CALL_BAG_CLIENT_PAGE);
                                    }),
                                DrawerButton(
                                    active: controller.currentIndex == 4,
                                    context: context,
                                    title: "Conta",
                                    iconData: Icons.person,
                                    menutitle: null,
                                    onPressed: () {
                                      Navigator.pop(context);
                                      controller.addCurrentIndex(4);
                                      Modular.to.navigate(
                                          ConstantsRoutes.CALL_ACCOUNT_CLIENT_PAGE);
                                    })
                              ]))));
    });
  }
}
