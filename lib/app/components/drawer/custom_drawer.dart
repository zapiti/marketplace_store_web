import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/models/menu.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';

import 'drawer_button_widget.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Utils.isSmalSize(constraints)
          ? Container(width: 0,height: 0,)
          : Container(
              color: Theme.of(context).backgroundColor,
              height: MediaQuery.of(context).size.height,
              width: 300,
              child: SafeArea(
                  top: false,
                  bottom: true,
                  right: true,
                  left: true,
                  child: ListView.builder(
                      itemCount: Menu.getListWithPermission(null).length,
                      padding: EdgeInsets.only(bottom: 80),
                      itemBuilder: (context, index) {
                        return index == 0
                            ? Column(
                                children: [
                                  SizedBox(height: 15),
                                  DrawerButton(
                                      active: ModalRoute.of(context)
                                          .settings
                                          .name
                                          .contains(Menu.getListWithPermission(
                                                  null)[index]
                                              .route),
                                      context: context,
                                      title: Menu.getListWithPermission(
                                              null)[index]
                                          .title,
                                      iconData: Menu.getListWithPermission(
                                              null)[index]
                                          .icon,
                                      menutitle: Menu.getListWithPermission(
                                              null)[index]
                                          .menuTitle,
                                      onPressed: () {}),
                                ],
                              )
                            : DrawerButton(
                                active: ModalRoute.of(context)
                                    .settings
                                    .name
                                    .contains(
                                        Menu.getListWithPermission(null)[index]
                                            .route),
                                context: context,
                                title: Menu.getListWithPermission(null)[index]
                                    .title,
                                iconData:
                                    Menu.getListWithPermission(null)[index]
                                        .icon,
                                menutitle:
                                    Menu.getListWithPermission(null)[index]
                                        .menuTitle,
                                onPressed: () {});
                      })));
    });
  }
}
