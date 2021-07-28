import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/modules/store/modules/home/model/order.dart';
import 'package:marketplace_store_web/app/modules/store/modules/home/repository/home_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final ANTERIOR = "ANTERIOR";
  final ANDAMENTO = "ANDAMENTO";

  final passController = TextEditingController();
  final userController = TextEditingController();
  final _repository = Modular.get<HomeRepository>();
  final walletMoney = 0.0;

  @observable
  List<Order>? orders;

  @observable
  String? actualPage;



  @action
  void selectPage(String page) {
    actualPage = page;
    if (page == ANDAMENTO) {
      _getPendingOrders();
    } else {
      _getListOrderHistory();
    }
  }




  void _getPendingOrders() {
    orders = null;
    _repository.getListOrderPending().then((value) {
      orders = value;
    });
  }


  void _getListOrderHistory() {
    orders = null;
    _repository.getListOrderHistory().then((value) {
      orders = value;
    });
  }
}
