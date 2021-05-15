import 'package:mobx/mobx.dart';

part 'my_store_store.g.dart';

class MyStoreStore = _MyStoreStoreBase with _$MyStoreStore;
abstract class _MyStoreStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}