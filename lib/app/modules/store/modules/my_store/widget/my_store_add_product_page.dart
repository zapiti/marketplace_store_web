import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:marketplace_store_web/app/components/empty/empty_view.dart';
import 'package:marketplace_store_web/app/components/load/load_elements.dart';
import 'package:marketplace_store_web/app/modules/store/modules/home/item/item_product_edit.dart';
import 'package:marketplace_store_web/app/modules/store/modules/my_store/widget/options_my_store_product.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';

import '../my_store_store.dart';
import 'options_my_store.dart';

class MyStoreAddProductPage extends StatefulWidget {
  @override
  _MyStoreAddProductPageState createState() => _MyStoreAddProductPageState();
}

class _MyStoreAddProductPageState
    extends ModularState<MyStoreAddProductPage, MyStoreStore> {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Utils.isSmalSize(
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width))
          ? Axis.horizontal
          : Axis.vertical,
      children: [
        Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Flex(
              mainAxisAlignment: Utils.isSmalSize(BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width))
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              direction: Utils.isSmalSize(BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width))
                  ? Axis.vertical
                  : Axis.horizontal,
              children: [
                Flexible(
                    child: Observer(
                        builder: (_) => Container(
                            height: 60,
                            width: 240,
                            margin: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 25),
                            child: ElevatedButton(
                              child: AutoSizeText(
                                "Sobre o produto",
                                textAlign: TextAlign.center,
                                minFontSize: 8,
                                style: AppThemeUtils.normalSize(
                                    fontSize: 14,
                                    color: controller.actualProductPage ==
                                            controller.SOBRE
                                        ? AppThemeUtils.whiteColor
                                        : AppThemeUtils.colorPrimary),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: controller.actualProductPage ==
                                          controller.SOBRE
                                      ? AppThemeUtils.colorPrimary
                                      : AppThemeUtils.whiteColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(4.0),
                                      side: BorderSide(
                                          color: AppThemeUtils.colorPrimary))),
                              onPressed: () {
                                controller
                                    .selectedProductPage(controller.SOBRE);
                              },
                            )))),
                Flexible(
                    child: Observer(
                        builder: (_) => Container(
                            height: 60,
                            width: 240,
                            margin: EdgeInsets.symmetric(
                                horizontal: 2, vertical: 20),
                            child: ElevatedButton(
                              child: AutoSizeText(
                                "Quantidade",
                                textAlign: TextAlign.center,
                                minFontSize: 8,
                                style: AppThemeUtils.normalSize(
                                    fontSize: 14,
                                    color: controller.actualProductPage ==
                                            controller.QUANTIDADE
                                        ? AppThemeUtils.whiteColor
                                        : AppThemeUtils.colorPrimary),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: controller.actualProductPage ==
                                          controller.QUANTIDADE
                                      ? AppThemeUtils.colorPrimary
                                      : AppThemeUtils.whiteColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(4.0),
                                      side: BorderSide(
                                          color: AppThemeUtils.colorPrimary))),
                              onPressed: () {
                                controller
                                    .selectedProductPage(controller.QUANTIDADE);
                              },
                            )))),
                Flexible(
                    child: Observer(
                        builder: (_) => Container(
                            height: 60,
                            width: 240,
                            margin: EdgeInsets.symmetric(
                                horizontal: 2, vertical: 20),
                            child: ElevatedButton(
                              child: AutoSizeText(
                                "Código de barras",
                                textAlign: TextAlign.center,
                                minFontSize: 8,
                                style: AppThemeUtils.normalSize(
                                    fontSize: 14,
                                    color: controller.actualProductPage ==
                                            controller.CODIGO_DE_BARRAS
                                        ? AppThemeUtils.whiteColor
                                        : AppThemeUtils.colorPrimary),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: controller.actualProductPage ==
                                          controller.CODIGO_DE_BARRAS
                                      ? AppThemeUtils.colorPrimary
                                      : AppThemeUtils.whiteColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(4.0),
                                      side: BorderSide(
                                          color: AppThemeUtils.colorPrimary))),
                              onPressed: () {
                                controller.selectedProductPage(
                                    controller.CODIGO_DE_BARRAS);
                              },
                            )))),
              ],
            )),
        Expanded(
            child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: Utils.isSmalSize(BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width))
                        ? 20
                        : 0),
                child: OptionsMyStoreProduct(controller)))
      ],
    );
  }
}
