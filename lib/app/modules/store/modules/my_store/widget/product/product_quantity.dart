import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:new_marketplace_web/app/components/select/custom_drop_menu.dart';
import 'package:new_marketplace_web/app/components/select/select_button.dart';
import 'package:new_marketplace_web/app/models/pairs.dart';
import 'package:new_marketplace_web/app/modules/store/modules/my_store/my_store_store.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';

class ProductQuantity extends StatefulWidget {
  final MyStoreStore controller;

  ProductQuantity(this.controller);

  @override
  _ProductQuantityState createState() => _ProductQuantityState();
}

class _ProductQuantityState extends State<ProductQuantity> {
  Pairs newStoreUnity = Pairs("UNIDADE", "UNIDADE");

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
                  title: [Pairs("UNIDADE", "UNIDADE"), Pairs("PESO", "PESO")],
                  tapIndex: (myPairs) {
                    setState(() {
                      newStoreUnity = myPairs;
                    });
                    widget.controller.currentProduct.quantityType =
                        myPairs.first;
                  },
                )),
            newStoreUnity.first == "UNIDADE"
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: TextField(
                      controller: MaskedTextController(
                          text: widget.controller.currentProduct.stock
                              ?.toString(),
                          mask: '0000000'),
                      onChanged: (text) {
                        if (text.isNotEmpty) {
                          widget.controller.currentProduct.stock =
                              double.tryParse(text);
                        } else {
                          widget.controller.currentProduct.stock = 0.0;
                        }
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide()),
                          labelText: 'Quantidade em estoque*'),
                    ))
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Column(
                      children: [
                        CustomDropMenuWidget(
                          controller: TextEditingController(
                              text: widget
                                  .controller.currentProduct.quantityType),
                          isExpanded: true,
                          title: "Espeficações*",
                          listen: (text) {
                            widget.controller.currentProduct.specification =
                                text;
                          },
                          listElements: [
                            Pairs("GRAMAS", "GRAMAS"),
                            Pairs("KILOS", "KILOS"),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: TextField(
                              controller: MaskedTextController(
                                  text: widget.controller.currentProduct.qtdMin
                                      .toString(),
                                  mask: '0000000'),
                              onChanged: (text) {
                                if (text.isNotEmpty) {
                                  widget.controller.currentProduct.qtdMin =
                                      double.tryParse(text);
                                } else {
                                  widget.controller.currentProduct.qtdMin = 0.0;
                                }
                              },
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
                              controller: MaskedTextController(
                                  text: widget.controller.currentProduct.qtdMax
                                      .toString(),
                                  mask: '0000000'),
                              onChanged: (text) {
                                if (text.isNotEmpty) {
                                  widget.controller.currentProduct.qtdMax =
                                      double.tryParse(text);
                                } else {
                                  widget.controller.currentProduct.qtdMax = 0.0;
                                }
                              },
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
                        widget.controller.updateCurrentProduct(
                            widget.controller.currentProduct);
                        widget.controller.nextToQrcode(context);
                      },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppThemeUtils.colorPrimary),
              ),
            )
          ],
        )));
  }
}
