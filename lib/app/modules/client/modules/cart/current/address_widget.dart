


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_marketplace_web/app/modules/client/modules/order/components/sub_nivel/show_details_order_widget.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';

class AddressWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          children: [
            Expanded(
                child: buttonSelected(true, "Cadastrar endereço",
                    'Coloque o endereço de entrega', () {},color:AppThemeUtils.colorPrimary)),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: buttonSelected(false, 'Endereços cadastrados',
                    'Selecione endereço cadastrado', () {},color:AppThemeUtils.colorPrimary))
          ],
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(24),
                ],
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                onChanged: (text) {},
                onSubmitted: (term) {},
                decoration: InputDecoration(
                    labelText: "Cep",
                    border: const OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey, width: 0.3),
                    )))),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(24),
                ],
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                onChanged: (text) {},
                onSubmitted: (term) {},
                decoration: InputDecoration(
                    labelText: "Endereço",
                    border: const OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey, width: 0.3),
                    )))),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(24),
                ],
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                onChanged: (text) {},
                onSubmitted: (term) {},
                decoration: InputDecoration(
                    labelText: "Bairro",
                    border: const OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey, width: 0.3),
                    )))),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(24),
                ],
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                onChanged: (text) {},
                onSubmitted: (term) {},
                decoration: InputDecoration(
                    labelText: "Número",
                    border: const OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey, width: 0.3),
                    )))),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(24),
                ],
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                onChanged: (text) {},
                onSubmitted: (term) {},
                decoration: InputDecoration(
                    labelText: "Complemento",
                    border: const OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey, width: 0.3),
                    )))),
        Container(
            height: 50,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
            child: ElevatedButton(
              onPressed: () {},
              child: Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "ADICIONAR ENDEREÇO",
                    style: AppThemeUtils.normalBoldSize(
                        color: AppThemeUtils.whiteColor),
                  )),
              style: ElevatedButton.styleFrom(
                  primary: AppThemeUtils.colorPrimary, elevation: 0),
            ))
      ],),
    );
  }
}
