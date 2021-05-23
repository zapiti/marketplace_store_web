import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  final PEDIDO = "PEDIDO";
  final PRODUTO = "PRODUTO";
  final ENTREGADOR = "ENTREGADOR";

  final modelController = TextEditingController();
  final cnpjController = TextEditingController();
  final cityController = TextEditingController();
  final passControllerConfirm = TextEditingController();
  final passController = TextEditingController();
  final nameUserController = TextEditingController();
  final emailController = TextEditingController();

  @observable
  bool isLoadLogin = false;

  @observable
  bool showHidePassConfirm = false;

  @observable
  bool showHidePass = false;

  @observable
  bool term = false;

  @observable
  String actualPage;

  @action
  changeTerm() {
    term = !term;
  }

  @action
  void showHideConfirmIcon() {
    showHidePassConfirm = !showHidePassConfirm;
  }

  @action
  void showHideIcon() {
    showHidePass = !showHidePass;
  }

  @action
  void selectPage(String page) {
    actualPage = page;
  }

  @action
  void getRegister(BuildContext context) {}

  @action
  getRegisterProduct(BuildContext context) {}
}
