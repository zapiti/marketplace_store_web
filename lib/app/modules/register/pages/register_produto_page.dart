
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/components/load/load_elements.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';

import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

import '../register_store.dart';

class RegisterProdutoPage extends StatefulWidget {
  @override
  _RegisterProdutoPageState createState() => _RegisterProdutoPageState();
}

class _RegisterProdutoPageState   extends ModularState<RegisterProdutoPage, RegisterStore> {
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
                              "Validação",    textAlign: TextAlign.center,
                              style: AppThemeUtils.normalBoldSize(fontSize: 26),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(bottom: 30,right: 20,left: 20),
                              width: 300,
                              child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: "Preencha os dados abaixo para a avaliação:",
                                    style: AppThemeUtils.normalSize(
                                        color:
                                        Theme.of(context).textTheme.bodyText1.color,
                                        fontSize: 20),
                                    children: <TextSpan>[

                                    ],
                                  ))
                          ),
                          Container(
                              height: 50,
                              color: AppThemeUtils.colorGrayBg,
                              margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                              child: Observer(
                                  builder: (context) => TextField(
                                      enabled: !controller.isLoadLogin,
                                      controller: controller.cnpjController,
                                      textAlign: TextAlign.start,
                                      textAlignVertical: TextAlignVertical.top,
                                      decoration: InputDecoration(
                                          labelText: "CNPJ",
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: AppThemeUtils.colorGrayBg, width: 0.0),
                                          ))))),
                          Container(
                              height: 50,
                              color: AppThemeUtils.colorGrayBg,
                              margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                              child: Observer(
                                  builder: (context) => TextField(
                                      enabled: !controller.isLoadLogin,
                                      controller: controller.modelController,
                                      textAlign: TextAlign.start,
                                      textAlignVertical: TextAlignVertical.top,
                                      decoration: InputDecoration(
                                          labelText: "Modelo de negócio",

                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: AppThemeUtils.colorGrayBg, width: 0.0),
                                          ))))),
                          Container(
                              height: 50,
                              color: AppThemeUtils.colorGrayBg,
                              margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                              child: Observer(
                                  builder: (context) => TextField(
                                      enabled: !controller.isLoadLogin,
                                      controller: controller.modelController,
                                      textAlign: TextAlign.start,
                                      textAlignVertical: TextAlignVertical.top,
                                      decoration: InputDecoration(
                                          labelText: "Estado",

                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: AppThemeUtils.colorGrayBg, width: 0.0),
                                          ))))),
                          Container(
                              height: 50,
                              color: AppThemeUtils.colorGrayBg,
                              margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                              child: Observer(
                                  builder: (context) => TextField(
                                      enabled: !controller.isLoadLogin,
                                      controller: controller.cityController,
                                      textAlign: TextAlign.start,
                                      textAlignVertical: TextAlignVertical.top,
                                      decoration: InputDecoration(
                                          labelText: "Cidade",

                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: AppThemeUtils.colorGrayBg, width: 0.0),
                                          ))))),
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
                                      controller.getRegisterProduct(context);
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
                                    Modular.to.pushReplacementNamed(ConstantsRoutes.LOGIN);
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
