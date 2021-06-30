

import 'package:marketplace_store_web/app/modules/client/modules/home/model/shops.dart';
import 'package:marketplace_store_web/app/modules/store/model/product.dart';

class Order {

  static const PEDENTE = "PENDENTE";
  static const ANDAMENTO = "ANDAMENTO";
  static const CONCLUIDO = "CONCLUIDO";

  DateTime dtCreate = DateTime.now().add(Duration(minutes: -20));

  int numPedido = 80045;
  String status;

  List<Product?> products = [ Product(),Product(),Product()];

  double value = 500.0;
  String id;

  String? deliveryTime = '30-40 min';

  Order({this.status = CONCLUIDO, this. id = '1'})  ;

  Shops shops =  Shops();

  factory Order.fromMap(dynamic map) {

    return Order(
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dtCreate': dtCreate.toString(),
      'numPedido': numPedido,
      'status': status,
      'products': products.map((map) => map?.toMap()).toList() ,
      'value': value,
      'id': id,
      'shops': shops.toMap(),
    };
  }
}