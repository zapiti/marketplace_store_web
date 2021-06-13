import 'package:marketplace_store_web/app/modules/client/modules/order/order_page.dart';
import 'package:marketplace_store_web/app/modules/client/modules/order/order_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/modules/client/modules/order/repository/order_repository.dart';
import 'components/chat/bloc/chat_attendance_bloc.dart';

class OrderModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => OrderStore()),
    Bind.lazySingleton((i) => OrderRepository()),
    Bind.lazySingleton((i) => ChatAttendanceBloc()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => OrderPage()),
  ];
}
