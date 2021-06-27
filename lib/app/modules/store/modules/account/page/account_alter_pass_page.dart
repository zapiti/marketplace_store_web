import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/components/divider/line_view_widget.dart';
import 'package:marketplace_store_web/app/components/mobile/title_descritption_web_widget.dart';
import 'package:marketplace_store_web/app/components/page/page_web.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

class AccountAlterPassPage extends StatefulWidget {
  @override
  AccountAlterPassPageState createState() => AccountAlterPassPageState();
}

class AccountAlterPassPageState extends State<AccountAlterPassPage> {
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
                    color: AppThemeUtils.colorPrimary, fontSize: 24),
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
                  // obscureText: snapshotHide.data,
                  // controller: controller.controllerPassActualPass,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  onChanged: (text) {},
                  onSubmitted: (term) {},
                  decoration: InputDecoration(
                      labelText: "Senha atual",
                      suffixIcon: IconButton(
                        icon: Icon(
                          true ? Icons.visibility : Icons.visibility_off,
                          color: AppThemeUtils.colorPrimary,
                        ),
                        onPressed: () {
                          // controller.showPassActual.sink
                          //     .add(!snapshotHide.data);
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
                  //    obscureText: snapshotHide.data,
                  //    controller: controller.controllerPass,
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
                          true ? Icons.visibility : Icons.visibility_off,
                          color: AppThemeUtils.colorPrimary,
                        ),
                        onPressed: () {
                          // controller.showPass.sink
                          //     .add(!snapshotHide.data);
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
                  // obscureText: snapshotShowHide2.data ?? true,
                  // controller: controller.controllerConfirmPass,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  onSubmitted: (term) {},
                  decoration: InputDecoration(
                      labelText: "Confirmar nova senha",
                      suffixIcon: IconButton(
                        icon: Icon(
                          true ? Icons.visibility : Icons.visibility_off,
                          color: AppThemeUtils.colorPrimary,
                        ),
                        onPressed: () {
                          // controller.showPassConfirm.sink
                          //     .add(!snapshotShowHide2.data);
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
                    primary: AppThemeUtils.colorPrimary),
                child: Text(
                  "ALTERAR SENHA",
                  style:
                      AppThemeUtils.normalSize(color: AppThemeUtils.whiteColor),
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
