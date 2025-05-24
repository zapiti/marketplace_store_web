import 'package:another_flushbar/flushbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:new_marketplace_web/app/models/current_user.dart';
import 'package:new_marketplace_web/app/models/pairs.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';

import 'data_mock.dart';

class Utils {
  static showSnackBar(String message, BuildContext context,
      {SnackBarAction? action,
      int duration = 4,
      IconData icon = Icons.info_outline}) {
    Flushbar(
      flushbarStyle: FlushbarStyle.GROUNDED,
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: AppThemeUtils.colorPrimary,
      message: message,
      icon: Icon(
        icon,
        size: 28.0,
        color: AppThemeUtils.whiteColor,
      ),
      duration: Duration(seconds: duration),
    )..show(context);
  }

  static void hideKeyBoard(BuildContext context) {
    Future.delayed(Duration(milliseconds: 200), () {
      FocusScope.of(context).requestFocus(FocusNode());
    });
  }

  static isSmalSize(BoxConstraints constraints) {
    return constraints.maxWidth >= 800;
  }

  static String moneyMasked(double? fold) {
    return MoneyMaskedTextController(initialValue: fold ?? 0, leftSymbol: "R\$ ")
        .text;
  }

  static Future<Pairs<Address, Position>?> getLocation() async {
    try {
      debugPrint("Entro ======");

      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        debugPrint('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          debugPrint('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        debugPrint(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      debugPrint("Geo ======");
      final geoLocation = await Geolocator.getCurrentPosition();
      GeoCode geoCode = GeoCode();
      var address;
      try {
        address = await geoCode.reverseGeocoding(
            latitude: geoLocation.latitude, longitude: geoLocation.longitude);

        debugPrint("Endereço: ${address.city}");
      } catch (e) {
        debugPrint("CATCH ======");
        debugPrint(e.toString());
        debugPrint("CATCH ======");
      }
      debugPrint("Response ======");
      debugPrint(geoLocation.latitude.toString());
      debugPrint(geoLocation.longitude.toString());

      return Pairs(address, geoLocation);
    } catch (e) {
      return null;
    }
  }

  static double smallSize() {
    return 800;
  }

  static String getOperationHours(List<OperationHours>? operationHours) {
    final tempList =
        (operationHours ?? []).where((element) => element.isClosed == false);
    if (tempList.isEmpty) {
      return 'Sem horario cadastrado';
    } else {
      return tempList.map((e) => "${e.day} (${e.start}-${e.end})").join('\n');
    }
  }

  static isBase64(String userImage) {
    final RegExp _base64 = RegExp(
        r'^(?:[A-Za-z0-9+\/]{4})*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=|[A-Za-z0-9+\/]{4})$');
    return _base64.hasMatch(userImage);
  }

  static List<Pairs> getHours() {
    return DataMock.listHours;
  }
}
