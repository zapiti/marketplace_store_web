



import 'package:marketplace_store_web/app/models/pairs.dart';

import 'object_utils.dart';





class MapUtils {
  static List<Pairs> convertObjectToListPairs(Map<String, dynamic> decoded) {
    List<Pairs> listPairs = [];
    for (var colour in decoded.keys) {
      listPairs.add(Pairs(colour.toString(), decoded[colour]));
    }
//
//    decoded.keys.map(
//        (colour) => listPairs.add(Pairs(colour.toString(), decoded[colour])));
    return listPairs;
  }

  static Map convertListPairsToObject(List<Pairs> listPairs) {
    var tempObject = {};
    (listPairs).forEach((e) {
      tempObject.addAll(e.toSimpleMap(e.first));
    });

    listPairs.map((e) => tempObject.addAll(e.toSimpleMap(e.first)));
    return tempObject;
  }

  static List<Map<String, dynamic>> convertArrayToListMap(content) {
    if (content == null) {
      return [];
    }
    if (content.isEmpty) {
      return [];
    }
    var listTemp = ObjectUtils.parseToObjectList<Map<String, dynamic>>(content);

    return listTemp;
  }
}
