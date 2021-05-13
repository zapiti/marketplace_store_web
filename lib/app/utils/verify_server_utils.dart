import 'dart:io';

import 'package:flutter/material.dart';

class VerifyServerUtils {
  Future<bool> verifyServer(String url) async {
    try {
      final result = await InternetAddress.lookup(url);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        debugPrint('connected');
        return true;
      }
    } on SocketException catch (_) {
      debugPrint('not connected');
      return false;
    }
  }
}
