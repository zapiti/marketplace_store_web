
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';
import 'models/current_user.dart';
import 'modules/login/repository/auth_repository.dart';

part 'app_store.g.dart';

class AppStore = _AppStoreBase with _$AppStore;

abstract class _AppStoreBase extends Disposable with Store {
  var _authToken = Modular.get<AuthRepository>();
  @observable
  CurrentUser? currentUser;

  @override
  dispose() {
    hide.drain();
    loadElement.drain();
  }

  BehaviorSubject<bool> hide = BehaviorSubject<bool>.seeded(false);

  BehaviorSubject<bool> loadElement = BehaviorSubject<bool>.seeded(false);

  @action
  void setCurrentUser(CurrentUser _currentUser) {
    currentUser = _currentUser;
  }

  @observable
  Future<CurrentUser?> getCurrentUserFutureValue() async {
    var user = currentUser;
    if (user == null) {
      var localUser = await _authToken.getToken();
      if (localUser != null) {
        user = CurrentUser.fromMap(Jwt.parseJwt(localUser));
        currentUser = user;
      }
    }
    return user;
  }

  setHideBar(bool hideBar) {
    hide.sink.add(hideBar);
  }
}