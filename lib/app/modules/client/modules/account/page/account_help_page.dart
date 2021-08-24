import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/components/page/page_web.dart';
import 'package:marketplace_store_web/app/modules/client/modules/account/account_client_store.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

class AccountHelpPage extends StatefulWidget {
  @override
  AccountHelpPageState createState() => AccountHelpPageState();
}

class AccountHelpPageState extends ModularState<AccountHelpPage,AccountClientStore> {
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
                controller: controller.controllerHelp,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(24),
                  ],
                  textAlign: TextAlign.start,
                  maxLines: 5,
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
                  controller.sendHelp(context);
                },
              ),
            ),
          )
        ],
      )),
    );
  }
}
