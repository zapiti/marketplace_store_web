import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/components/picker/user_image_widget.dart';
import 'package:marketplace_store_web/app/components/select/custom_drop_menu.dart';
import 'package:marketplace_store_web/app/models/pairs.dart';
import 'package:marketplace_store_web/app/modules/store/modules/my_store/my_store_store.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

class ProductSobre extends StatelessWidget {
  final MyStoreStore controller;

  ProductSobre(this.controller);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: UserImageWidget(
            changeImage: (txt) {},
            width: MediaQuery.of(context).size.width,
            height: 160,
            isRounded: false,
            addButtom: "Adicionar foto do produto",
            userImage: controller.imageTempProduct,
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: TextField(
              controller: controller.nomeProductController,
              onChanged: (text) {},
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide()),
                  labelText: 'Nome do produto*'),
            )),
        Row(
          children: [
            Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 5),
                  child: TextField(
                    controller: controller.valueProductController,
                    onChanged: (text) {},
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide()),
                        labelText: 'Valor*'),
                  )),
            ),
            Expanded(
              child: Padding(
                  padding: EdgeInsets.only(right: 20, left: 5),
                  child: TextField(
                    controller: controller.valuePromotionController,
                    onChanged: (text) {},
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide()),
                        labelText: 'Promoção'),
                  )),
            )
          ],
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: CustomDropMenuWidget(
              controller: controller.categoryController,
              isExpanded: true,
              title: "Categoria*",
              listElements: [
                Pairs("Comida", "Comida"),
                Pairs("Bebida", "Bebida"),
              ],
            )),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: TextField(
              controller: controller.setorProductController,
              onChanged: (text) {},
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide()),
                  labelText: 'Setor onde o produto se localiza'),
            )),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: TextField(
              controller: controller.descrProductController,
              onChanged: (text) {},
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
              controller.nextToQuantity(context);
            },
            style:
                ElevatedButton.styleFrom(primary: AppThemeUtils.colorPrimary),
          ),
        )
      ],
    ));
  }
}
