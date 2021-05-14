import 'package:flutter/material.dart';
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
  String actualPage;


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

  getLogin(BuildContext context){

  }
}