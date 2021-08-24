import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:marketplace_store_web/app/components/load/load_elements.dart';
import 'package:marketplace_store_web/app/modules/register/register_store.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';

import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';

class RegisterPedidoPage extends StatefulWidget {
  @override
  _RegisterPedidoPageState createState() => _RegisterPedidoPageState();
}

class _RegisterPedidoPageState
    extends ModularState<RegisterPedidoPage, RegisterStore> {
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
                    margin: EdgeInsets.only(
                        bottom: 30, right: 20, left: 20, top: 30),
                    child: Text(
                      "Cadastre-se",
                      textAlign: TextAlign.center,
                      style: AppThemeUtils.normalBoldSize(fontSize: 26),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 30, right: 20, left: 20),
                      width: 300,
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text:
                                "Insira as informações abaixo para completar seu cadastro.",
                            style: AppThemeUtils.normalSize(fontSize: 20),
                            children: <TextSpan>[],
                          ))),
                  Container(
                      height: 50,
                      color: AppThemeUtils.colorGrayBg,
                      margin:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Observer(
                          builder: (context) => TextField(
                              enabled: !controller.isLoadLogin,
                              controller: controller.emailController,
                              textAlign: TextAlign.start,
                              textAlignVertical: TextAlignVertical.top,
                              decoration: InputDecoration(
                                  labelText: "E-mail",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppThemeUtils.colorGrayBg,
                                        width: 0.0),
                                  ))))),
                  Container(
                      height: 50,
                      color: AppThemeUtils.colorGrayBg,
                      margin:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Observer(
                          builder: (context) => TextField(
                              enabled: !controller.isLoadLogin,
                              controller: controller.nameUserController,
                              textAlign: TextAlign.start,
                              textAlignVertical: TextAlignVertical.top,
                              decoration: InputDecoration(
                                  labelText: "Nome completo",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppThemeUtils.colorGrayBg,
                                        width: 0.0),
                                  ))))),
                  Container(
                      height: 50,
                      color: AppThemeUtils.colorGrayBg,
                      margin:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Observer(
                          builder: (context) => TextField(
                              enabled: !controller.isLoadLogin,
                              obscureText: controller.showHidePass,
                              controller: controller.passController,
                              textAlign: TextAlign.start,
                              textAlignVertical: TextAlignVertical.top,
                              decoration: InputDecoration(
                                  labelText: "Senha",
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
                                        color: AppThemeUtils.colorGrayBg,
                                        width: 0.0),
                                  ))))),
                  Container(
                      height: 50,
                      color: AppThemeUtils.colorGrayBg,
                      margin:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Observer(
                          builder: (context) => TextField(
                              enabled: !controller.isLoadLogin,
                              obscureText: controller.showHidePassConfirm,
                              controller: controller.passControllerConfirm,
                              textAlign: TextAlign.start,
                              textAlignVertical: TextAlignVertical.top,
                              decoration: InputDecoration(
                                  labelText: "Confirmar Senha",
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      controller.showHidePassConfirm
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: AppThemeUtils.darkGrey,
                                    ),
                                    onPressed: () {
                                      controller.showHideConfirmIcon();
                                    },
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppThemeUtils.colorGrayBg,
                                        width: 0.0),
                                  ))))),
                  Container(

                      margin:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Observer(
                          builder: (context) => Row(
                                children: [
                                  Expanded(
                                    child: RichText(
                                        textAlign: TextAlign.start,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        text: TextSpan(
                                          text: "Li e concordo com os ",
                                          style: AppThemeUtils.normalSize(
                                              color: Colors.grey[700],
                                              fontSize: 18),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: "termos de uso",
                                                style: AppThemeUtils.normalSize(
                                                    color: AppThemeUtils
                                                        .colorPrimary,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    fontSize: 18),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {}),
                                            TextSpan(
                                                text: ' e ',
                                                style: AppThemeUtils.normalSize(
                                                    color: Colors.grey[700],
                                                    fontSize: 18)),
                                            TextSpan(
                                                text: "politica de privacidade",
                                                style: AppThemeUtils.normalSize(
                                                    color: AppThemeUtils
                                                        .colorPrimary,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    fontSize: 18),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {}),
                                          ],
                                        )),
                                  ),
                                  Switch(
                                      value: controller.term,activeColor: AppThemeUtils.colorPrimary,
                                      onChanged: (v) {
                                        controller.changeTerm();
                                      })
                                ],
                              ))),
                  Container(
                      margin: EdgeInsets.only(
                          bottom: 20, top: 10, right: 25, left: 25),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Observer(
                          builder: (context) => controller.isLoadLogin
                              ? loadElements()
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: AppThemeUtils.colorPrimary),
                                  onPressed: () {
                                    if(controller.passController.text != controller.passControllerConfirm.text){
                                      Utils.showSnackBar('Senhas incompativeis', context);
                                    }else{
                                      if(controller.term){
                                        controller.getRegister(context);
                                      }else{
                                        Utils.showSnackBar('Aceite os termos', context);
                                      }

                                    }

                                  },
                                  child: Text(
                                    "Cadastrar",
                                    style: AppThemeUtils.normalBoldSize(
                                        color: AppThemeUtils.whiteColor),
                                  ),
                                ))),
                  Container(
                      margin: EdgeInsets.only(
                          bottom: 0, top: 10, right: 25, left: 25),
                      alignment: Alignment.center,
                      child: Text(
                        "Ja possui uma conta?",
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
                            Modular.to
                                .pushReplacementNamed(ConstantsRoutes.LOGIN);
                          },
                          child: Text(
                            "Entrar",
                            style: AppThemeUtils.normalSize(
                                color: AppThemeUtils.colorPrimary),
                          )))
                ],
              ))))),
    );
  }
}
