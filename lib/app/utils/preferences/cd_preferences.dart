
import 'package:flutter_modular/flutter_modular.dart';
import 'local_storage.dart';

var codePreferences = _CdPreferences();

class _CdPreferences {
  var localDataStore = Modular.get<LocalDataStore>();
  static const _prefix = "TREBESH_";
  _CdPreferences();

  Future<void> clear() async {
   return localDataStore.deleteAll();
  }

  set({String key, dynamic value}) async {
    localDataStore.setData(key:  _prefix + key, value: value);
  }
  remove({String key, dynamic value}) async {
    localDataStore.removeData(key:  _prefix + key);
  }
  Future<String> getString({String key, String ifNotExists}) async {
    String value = ifNotExists;

    value = await localDataStore.getData(key: _prefix + key);
    return value ?? ifNotExists;
  }
  Future get({String key}) async {


    final value = await localDataStore.getData(key: _prefix + key);
    return value ;
  }

  Future<bool> getBoolean({String key, bool ifNotExists}) async {
    bool value = ifNotExists;
    value = await localDataStore.getData(key: _prefix + key);
    return value ?? ifNotExists;
  }

  String getValue({String key}) {
    return localDataStore.getValue(key: _prefix + key);
  }
}
