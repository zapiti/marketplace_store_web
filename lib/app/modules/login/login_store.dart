import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/app_store.dart';
import 'package:marketplace_store_web/app/configuration/app_configuration.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final PEDIDO = "PEDIDO";
  final PRODUTO = "PRODUTO";
  final ENTREGADOR = "ENTREGADOR";

  final passController = TextEditingController();
  final userController = TextEditingController();

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

  getLoginClient(BuildContext context) async {
    showLoad();
    final appBloc = Modular.get<AppStore>();

    appBloc.setCurrentUser(AppConfiguration.mockCurrentUserClient);

    await Future.delayed(Duration(seconds: 1));
    hideLoad();
    Modular.to.pushReplacementNamed(ConstantsRoutes.CLIENTROUTE);
  }

  getLoginStore(BuildContext context) async {
    showLoad();
    final appBloc = Modular.get<AppStore>();

    appBloc.setCurrentUser(AppConfiguration.mockCurrentUserEstablishment);

    await Future.delayed(Duration(seconds: 1));
    hideLoad();
    Modular.to.pushReplacementNamed(ConstantsRoutes.STOREROUTE);
  }
}
