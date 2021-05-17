import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marketplace_store_web/app/modules/store/modules/my_store/my_store_store.dart';
import 'package:marketplace_store_web/app/modules/store/modules/my_store/widget/product/product_barcode.dart';
import 'package:marketplace_store_web/app/modules/store/modules/my_store/widget/product/product_quantity.dart';
import 'package:marketplace_store_web/app/modules/store/modules/my_store/widget/product/product_sobre.dart';

class OptionsMyStoreProduct extends StatelessWidget {
  MyStoreStore controller;

  OptionsMyStoreProduct(this.controller);

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Container(
              child: controller.actualProductPage == controller.SOBRE
                  ? ProductSobre(controller)
                  : controller.actualProductPage == controller.QUANTIDADE
                      ? ProductQuantity(controller)
                      : ProductBarCode(controller),
            ));
  }
}
