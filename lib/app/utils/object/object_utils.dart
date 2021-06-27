import 'dart:convert';

import 'package:flutter/material.dart';


import '../../models/page/response_paginated.dart';

class ObjectUtils {
  static String parseToString(data, [String defaultValue = '']) {
    if (data == null) return defaultValue;
    try {
      return data.toString();
    } on Exception catch (exe) {
      debugPrint("Parse error(ToString) $exe $data");
      return defaultValue;
    }
  }

  static int parseToInt(dynamic data, {dynamic defaultValue = 0}) {
    if (data == null) return defaultValue;
    try {
      return int.tryParse(data?.toString() ?? "0") ?? 0;
    } on Exception catch (exe) {
      debugPrint("Parse error(toInt) $exe $data");
      return 0;
    }
  }

  static double parseToDouble(data, {dynamic defaultValue = 0.0}) {
    if (data == null) return defaultValue;
    try {
      if (data is double) {
        return data;
      } else {
        return double.tryParse(data) ?? 0.0;
      }
    } on Exception catch (exe) {
      debugPrint("Parse error(toDouble) $exe $data");
      return defaultValue;
    }
  }

  static List<T> parseToObjectList<T>(dynamic object,
      {dynamic defaultValue, dynamic type, bool isContent = false}) {
    if (object == null) {
      return <T>[];
    }
    try {
      if (isContent) {
        // if(object IS.toString().contains("content")){
        //   if (object["content"] != null) {
        //     if (object["content"] is List) {
        //       return object["content"].cast<T>().toList();
        //     } else {
        //       return [object["content"]].cast<T>().toList();
        //     }
        //   }
        // }else{

          return object.map((e)=>e).toList();
      //  }

      }
      return object.cast<T>().toList();
    } on Exception catch (exe) {
      return object.cast<T>().toList();
    } catch (error) {
      debugPrint("Parse error(toList)  $error ");
      return defaultValue;
    }
  }

  static bool isEmpty(data) {
    if (data == null) {
      return true;
    } else if (data is ResponsePaginated) {
      if (data.content == null) {
        return true;
      }
      if (data.content is List) {
        return data.content.isEmpty;
      } else {
        return false;
      }
    }

    return data.toString().isEmpty;
  }

  static Object isNumeric(value) {
    if (value == null || value is List) {
      return false;
    }
    return double.tryParse(value) != null || int.tryParse(value) != null;
  }

  static dynamic parseToMap(result, {dynamic defaultValue = "{}"}) {
    if (result is Map) {
      return result;
    } else {
      if (result == null) {
        return defaultValue;
      }
      try {
        var jsons = json.decode(result.toString());
        return jsons;
      } catch (e) {
        return defaultValue;
      }

      return defaultValue;
    }
  }

  static dynamic getElementByArray(List? list, {String? nameField, String? idField}) {
    var valueResult = list?.firstWhere((
        element) => element[nameField.toString()]?.toString() == idField,orElse: () => null);
    if(valueResult != null){
      valueResult = valueResult['termValue'];
    }
    return valueResult;
  }


  static bool parseToBool(dynamic string) {
    return string.toString().toLowerCase() == 'true';
  }


}

Iterable<E> enumerate<E, T>(
    Iterable<T> items, E Function(int index, T item) f) {
  var index = 0;
  return items.map((item) {
    final result = f(index, item);
    index = index + 1;
    return result;
  });
}
