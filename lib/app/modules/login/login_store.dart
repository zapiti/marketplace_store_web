import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_web/app/app_store.dart';
import 'package:new_marketplace_web/app/configuration/app_configuration.dart';
import 'package:new_marketplace_web/app/modules/login/repository/auth_repository.dart';
import 'package:new_marketplace_web/app/routes/constants_routes.dart';
import 'package:new_marketplace_web/app/utils/utils.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final PEDIDO = "PEDIDO";
  final PRODUTO = "PRODUTO";
  final ENTREGADOR = "ENTREGADOR";

  final userController = TextEditingController();
  final passController = TextEditingController();
  final authRepository = Modular.get<AuthRepository>();

  @observable
  bool showHidePass = true;

  @observable
  bool isLoadLogin = false;

  @observable
  String? actualPage;

  @action
  void showHideIcon() {
    showHidePass = !showHidePass;
  }

  @action
  void showLoad() {
    isLoadLogin = true;
  }

  @action
  void hideLoad() {
    isLoadLogin = false;
  }

  @action
  void selectPage(String page) {
    actualPage = page;
  }

  @action
  Future<void> login() async {
    isLoadLogin = true;
    try {
      // TODO: Implement login logic
      await Future.delayed(Duration(seconds: 2));
    } catch (e) {
      print(e);
    } finally {
      isLoadLogin = false;
    }
  }

  getLoginClient(BuildContext context) async {
    showLoad();
    final resultLogin = await authRepository.getLogin(
      username: userController.text,
      password: passController.text,
      isClient: true,
    );
    hideLoad();
    if (resultLogin.error == null) {
      await Future.delayed(Duration(seconds: 1));
      Modular.to.pushReplacementNamed(ConstantsRoutes.CLIENTROUTE);
    } else {
      Utils.showSnackBar(resultLogin.error, context);
    }
  }

  getLoginStore(BuildContext context) async {
    showLoad();
    final resultLogin = await authRepository.getLogin(
      username: userController.text,
      password: passController.text,
      isClient: false,
    );
    hideLoad();
    if (resultLogin.error == null) {
      await Future.delayed(Duration(seconds: 1));
      Modular.to.pushReplacementNamed(ConstantsRoutes.STOREROUTE);
    } else {
      Utils.showSnackBar(resultLogin.error, context);
    }
  }

  @override
  void dispose() {
    userController.dispose();
    passController.dispose();
  }
}
