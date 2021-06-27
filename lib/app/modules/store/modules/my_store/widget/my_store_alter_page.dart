import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:marketplace_store_web/app/components/empty/empty_view.dart';
import 'package:marketplace_store_web/app/components/load/load_elements.dart';
import 'package:marketplace_store_web/app/modules/store/modules/home/item/item_product_edit.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';

import '../my_store_store.dart';
import 'options_my_store.dart';

class MyStoreAlterPage extends StatefulWidget {
  @override
  _MyStoreAlterPageState createState() => _MyStoreAlterPageState();
}

class _MyStoreAlterPageState
    extends ModularState<MyStoreAlterPage, MyStoreStore> {
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
                            height: 60,width: 240,
                            margin: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 20),
                            child: ElevatedButton(
                              child: AutoSizeText(
                                "Definir horário de funcionamento",textAlign: TextAlign.center,minFontSize: 8,
                                style: AppThemeUtils.normalSize(
                                    fontSize: 14,
                                    color: controller.actualPage ==
                                            controller.HORARIO
                                        ? AppThemeUtils.whiteColor
                                        : AppThemeUtils.colorPrimary),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: controller.actualPage ==
                                          controller.HORARIO
                                      ? AppThemeUtils.colorPrimary
                                      : AppThemeUtils.whiteColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(4.0),
                                      side: BorderSide(
                                          color: AppThemeUtils.colorPrimary))),
                              onPressed: () {
                                controller.selectedPage(controller.HORARIO);
                              },
                            )))),
                Flexible(
                    child: Observer(
                        builder: (_) => Container(
                            height: 60,width: 240,
                            margin: EdgeInsets.symmetric(
                                horizontal: 2, vertical: 20),
                            child: ElevatedButton(
                              child: AutoSizeText(
                                "Definir tempo para preparo",textAlign: TextAlign.center,minFontSize: 8,
                                style: AppThemeUtils.normalSize(
                                    fontSize: 14,
                                    color: controller.actualPage ==
                                        controller.MYTEMPO
                                        ? AppThemeUtils.whiteColor
                                        : AppThemeUtils.colorPrimary),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: controller.actualPage ==
                                      controller.MYTEMPO
                                      ? AppThemeUtils.colorPrimary
                                      : AppThemeUtils.whiteColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      new BorderRadius.circular(4.0),
                                      side: BorderSide(
                                          color: AppThemeUtils.colorPrimary))),
                              onPressed: () {
                                controller.selectedPage(controller.MYTEMPO);
                              },
                            )))),
                Flexible(
                    child: Observer(
                        builder: (_) => Container(
                            height: 60,width: 240,
                            margin: EdgeInsets.symmetric(
                                horizontal: 2, vertical: 20),
                            child: ElevatedButton(
                              child: AutoSizeText(
                                "Telefone para contato",textAlign: TextAlign.center,minFontSize: 8,
                                style: AppThemeUtils.normalSize(
                                    fontSize: 14,
                                    color: controller.actualPage ==
                                            controller.TELEFONE
                                        ? AppThemeUtils.whiteColor
                                        : AppThemeUtils.colorPrimary),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: controller.actualPage ==
                                          controller.TELEFONE
                                      ? AppThemeUtils.colorPrimary
                                      : AppThemeUtils.whiteColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(4.0),
                                      side: BorderSide(
                                          color: AppThemeUtils.colorPrimary))),
                              onPressed: () {
                                controller.selectedPage(controller.TELEFONE);
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
                        ? 0
                        : 0),
                child: OptionsMyStore(controller)))
      ],
    );
  }
}
