import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

import 'cart_store.dart';

class CartPage extends StatefulWidget {
  final bool hideByZero;

  CartPage({this.hideByZero = false});

  @override
  CartPageState createState() => CartPageState();
}

class CartPageState extends ModularState<CartPage, CartStore> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getTempList();
  }


  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) =>  Container(
          margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: AppThemeUtils.colorPrimary,
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10),
                          color: Colors.black38,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            controller.listProductCart.length.toString(),
                            style: AppThemeUtils.normalBoldSize(
                                color: AppThemeUtils.whiteColor),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          child: Text(
                            "Finalizar pedido",
                            style: AppThemeUtils.normalBoldSize(
                                color: AppThemeUtils.whiteColor, fontSize: 14),
                          ),
                        )),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            controller.getMoneyValue(),
                            style: AppThemeUtils.normalBoldSize(
                                color: AppThemeUtils.whiteColor),
                          ),
                        )
                      ],
                    ))));
  }
}
