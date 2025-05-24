import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_marketplace_web/app/modules/store/store_store.dart';
import 'package:new_marketplace_web/app/routes/constants_routes.dart';
import 'package:new_marketplace_web/app/utils/image/image_path.dart';

import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';
import 'package:new_marketplace_web/app/utils/utils.dart';

class CustomStoreAppBar extends PreferredSize {
  final StoreStore controller;
  final double height;

  CustomStoreAppBar(this.controller, {this.height = kToolbarHeight}): super(child:SizedBox(),preferredSize:Size.fromHeight(height));
  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
        height: preferredSize.height,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Utils.isSmalSize(constraints)
                ? Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                        child:Observer(
                            builder: (ctx) => Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height:50, margin: EdgeInsets.symmetric(horizontal: 5),
                            child: ElevatedButton(
                          onPressed: () {
                            controller.addCurrentIndex(0);
                            Modular.to.navigate(
                                ConstantsRoutes.CALL_STORE_HOMEPAGE);
                          },
                          child: Text(
                            "Home",
                            style: AppThemeUtils.normalBoldSize(
                                color: controller.currentIndex == 0
                                    ? AppThemeUtils.colorPrimary
                                    : AppThemeUtils.darkGrey),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent, elevation: 0),
                        )),
                        Container(
                            height:50, margin: EdgeInsets.symmetric(horizontal: 5),
                            child: ElevatedButton(
                          onPressed: () {
                            controller.addCurrentIndex(1);

                            Modular.to.navigate(
                                ConstantsRoutes.CALL_MY_STORE);
                          },
                          child: Text(
                            "Minha loja",
                            style: AppThemeUtils.normalBoldSize(
                                color: controller.currentIndex == 1
                                    ? AppThemeUtils.colorPrimary
                                    : AppThemeUtils.darkGrey),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent, elevation: 0),
                        )),
                        Container(
                            height:50,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: ElevatedButton(
                          onPressed: () {
                            controller.addCurrentIndex(2);

                            Modular.to.navigate(
                                ConstantsRoutes.CALL_ACCOUNT_STORE_PAGE);
                          },
                          child: Text(
                            "Conta",
                            style: AppThemeUtils.normalBoldSize(
                                color: controller.currentIndex == 2
                                    ? AppThemeUtils.colorPrimary
                                    : AppThemeUtils.darkGrey),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent, elevation: 0),
                        )),
                      ],
                    ))))
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
                      color: AppThemeUtils.colorPrimary,
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
