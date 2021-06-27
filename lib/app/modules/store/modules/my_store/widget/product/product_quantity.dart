import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/components/select/custom_drop_menu.dart';
import 'package:marketplace_store_web/app/components/select/select_button.dart';
import 'package:marketplace_store_web/app/models/pairs.dart';
import 'package:marketplace_store_web/app/modules/store/modules/my_store/my_store_store.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

class ProductQuantity extends StatefulWidget {
  final MyStoreStore controller;

  ProductQuantity(this.controller);

  @override
  _ProductQuantityState createState() => _ProductQuantityState();
}

class _ProductQuantityState extends State<ProductQuantity> {
  Pairs? newStoreUnity;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                child: SelectButton(
                  title: [Pairs("Unidade", "Unidade"), Pairs("Peso", "Peso")],
                  tapIndex: (myPairs) {
                    setState(() {
                      newStoreUnity = myPairs;
                    });
                  },
                )),
            newStoreUnity == null
                ? SizedBox()
                : newStoreUnity?.first == "Unidade"
                    ? Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: TextField(
                          controller:
                              widget.controller.quantityProductController,
                          onChanged: (text) {},
                          decoration: InputDecoration(
                              border:
                                  OutlineInputBorder(borderSide: BorderSide()),
                              labelText: 'Quantidade em estoque*'),
                        ))
                    : Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Column(
                          children: [
                            CustomDropMenuWidget(
                              controller: widget.controller.categoryController,
                              isExpanded: true,
                              title: "Espeficações*",
                              listElements: [
                                Pairs("Gramas", "Gramas"),
                                Pairs("Kilos", "Kilos"),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: TextField(
                                  controller: widget
                                      .controller.quantityProductController,
                                  onChanged: (text) {},
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide()),
                                      labelText: 'Qtd mínima*'),
                                )),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: TextField(
                                  controller: widget
                                      .controller.quantityProductController,
                                  onChanged: (text) {},
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide()),
                                      labelText: 'Qtd máxima*'),
                                ))
                              ],
                            )
                          ],
                        )),
            Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: double.infinity,
              child: ElevatedButton(
                child: Text(
                  "ADICIONAR",
                  style:
                      AppThemeUtils.normalSize(color: AppThemeUtils.whiteColor),
                ),
                onPressed: newStoreUnity == null
                    ? null
                    : () {
                        widget.controller.nextToQrcode(context);
                      },
                style: ElevatedButton.styleFrom(
                    primary: AppThemeUtils.colorPrimary),
              ),
            )
          ],
        )));
  }
}
