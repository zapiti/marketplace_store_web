

import 'dart:convert';

class EncodedUtils {
  static String encodedData(Map data) {
    return jsonEncode(data);
  }

  static Map dencodedData(String data) {
    Map userMap = jsonDecode(data);

    return userMap;
  }
}
