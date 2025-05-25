import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:new_marketplace_web/app/components/page/page_web.dart';
import 'package:new_marketplace_web/app/modules/store/modules/account/account_store.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';

class AccountAlterPassPage extends StatefulWidget {
  @override
  AccountAlterPassPageState createState() => AccountAlterPassPageState();
}

class AccountAlterPassPageState
    extends ModularState<AccountAlterPassPage, AccountStore> {
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
                "Alterar senha",
                style: AppThemeUtils.normalBoldSize(
                    color: Theme.of(context).colorScheme.primary, fontSize: 24),
              )),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: Text(
                "Digite sua senha atual para definir sua nova senha de acesso",
                style: AppThemeUtils.normalSize(fontSize: 16),
              )),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: TextField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(24),
                  ],
                  obscureText: controller.showPassActual,
                  controller: controller.controllerPassActualPass,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  onChanged: (text) {},
                  onSubmitted: (term) {},
                  decoration: InputDecoration(
                      labelText: "Senha atual",
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.showPassActual
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: () {
                          controller.hideActualPass();
                        },
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.3),
                      )))),
          SizedBox(
            height: 10,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: TextField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(24),
                  ],
                  obscureText: controller.showPass,
                  controller: controller.controllerPass,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  onChanged: (text) {
                    // controller.updatePass(text, context);
                  },
                  onSubmitted: (term) {},
                  decoration: InputDecoration(
                      labelText: "Nova senha",
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.showPass
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: () {
                          controller.hidePass();
                        },
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.3),
                      )))),
          SizedBox(
            height: 5,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: TextField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(24),
                  ],
                  obscureText: controller.showPassConfirm,
                  controller: controller.controllerPassConfirm,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  onSubmitted: (term) {},
                  decoration: InputDecoration(
                      labelText: "Confirmar nova senha",
                      suffixIcon: IconButton(
                        icon: Icon(
                          true ? Icons.visibility : Icons.visibility_off,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: () {
                          controller.hidePassConfirm();
                        },
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.3),
                      )))),
          Container(
            margin: EdgeInsets.only(top: 20, left: 5, right: 5),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary),
                child: Text(
                  "ALTERAR SENHA",
                  style:
                      AppThemeUtils.normalSize(color: AppThemeUtils.whiteColor),
                ),
                onPressed: () {
                  controller.changePass(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
