import 'package:marketplace_store_web/app/modules/client/modules/home/model/shops.dart';
import 'package:marketplace_store_web/app/modules/store/model/product.dart';
import 'package:marketplace_store_web/app/modules/store/modules/home/model/order.dart';

class Order {
  Shops shops = Shops();
  List<Product> products = [Product(), Product(), Product(), Product()];
  String status = "Entregue";
  double value = 50;
  String id;

  Order({id: "1"});
}
