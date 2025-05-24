import 'package:new_marketplace_web/app/modules/client/modules/order/model/order.dart';
import 'package:new_marketplace_web/app/modules/store/modules/home/model/order.dart';

class OrderRepository {
  Future<List<Order>> getListOrder() async {
    return [
      Order(id: "1",status: Order.ANDAMENTO),
      Order(id: "2",hasEvaluation: true),
      Order(id: "4",hasEvaluation: false),
      Order(id: "5",hasEvaluation: false),
      Order(id: "6",hasEvaluation: false)
    ];
  }
}
