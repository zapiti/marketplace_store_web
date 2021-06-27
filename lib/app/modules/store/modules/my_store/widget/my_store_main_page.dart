import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:marketplace_store_web/app/components/builder/load_builder.dart';
import 'package:marketplace_store_web/app/modules/store/model/product.dart';
import 'package:marketplace_store_web/app/modules/store/modules/home/item/item_product_edit.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';

import '../my_store_store.dart';

class MyStoreMainPage extends StatelessWidget {
  MyStoreStore controller;

  MyStoreMainPage(this.controller);

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
                    child: Container(
                        height: 60,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                        child: ElevatedButton(
                          child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "Funcionamento: ",
                                style: AppThemeUtils.normalSize(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color,
                                    fontSize: 14),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: controller.horarioFuncionamento,
                                      style: AppThemeUtils.normalBoldSize(
                                          fontSize: 14)),
                                ],
                              )),
                          style: ElevatedButton.styleFrom(
                              primary: AppThemeUtils.whiteColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(4.0),
                                  side: BorderSide(
                                      color: AppThemeUtils.colorPrimary))),
                          onPressed: () {
                            controller.selectedPage(controller.HORARIO);
                            Modular.to.pushReplacementNamed(
                                ConstantsRoutes.CALL_ALTER_STORE_PAGE);
                          },
                        ))),
                Flexible(
                    child: Container(
                        height: 60,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                        child: ElevatedButton(
                          child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "Tempo de preparo: ",
                                style: AppThemeUtils.normalSize(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color,
                                    fontSize: 14),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: controller.tempoPreparo,
                                      style: AppThemeUtils.normalBoldSize(
                                          fontSize: 14)),
                                ],
                              )),
                          style: ElevatedButton.styleFrom(
                              primary: AppThemeUtils.whiteColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(4.0),
                                  side: BorderSide(
                                      color: AppThemeUtils.colorPrimary))),
                          onPressed: () {
                            controller.selectedPage(controller.MYTEMPO);
                            Modular.to.pushReplacementNamed(
                                ConstantsRoutes.CALL_ALTER_STORE_PAGE);
                          },
                        ))),
                Flexible(
                    child: Container(
                        height: 60,
                        margin:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 20),
                        child: ElevatedButton(
                          child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "Telefone: ",
                                style: AppThemeUtils.normalSize(fontSize: 14),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: controller.telefone,
                                      style: AppThemeUtils.normalBoldSize(
                                          fontSize: 14)),
                                ],
                              )),
                          style: ElevatedButton.styleFrom(
                              primary: AppThemeUtils.whiteColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(4.0),
                                  side: BorderSide(
                                      color: AppThemeUtils.colorPrimary))),
                          onPressed: () {
                            controller.selectedPage(controller.TELEFONE);
                            Modular.to.pushReplacementNamed(
                                ConstantsRoutes.CALL_ALTER_STORE_PAGE);
                          },
                        ))),
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
                child: Observer(
                    builder: (_) => LoadBuilder(
                        item: controller.listProducts,
                        emptyImage:
                            "Seu estabelecimento ainda não possui produtos para vendas",
                        child: GroupedListView<Product, String?>(
                          elements: (((controller.listProducts)) ?? []),
                          groupBy: (element) => element.categoria,
                          padding: EdgeInsets.only(bottom: 200),
                          groupSeparatorBuilder: _buildGroupSeparator,
                          itemBuilder: (context, element) =>
                              ItemProductEdit(element),
                          order: GroupedListOrder.DESC,
                        )))))
      ],
    );
  }
}

Widget _buildGroupSeparator(dynamic groupByValue) {
  return Container(
      padding: EdgeInsets.all(15),
      child: Text(
        groupByValue,
        maxLines: 1,
        style: AppThemeUtils.normalBoldSize(
            fontSize: 14, color: AppThemeUtils.black),
      ));
}
