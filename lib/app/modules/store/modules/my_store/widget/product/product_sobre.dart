import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:new_marketplace_web/app/components/picker/user_image_widget.dart';
import 'package:new_marketplace_web/app/components/select/custom_drop_menu.dart';
import 'package:new_marketplace_web/app/models/pairs.dart';
import 'package:new_marketplace_web/app/modules/store/modules/my_store/my_store_store.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';

class ProductSobre extends StatelessWidget {
  final MyStoreStore controller;

  ProductSobre(this.controller);

  @override
  Widget build(BuildContext context) {
    final moneyController = MoneyMaskedTextController(
        initialValue: controller.currentProduct.value ?? 0.0,
        leftSymbol: 'R\$ ');
    final promotionController = MoneyMaskedTextController(
        initialValue: controller.currentProduct.promotionalValue ?? 0.0,
        leftSymbol: 'R\$ ');
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Observer(
              builder: (_) => UserImageWidget(
                changeImage: (txt) {
                  controller.currentProduct.image = txt;
                  controller.updateCurrentProduct(controller.currentProduct);
                },
                width: MediaQuery.of(context).size.width,
                height: 160,
                isRounded: false,
                addButtom: "Adicionar foto do produto",
                userImage: controller.currentProduct.image,
              ),
            )),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: TextField(
              controller:
                  TextEditingController(text: controller.currentProduct.name),
              onChanged: (text) {
                controller.currentProduct.name = text;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide()),
                  labelText: 'Nome do produto*'),
            )),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.only(left: 0, right: 5),
                      child: TextField(
                        controller: moneyController,
                        onChanged: (text) {
                          controller.currentProduct.value =
                              moneyController.numberValue;
                        },
                        decoration: InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide()),
                            labelText: 'Valor*'),
                      )),
                ),
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.only(right: 0, left: 5),
                      child: TextField(
                        controller: promotionController,
                        onChanged: (text) {
                          controller.currentProduct.promotionalValue =
                              promotionController.numberValue;
                        },
                        decoration: InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide()),
                            labelText: 'Promoção'),
                      )),
                )
              ],
            )),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: CustomDropMenuWidget(
              controller: TextEditingController(
                  text: controller.currentProduct.category),
              isExpanded: true,
              title: "Categoria*",
              listen: (x) {
                controller.currentProduct.category = x;
              },
              listElements: [
                Pairs("Comida", "Comida"),
                Pairs("Bebida", "Bebida"),
                Pairs("Doces", "Doces"),
                Pairs("Carnes", "Carnes"),
                Pairs("Padaria", "Padaria"),
                Pairs("Congelados", "Congelados"),
              ],
            )),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: TextField(
              controller:
                  TextEditingController(text: controller.currentProduct.sector),
              onChanged: (text) {
                controller.currentProduct.sector = text;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide()),
                  labelText: 'Setor onde o produto se localiza'),
            )),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: TextField(
              controller: TextEditingController(
                  text: controller.currentProduct.description),
              onChanged: (text) {
                controller.currentProduct.description = text;
              },
              maxLines: 5,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide()),
                  labelText: 'Descrição do produto'),
            )),
        Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          width: double.infinity,
          child: ElevatedButton(
            child: Text(
              "CONTINUAR",
              style: AppThemeUtils.normalSize(color: AppThemeUtils.whiteColor),
            ),
            onPressed: () {
              controller.updateCurrentProduct(controller.currentProduct);
              controller.nextToQuantity(context);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: AppThemeUtils.colorPrimary),
          ),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    ));
  }
}
