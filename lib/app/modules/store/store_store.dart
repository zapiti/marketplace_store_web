import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_web/app/models/current_user.dart';
import 'package:new_marketplace_web/app/modules/store/repository/store_repository.dart';
import 'package:new_marketplace_web/app/utils/utils.dart';
import 'package:mobx/mobx.dart';

part 'store_store.g.dart';

class StoreStore = _StoreStoreBase with _$StoreStore;

abstract class _StoreStoreBase with Store {
  final _repositoryStory = Modular.get<StoreRepository>();
  @observable
  int currentIndex = 0;

  @observable
  Establishment? establishment;

  @action
  updateEstablishmentLocal(Establishment _establishment) {
    establishment = _establishment;
  }

  @action
  getCurrentEstablishment() async {
    establishment = await _repositoryStory.getCurrentEstablishment();
    print(establishment?.companyName);
  }

  @action
  updateEstablishment(BuildContext context, Establishment _establishment,
      {bool onlyStab = false}) async {
    var response = await _repositoryStory.updateEstablishment(_establishment);
    if (!onlyStab) {
      response = await _repositoryStory.updateOpeningHours(_establishment);
    }

    if (response.error != null) {
      Utils.showSnackBar(response.error, context);
    } else {
      establishment = _establishment;
      Utils.showSnackBar('salvo com sucesso', context);
    }
  }

  @action
  addCurrentIndex(int index) {
    currentIndex = index;
  }
}
