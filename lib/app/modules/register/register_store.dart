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
  @observable
  bool isLoadLogin = false;

  @observable
  String actualPage;

  @action
  void selectPage(String page) {
    actualPage = page;
  }



  @action
  void getRegister(BuildContext context) {

  }
}
