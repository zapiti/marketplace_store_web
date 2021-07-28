import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/components/page/page_web.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

import '../../../../store_store.dart';
import '../../my_store_store.dart';

class StorePhone extends StatelessWidget {
  final MyStoreStore controller;
  final storeControl = Modular.get<StoreStore>();

  StorePhone(this.controller);

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
              "Para que o cliente entre em contato com sua loja, defina o número de contato",
              style: AppThemeUtils.normalSize(fontSize: 16),
            )),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: TextField(
              controller: TextEditingController(
                  text: storeControl.establishment?.companyName ?? ''),
              maxLines: 1,
              inputFormatters: [
                LengthLimitingTextInputFormatter(50),
              ],
              onChanged: (text) {
                storeControl.establishment?.companyName = text;
              },
              textAlign: TextAlign.center,
              decoration: new InputDecoration(
                  labelText: 'Nome estabelecimento',
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0.3),
                  )),
            )),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: TextField(
              controller: TextEditingController(
                  text: storeControl.establishment?.description ?? ''),
              maxLines: 1,
              inputFormatters: [
                LengthLimitingTextInputFormatter(50),
              ],
              onChanged: (text) {
                storeControl.establishment?.description = text;
              },
              textAlign: TextAlign.center,
              decoration: new InputDecoration(
                  labelText: 'Descrição',
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0.3),
                  )),
            )),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(24),
                ],
                textAlign: TextAlign.start,
                maxLines: 1,
                controller: TextEditingController(
                    text: storeControl.establishment?.phone),
                textAlignVertical: TextAlignVertical.center,
                onSubmitted: (term) {},
                onChanged: (text) {
                  storeControl.establishment?.phone = text;
                },
                decoration: InputDecoration(
                    labelText: "Telefone/Celular",
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
