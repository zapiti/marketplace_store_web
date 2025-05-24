import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:new_marketplace_web/app/components/page/page_web.dart';

import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';

import '../account_store.dart';

class AccountHelpPage extends StatefulWidget {
  @override
  AccountHelpPageState createState() => AccountHelpPageState();
}

class AccountHelpPageState extends State<AccountHelpPage> {
  var _accountStore = Modular.get<AccountStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageWeb(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(top: 30, bottom: 0, right: 20, left: 20),
              child: Text(
                "Ajuda",
                style: AppThemeUtils.normalBoldSize(
                    color: AppThemeUtils.colorPrimary, fontSize: 24),
              )),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text(
                "Olá, Nos conte em detalhes sobre o que precisa de ajuda.",
                style: AppThemeUtils.normalSize(fontSize: 16),
              )),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(24),
                  ],
                  textAlign: TextAlign.start,
                  maxLines: 5,
                  controller: _accountStore.controllerHelp,
                  textAlignVertical: TextAlignVertical.center,
                  onSubmitted: (term) {},
                  decoration: InputDecoration(
                      labelText: "Digite aqui",
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.3),
                      )))),
          Container(
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: AppThemeUtils.colorPrimary),
                child: Text(
                  "ENVIAR",
                  style:
                      AppThemeUtils.normalSize(color: AppThemeUtils.whiteColor),
                ),
                onPressed: () {
                  _accountStore.sendHelp(context);
                },
              ),
            ),
          )
        ],
      )),
    );
  }
}
