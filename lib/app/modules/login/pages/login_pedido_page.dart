

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/components/load/load_elements.dart';
import 'package:marketplace_store_web/app/modules/login/login_store.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

class LoginPedidoPage extends StatefulWidget {
  @override
  _LoginPedidoPageState createState() => _LoginPedidoPageState();
}

class _LoginPedidoPageState extends ModularState<LoginPedidoPage, LoginStore> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
    child: Center(
    child: Container(
    width: 500,
    child: Center(
    child: SingleChildScrollView(
    child: Column(
    children: [

          Container(
            margin: EdgeInsets.only(bottom: 30,right: 20,left: 20,top: 30),
            child: Text(
              "Bem-vindo!",    textAlign: TextAlign.center,
              style: AppThemeUtils.normalBoldSize(fontSize: 26),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30,right: 20,left: 20),
            width: 300,
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Insira seu ",
                  style: AppThemeUtils.normalSize(
                      color:
                      Theme.of(context).textTheme.bodyText1.color,
                      fontSize: 20),
                  children: <TextSpan>[
                    TextSpan(
                        text: "e-mail",
                        style: AppThemeUtils.normalBoldSize(
                            fontSize: 20)),
                    TextSpan(
                        text: " e ",
                        style: AppThemeUtils.normalSize(
                            fontSize: 20)),
                    TextSpan(
                        text: "senha",
                        style: AppThemeUtils.normalBoldSize(
                            fontSize: 20)),
                    TextSpan(
                        text: " para acessar sua conta:",
                        style: AppThemeUtils.normalSize(
                            fontSize: 20)),
                  ],
                ))
          ),
          Container(
              height: 50,
              color: AppThemeUtils.colorGrayBg,
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Observer(
                  builder: (context) => TextField(
                      enabled: !controller.isLoadLogin,
                      controller: controller.userController,
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                          labelText: "E-mail",
                          prefixIcon: Icon(
                            Icons.person,
                            color: AppThemeUtils.colorPrimary,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppThemeUtils.colorGrayBg, width: 0.0),
                          ))))),
          SizedBox(
            height: 30,
          ),
          Container(
              height: 50,
              color: AppThemeUtils.colorGrayBg,
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Observer(
                  builder: (context) => TextField(
                      enabled: !controller.isLoadLogin,
                      obscureText: controller.showHidePass,
                      controller: controller.passController,
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                          labelText: "Senha",
                          prefixIcon: Icon(
                            Icons.lock,
                            color: AppThemeUtils.colorPrimary,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.showHidePass
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppThemeUtils.darkGrey,
                            ),
                            onPressed: () {
                              controller.showHideIcon();
                            },
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppThemeUtils.colorGrayBg, width: 0.0),
                          ))))),
          Observer(
              builder: (context) => controller.isLoadLogin
                  ? SizedBox()
                  : Container(
                      margin: EdgeInsets.only(
                          bottom: 20, top: 10, right: 25, left: 25),
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent, elevation: 0),
                          onPressed: () {},
                          child: Text(
                            "Esqueceu sua senha?",
                            style: AppThemeUtils.normalSize(
                                color: AppThemeUtils.colorPrimary),
                          )))),
        Container(
          margin: EdgeInsets.only(
              bottom: 20, top: 10, right: 25, left: 25),
          width: MediaQuery.of(context).size.width,height: 50,
          child: Observer(
              builder: (context) => controller.isLoadLogin
                  ? loadElements()
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: AppThemeUtils.colorPrimary),
                      onPressed: () {
                        controller.getLoginClient(context);
                      },
                      child: Text(
                        "Entrar",
                        style: AppThemeUtils.normalBoldSize(
                            color: AppThemeUtils.whiteColor),
                      ),
                    ))),

          Container(
              margin: EdgeInsets.only(
                  bottom: 0, top: 10, right: 25, left: 25),
              alignment: Alignment.center,
              child: Text(
                    "Ainda não tem uma conta?",
                    style: AppThemeUtils.normalSize(
                        color: AppThemeUtils.black),
                  )),
          Container(
              margin: EdgeInsets.only(
                  bottom: 20, top: 0, right: 25, left: 25),
              alignment: Alignment.center,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent, elevation: 0),
                  onPressed: () {
                    Modular.to.pushReplacementNamed(ConstantsRoutes.REGISTERPAGE);
                  },
                  child: Text(
                    "Cadastre-se",
                    style: AppThemeUtils.normalSize(
                        color: AppThemeUtils.colorPrimary),
                  )))
        ],
      ))))),
    );
  }
}
