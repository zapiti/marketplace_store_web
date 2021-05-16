

import 'package:marketplace_store_web/app/modules/store/model/product.dart';

class Order {

  static const PEDENTE = "PENDENTE";
  static const ANDAMENTO = "ANDAMENTO";
  static const CONCLUIDO = "CONCLUIDO";

  DateTime dtCreate = DateTime.now().add(Duration(minutes: -20));

  int numPedido = 80045;
  String status;

  List<Product> products = [ Product(),Product(),Product()];

  double value = 500.0;

  Order({this.status = CONCLUIDO})  ;

}