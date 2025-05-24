import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_web/app/components/page/page_web.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';

import '../../../../store_store.dart';
import '../../my_store_store.dart';

class StorePreparTime extends StatelessWidget {
  final MyStoreStore controller;
  final storeControl = Modular.get<StoreStore>();

  StorePreparTime(this.controller);

  @override
  Widget build(BuildContext context) {
    return PageWeb(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text(
              "Defina o tempo que o pedido ficará pronto para que o entregador possa busca-lo.",
              style: AppThemeUtils.normalSize(fontSize: 16),
            )),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(24),
                ],
                textAlign: TextAlign.start,
                controller: MaskedTextController(
                    mask: "00:00",
                    text: storeControl.establishment?.preparationTime),
                maxLines: 1,
                textAlignVertical: TextAlignVertical.center,
                onSubmitted: (term) {},
                onChanged: (text) {
                  storeControl.establishment?.preparationTime = text;
                },
                decoration: InputDecoration(
                    labelText: "Digite aqui o tempo médio",
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.3),
                    )))),
        Container(
          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style:
                  ElevatedButton.styleFrom(primary: AppThemeUtils.colorPrimary),
              child: Text(
                "DEFINIR",
                style:
                    AppThemeUtils.normalSize(color: AppThemeUtils.whiteColor),
              ),
              onPressed: () {
                storeControl.updateEstablishment(
                    context, storeControl.establishment!);
              },
            ),
          ),
        )
      ],
    ));
  }
}
