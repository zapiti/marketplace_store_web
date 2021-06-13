import 'package:marketplace_store_web/app/modules/client/modules/order/model/order.dart';

class OrderRepository {
  Future<List<Order>> getListOrder() async {
    return [
      Order(id: "1"),
      Order(id: "2"),
      Order(id: "4"),
      Order(id: "5"),
      Order(id: "6")
    ];
  }
}
