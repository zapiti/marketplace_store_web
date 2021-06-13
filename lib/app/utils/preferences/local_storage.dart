import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:marketplace_store_web/app/modules/store/model/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataStore {
  static setData({@required String key, @required String value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(key, value);
  }

  static removeData({@required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static deleteAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  static Future<String> getValue({@required String key}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(key);
    } on Exception catch (_) {
      return null;
    }
  }

  static setListData({String key, List<Map> value}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.setStringList(
          key, value.map<String>((e) => jsonEncode(e)).toList());
    } on Exception catch (_) {
      return null;
    }
  }

  static Future<List<T>> getList<T>(
      {String key, T Function(Map) fromMap}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final listString = prefs.getStringList(key);
      List<T> tempList =
          listString?.map<T>((e) => fromMap(jsonDecode(e)))?.toList() ?? <T>[];

      return tempList ?? <T>[];
    } on Exception catch (_) {
      return <T>[];
    }
  }
}
