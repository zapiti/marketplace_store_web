import 'package:mobx/mobx.dart';

part 'landing_store.g.dart';

class LandingStore = _LandingStoreBase with _$LandingStore;
abstract class _LandingStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}