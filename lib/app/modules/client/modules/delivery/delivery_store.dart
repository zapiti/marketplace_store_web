import 'package:mobx/mobx.dart';

part 'delivery_store.g.dart';

class DeliveryStore = _DeliveryStoreBase with _$DeliveryStore;
abstract class _DeliveryStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}