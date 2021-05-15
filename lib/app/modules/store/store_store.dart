import 'package:mobx/mobx.dart';

part 'store_store.g.dart';

class StoreStore = _StoreStoreBase with _$StoreStore;
abstract class _StoreStoreBase with Store {

  @observable
  int currentIndex = 0;

  @action
  addCurrentIndex(int index)  {
    currentIndex = index;
  }
}