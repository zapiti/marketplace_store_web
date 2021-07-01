


import 'package:marketplace_store_web/app/models/current_user.dart';

class AppConfiguration {
  static const CORE = "KEEPUP";
  static final PRODUCTION_SERVER = "PRODUCTION_SERVER";
  static final SOCKET_ATTENDANCE_PORT = "SOCKET_ATTENDANCE_PORT";
  static final pushApi = "e0c60413-361f-4f24-aa2e-eb01ad67c193";

  static String baseUrl()  {
    return "";
  }
  static final mockCurrentUserEstablishment = CurrentUser(establishment: Establishment());
  static final mockCurrentUserClient = CurrentUser(client: Client());
  static final isMockDevTest = false;
}
