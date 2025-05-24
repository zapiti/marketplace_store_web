import 'package:flutter/material.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';
import 'package:mobx/mobx.dart';

import 'model/bag.dart';

part 'bag_store.g.dart';

class BagStore = _BagStoreBase with _$BagStore;

abstract class _BagStoreBase with Store {
  @observable
  int _processIndex = 0;

  @computed
  int get processIndex => (_processIndex) % finishProgress.length;

  @observable
  var actualPageBag = Bag.BAGFINISH;

  @action
  void goNextProgress(int? index) {
    if(index == null){
      _processIndex++;
    }else{
      _processIndex = index;
    }

  }

  Color getColor(int index) {
    if (index == processIndex) {
      return AppThemeUtils.inProgressColor;
    } else if (index < processIndex) {
      return AppThemeUtils.completeColor;
    } else {
      return AppThemeUtils.todoColor;
    }
  }


}

final finishProgress = [
  'Iniciar pedido',
  'Completar endereço',
  'Método de pagamento',
  'Gorjeta',
];
