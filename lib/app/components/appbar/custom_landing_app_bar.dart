import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';
import 'package:marketplace_store_web/app/utils/image/image_path.dart';

import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';

class CustomLandingAppBar extends PreferredSize {
  final double height;

  CustomLandingAppBar({this.height = kToolbarHeight});

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
                ? Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 0),
                                child: ElevatedButton(
                                  onPressed: () {
                                      Modular.to.pushReplacementNamed(ConstantsRoutes.REGISTERPAGE);
                                  },
                                  child: Container(
                                      margin: EdgeInsets.all(10),
                                      child: Text(
                                        "Me cadastrar",
                                        style: AppThemeUtils.normalBoldSize(
                                            color: AppThemeUtils.whiteColor),
                                      )),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.transparent,
                                      elevation: 0),
                                )),
                            Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Modular.to.pushReplacementNamed(ConstantsRoutes.LOGIN);

                                  },
                                  child: Container(
                                      margin: EdgeInsets.all(10),
                                      child: Text(
                                        "Acessar conta",
                                        style: AppThemeUtils.normalBoldSize(
                                            color: AppThemeUtils.colorPrimary),
                                      )),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white, elevation: 0),
                                ))
                          ],
                        )))
                : Align(
                    alignment: Alignment.centerRight,
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
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    child: SvgPicture.asset(
                      ImagePath.imageLogo,
                    ),
                  ),
                )),
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
