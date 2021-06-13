import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/modules/client/modules/order/components/show_details_order_widget.dart';
import 'package:marketplace_store_web/app/modules/client/modules/order/repository/order_repository.dart';
import 'package:mobx/mobx.dart';
import 'components/show_chat_order_widget.dart';
import 'model/order.dart';

part 'order_store.g.dart';

class OrderStore = _OrderStoreBase with _$OrderStore;

abstract class _OrderStoreBase with Store {
  @observable
  List<Order> listOrder;

  @observable
  Order currentOrder;

  final _repository = Modular.get<OrderRepository>();

  @action
  getListOrder() async {
    listOrder = await _repository.getListOrder();
  }

  @action
  void setCurrentOrder(Order order) {
    currentOrder = order;
  }

  showDetailsOrder(BuildContext context, Order order){
    showDetailsOrderWidget(context, order);
  }

  showChatOrder(BuildContext context, Order order){
    showChatOrderWidget(context, order);
  }
}
