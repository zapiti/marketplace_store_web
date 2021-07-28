import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:marketplace_store_web/app/components/page/page_web.dart';
import 'package:marketplace_store_web/app/modules/store/modules/account/account_store.dart';

import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';


class AccountAlterMyWalletPage extends StatefulWidget {
  @override
  AccountAlterMyWalletPageState createState() =>
      AccountAlterMyWalletPageState();
}

class AccountAlterMyWalletPageState extends State<AccountAlterMyWalletPage> {
  var enableWallet = false;
  final accountControl = Modular.get<AccountStore>();

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
                onChanged: (text) {
                  accountControl.accountInfo.cpfCnpj = text;
                },
                onSubmitted: (term) {},
                controller: TextEditingController(
                    text: accountControl.accountInfo.cpfCnpj),
                decoration: InputDecoration(
                    labelText: "CPF/CNPJ",
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.3),
                    )))),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(24),
                ],
                textAlign: TextAlign.start,
                controller: TextEditingController(
                    text: accountControl.accountInfo.bank),
                textAlignVertical: TextAlignVertical.center,
                onChanged: (text) {
                  accountControl.accountInfo.bank = text;
                },
                onSubmitted: (term) {},
                decoration: InputDecoration(
                    labelText: "Banco",
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.3),
                    )))),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(24),
                ],
                textAlign: TextAlign.start,
                controller: TextEditingController(
                    text: accountControl.accountInfo.account),
                textAlignVertical: TextAlignVertical.center,
                onChanged: (text) {
                  accountControl.accountInfo.account = text;
                },
                onSubmitted: (term) {},
                decoration: InputDecoration(
                    labelText: "Conta",
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.3),
                    )))),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(24),
                ],
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                onChanged: (text) {
                  accountControl.accountInfo.agency = text;
                },
                controller: TextEditingController(
                    text: accountControl.accountInfo.agency),
                onSubmitted: (term) {},
                decoration: InputDecoration(
                    labelText: "Agência",
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.3),
                    )))),
        Container(
          margin: EdgeInsets.only(top: 20, left: 5, right: 5),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style:
                  ElevatedButton.styleFrom(primary: AppThemeUtils.colorPrimary),
              child: Text(
                "ADICIONAR CONTA",
                style:
                    AppThemeUtils.normalSize(color: AppThemeUtils.whiteColor),
              ),
              onPressed: () {
                accountControl.updateAccount(
                    context, accountControl.accountInfo);
              },
            ),
          ),
        ),
      ],
    ));
  }
}
