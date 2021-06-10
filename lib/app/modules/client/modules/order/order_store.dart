import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/modules/client/modules/order/repository/order_repository.dart';
import 'package:mobx/mobx.dart';
import 'model/order.dart';

part 'order_store.g.dart';

class OrderStore = _OrderStoreBase with _$OrderStore;
abstract class _OrderStoreBase with Store {

  @observable
  List<Order> listOrder;

  final _repository = Modular.get<OrderRepository>();

  @action
  getListOrder() async {
    listOrder = await _repository.getListOrder();
  }

  @action
  void setCurrentOrder( Order order) {

  } 
}