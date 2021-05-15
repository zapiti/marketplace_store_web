


import 'package:marketplace_store_web/app/models/page/response_paginated.dart';
import 'package:marketplace_store_web/app/modules/store/modules/home/model/order.dart';

class HomeRepository {


 Future<List<Order>> getListOrderPending() async{

  await Future.delayed(Duration(seconds: 1),(){});
   return [Order(status: Order.PEDENTE),Order(status: Order.ANDAMENTO)];
  }

 Future<List<Order>> getListOrderHistory() async{
   await Future.delayed(Duration(seconds: 1),(){});
   return [Order(),Order(),Order(),Order(),Order(),Order(),Order(),Order()];
 }
}