import 'package:localstorage/localstorage.dart';

final LocalStorage storage = LocalStorage('maketplce_score_code_app');

class LocalDataStore {
  static setData({String key, String value}) {
    storage.ready.then((_) => _printStorage(key));
    storage.setItem(key, value);
  }

  static setListData({String key, List<Map> value}) {
    storage.ready.then((_) => _printStorage(key));
    storage.setItem(key, value);
  }

  static removeData({String key}) {
    storage.ready.then((_) => _printStorage(key));
    storage.deleteItem(key);
  }

  static dynamic getData({String key}) {
    try {
      storage.ready.then((_) => _printStorage(key));
      return storage.getItem(key);
    } on Exception catch (_) {
      return null;
    }
  }

  static deleteAll() async{
    await storage.ready;

    return storage.clear();
  }

  static dynamic getValue({String key}) {
    try {

      storage.ready.then((_) => _printStorage(key));
      return storage.getItem(key);
    } on Exception catch (_) {
      return null;
    }
  }

  static Future<void> _printStorage(String key) async {
    try {
      //   print("before ready: " + storage.getItem(key).toString());

      //wait until ready
      await storage.ready;
    } on Exception catch (_) {}
    //this will still print null:
  }

  static List<T> getList<T>({String key, T Function(Map) fromMap}) {
    List<T> tempList = ((getValue(key: key) ?? []))?.map<T>((e) => fromMap(e))
        ?.toList() ?? <T>[];

    return tempList ?? <T>[];
  }
}
