


import 'package:marketplace_store_web/app/modules/client/modules/home/model/shops.dart';
import 'package:marketplace_store_web/app/modules/store/model/product.dart';

class Order {
  Shops shops = Shops();
  List<Product> products = [Product(),Product(),Product(),Product()];
  String status = "Entregue";
  double value = 50;
}