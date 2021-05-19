import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketplace_store_web/app/components/page/page_web.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

import '../../my_store_store.dart';

class StorePhone extends StatelessWidget {
  final MyStoreStore controller;

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
                inputFormatters: [
                  LengthLimitingTextInputFormatter(24),
                ],
                textAlign: TextAlign.start,
                maxLines: 1,
                textAlignVertical: TextAlignVertical.center,
                onSubmitted: (term) {},
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
              onPressed: () {},
            ),
          ),
        )
      ],
    ));
  }
}
