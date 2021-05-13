
import 'package:flutter_modular/flutter_modular.dart';

import 'package:marketplace_store_web/app/models/page/response_paginated.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';
import 'package:mobx/mobx.dart';

import 'models/local_user.dart';


part 'app_store.g.dart';

class AppStore = _AppStoreBase with _$AppStore;

abstract class _AppStoreBase with Store {
  @observable
  LocalUser currentUser;

  @observable
  DateTime dateSelected;
  @action
  Future<ResponsePaginated> setCurrentUser(LocalUser _currentUser) async {

    return null;
  }

  @action
  setSelectedDate(DateTime dateTime) {
    dateSelected = dateTime;
  }

  @action
  Future<LocalUser> getCurrentUserFutureValue() async {

    return null;
  }



  @action
  getLogout() async {
    currentUser = null;
    Modular.to.pushReplacementNamed(ConstantsRoutes.LOGIN);
  }
}
