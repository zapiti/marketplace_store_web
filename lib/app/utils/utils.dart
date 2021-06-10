import 'package:another_flushbar/flushbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:marketplace_store_web/app/models/pairs.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

class Utils {
  static showSnackBar(String message, BuildContext context,
      {SnackBarAction action,
      int duration = 4,
      IconData icon = Icons.info_outline}) {
    Flushbar(
      flushbarStyle: FlushbarStyle.GROUNDED,
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: AppThemeUtils.colorPrimary,
      message: message ?? "",
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

  static String moneyMasked(double fold) {
    return MoneyMaskedTextController(initialValue: fold ?? 0, leftSymbol: "R\$")
        .text;
  }

  static Future<Pairs<Address,Position>> getLocation() async {

    try {
      debugPrint("Entro ======");

      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error(
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
    }catch(e){
      return Pairs(null, null);
    }
  }


}
