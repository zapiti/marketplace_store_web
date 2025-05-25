import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_marketplace_web/app/components/picker/user_image_widget.dart';
import 'package:new_marketplace_web/app/components/select/custom_drop_menu.dart';
import 'package:new_marketplace_web/app/models/pairs.dart';
import 'package:new_marketplace_web/app/modules/store/modules/my_store/my_store_store.dart';
import 'package:new_marketplace_web/app/utils/image/image_path.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';

class ProductBarCode extends StatelessWidget {
  final MyStoreStore controller;

  ProductBarCode(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                children: [
                  Center(
                      child: SvgPicture.asset(
                    ImagePath.bg_barcode,
                    width: 270,
                    height: 270,
                  )),
                  Center(
                      child: SvgPicture.asset(
                    ImagePath.ic_barcode,
                    width: 170,
                    height: 170,
                  )),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              width: double.infinity,
              child: Text(
                "Código de barras",
                textAlign: TextAlign.center,
                style: AppThemeUtils.normalBoldSize(
                    color: AppThemeUtils.black, fontSize: 18),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              width: double.infinity,
              child: Text(
                "Para a segurança dos produtos, digite o código de barras do item.",
                textAlign: TextAlign.center,
                style: AppThemeUtils.normalSize(),
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 70,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      "DIGITAR CÓDIGO",
                      style: AppThemeUtils.normalSize(
                          color: AppThemeUtils.whiteColor),
                    ),
                    onPressed: () {
                      controller.saveProductToDigite(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppThemeUtils.colorPrimary),
                  ),
                )),
              ],
            ),
            Container(
              height: 70,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: double.infinity,
              child: ElevatedButton(
                child: Text(
                  "PRODUTO SEM CÓDIGO",
                  style:
                      AppThemeUtils.normalSize(color: AppThemeUtils.whiteColor),
                ),
                onPressed: () {
                  controller.saveProduct(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppThemeUtils.darkGrey),
              ),
            )
          ],
        )));
  }
}
