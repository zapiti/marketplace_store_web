import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/models/menu.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';
import 'package:marketplace_store_web/app/utils/image/image_logo_widget.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';

import 'drawer_button_widget.dart';

class CustomLandingDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Utils.isSmalSize(constraints)
          ? Container(width: 0,height: 0,)
          : Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              width: 300,
              child: SafeArea(
                  top: false,
                  bottom: true,
                  right: true,
                  left: true,
                  child: ListView.builder(
                      itemCount: 2,
                      padding: EdgeInsets.only(bottom: 80),
                      itemBuilder: (context, index) {
                        return index == 0
                            ? Column(
                                children: [
                                  getLogoIcon(),
                                  SizedBox(height: 15),
                                  DrawerButton(
                                      active: false,
                                      context: context,
                                      title: "Me cadastrar",
                                      iconData: Icons.person,
                                      menutitle:null,
                                      onPressed: () {
                                          Modular.to.pushReplacementNamed(ConstantsRoutes.REGISTERPAGE);
                                      }),
                                ],
                              )
                            :           DrawerButton(
                            active: false,
                            context: context,
                            title: "Acessar conta",
                            iconData: Icons.lock_outline,
                            menutitle: null,
                            onPressed: () {
                                 Modular.to.pushReplacementNamed(ConstantsRoutes.LOGIN);
                            });
                      })));
    });
  }
}
