import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_web/app/modules/login/login_store.dart';
import 'package:new_marketplace_web/app/routes/constants_routes.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';

class LoginProdutoPage extends StatefulWidget {
  @override
  _LoginProdutoPageState createState() => _LoginProdutoPageState();
}

class _LoginProdutoPageState
    extends ModularState<LoginProdutoPage, LoginStore> {
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: RichText(
                      text: TextSpan(
                        text: "Digite seus ",
                        style: AppThemeUtils.normalSize(fontSize: 20),
                        children: [
                          TextSpan(
                            text: "dados",
                            style: AppThemeUtils.normalBoldSize(fontSize: 20),
                          ),
                          TextSpan(
                            text: " para entrar:",
                            style: AppThemeUtils.normalSize(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    color: AppThemeUtils.colorGrayBg,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Observer(
                      builder: (context) => TextField(
                        enabled: !controller.isLoadLogin,
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration(
                          labelText: "E-mail",
                          prefixIcon: Icon(
                            Icons.email,
                            color: AppThemeUtils.colorPrimary,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppThemeUtils.colorGrayBg,
                              width: 0.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
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
                              color: AppThemeUtils.colorGrayBg,
                              width: 0.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      top: 10,
                      right: 25,
                      left: 25,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Observer(
                      builder: (context) => controller.isLoadLogin
                          ? CircularProgressIndicator()
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppThemeUtils.colorPrimary,
                              ),
                              onPressed: () {
                                controller.login();
                              },
                              child: Text(
                                "Entrar",
                                style: AppThemeUtils.normalBoldSize(
                                  color: AppThemeUtils.whiteColor,
                                ),
                              ),
                            ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      top: 0,
                      right: 25,
                      left: 25,
                    ),
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Modular.to.pushReplacementNamed(
                          ConstantsRoutes.REGISTER,
                        );
                      },
                      child: Text(
                        "Não tem uma conta? Cadastre-se",
                        style: AppThemeUtils.normalSize(
                          color: AppThemeUtils.colorPrimary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
