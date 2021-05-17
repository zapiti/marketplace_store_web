import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/components/divider/line_view_widget.dart';
import 'package:marketplace_store_web/app/components/mobile/title_descritption_web_widget.dart';
import 'package:marketplace_store_web/app/components/page/page_web.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';
import 'package:timelines/timelines.dart';

class AccountAlterMyWalletPage extends StatefulWidget {
  @override
  AccountAlterMyWalletPageState createState() => AccountAlterMyWalletPageState();
}

class AccountAlterMyWalletPageState extends State<AccountAlterMyWalletPage> {
  var enableWallet = false;

  @override
  Widget build(BuildContext context) {
    return PageWeb(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.only(top: 30, bottom: 20),
            child: Text(
              "Alterar carteira",
              style: AppThemeUtils.normalBoldSize(
                  color: AppThemeUtils.colorPrimary, fontSize: 24),
            )),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Text(
              "Para receber o saldo, preencha os campos com sua conta",
              style: AppThemeUtils.normalSize(fontSize: 16),
            )),
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
                    labelText: "CPF/CNPJ",
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
                    labelText: "Banco",
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
                    labelText: "Conta",
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
                    labelText: "Agência",
                    border: const OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey, width: 0.3),
                    )))),

        Container(
          margin: EdgeInsets.only(top: 20, left: 5, right: 5),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: AppThemeUtils.colorPrimary),
              child: Text(
                "ADICIONAR CONTA",
                style: AppThemeUtils.normalSize(
                    color: AppThemeUtils.whiteColor),
              ),
              onPressed: () {},
            ),
          ),
        ),
      ],
    ));
  }
}
