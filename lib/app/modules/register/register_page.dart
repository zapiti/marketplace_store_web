import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_web/app/modules/register/register_store.dart';
import 'package:new_marketplace_web/app/routes/constants_routes.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';
import 'package:responsive_framework/responsive_framework.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends ModularState<RegisterPage, RegisterStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                          text: "Escolha o tipo de ",
                          style: AppThemeUtils.normalSize(fontSize: 20),
                          children: [
                            TextSpan(
                              text: "cadastro",
                              style: AppThemeUtils.normalBoldSize(fontSize: 20),
                            ),
                            TextSpan(
                              text: ":",
                              style: AppThemeUtils.normalSize(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppThemeUtils.colorPrimary,
                            ),
                            onPressed: () {
                              controller.selectPage(controller.PEDIDO);
                              Modular.to.pushReplacementNamed(
                                ConstantsRoutes.REGISTER,
                              );
                            },
                            child: Text(
                              "Cliente",
                              style: AppThemeUtils.normalBoldSize(
                                color: AppThemeUtils.whiteColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppThemeUtils.colorPrimary,
                            ),
                            onPressed: () {
                              controller.selectPage(controller.PRODUTO);
                              Modular.to.pushReplacementNamed(
                                ConstantsRoutes.REGISTER,
                              );
                            },
                            child: Text(
                              "Loja",
                              style: AppThemeUtils.normalBoldSize(
                                color: AppThemeUtils.whiteColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppThemeUtils.colorPrimary,
                            ),
                            onPressed: () {
                              controller.selectPage(controller.ENTREGADOR);
                              Modular.to.pushReplacementNamed(
                                ConstantsRoutes.REGISTER,
                              );
                            },
                            child: Text(
                              "Entregador",
                              style: AppThemeUtils.normalBoldSize(
                                color: AppThemeUtils.whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
