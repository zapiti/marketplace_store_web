import 'package:mobx/mobx.dart';

part 'client_store.g.dart';

class ClientStore = _ClientStoreBase with _$ClientStore;
abstract class _ClientStoreBase with Store {

  @observable
  int currentIndex = 0;

  @action
  addCurrentIndex(int index)  {
    currentIndex = index;
  }
}