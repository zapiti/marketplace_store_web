import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';

import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';

class CustomAppBar extends PreferredSize {
  final String title;
  final double height;

  CustomAppBar({@required this.title, this.height = kToolbarHeight});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return SafeArea(
          child: Container(
        height: preferredSize.height,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Utils.isSmalSize(constraints)
                ? SizedBox()
                : Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: Container(
                            height: 40,
                            width: 40,
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                              child: Icon(
                                Icons.menu,
                                color: AppThemeUtils.colorPrimary,
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle)))),
            Align(
                alignment: Alignment.center,
                child: Container(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppThemeUtils.normalBoldSize(
                        color: AppThemeUtils.whiteColor, fontSize: 18),
                  ),
                )),
            Align(
                alignment: Alignment.centerRight,
                child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                    child: ElevatedButton(
                      onPressed: () {
                          Modular.to.pushReplacementNamed(ConstantsRoutes.REGISTERPAGE);
                      },
                      child: Text("Me cadastrar",style: AppThemeUtils.normalSize(color: AppThemeUtils.whiteColor),),
                      style:
                          ElevatedButton.styleFrom(primary: Colors.transparent,elevation: 0),
                    )),
                    Container(
                        child: ElevatedButton(
                          onPressed: () {
                               Modular.to.pushReplacementNamed(ConstantsRoutes.LOGIN);
                          },
                          child: Text("Acessar conta",style: AppThemeUtils.normalSize(color: AppThemeUtils.colorPrimary),),
                          style:
                          ElevatedButton.styleFrom(primary: Colors.white,elevation: 0),
                        ))
                  ],
                )))
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(0.0),
                bottomRight: Radius.circular(40.0),
                topLeft: Radius.circular(0.0),
                bottomLeft: Radius.circular(00.0))),
      ));
    });
  }
}
