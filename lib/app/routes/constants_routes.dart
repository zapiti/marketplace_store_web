import 'package:flutter/material.dart';

class ConstantsRoutes {
  //static const String INICIO = '/inicio';
  static const String LOGIN = '/login';
  static const String SEARCH = '/search';
  static const String HOME = '/home';

  static const String OBJECTIVESPAGE = '/objectivespage';
  static const String CALL_HOMEPAGE = HOME+OBJECTIVESPAGE;

  static const String HISTORYPAGE = '/historypage';
  static const String CALL_HISTORYPAGE = HOME+HISTORYPAGE;

  static const String ACCOUNTPAGE = '/accountpage';
  static const String CALL_ACCOUNTPAGE = HOME+ACCOUNTPAGE;

  static const String CONFIGURATIONPAGE = '/configurationpage';
  static const String CALL_CONFIGURATIONPAGE = HOME+CONFIGURATIONPAGE;
  

  static const String LOGINPAGE = '/loginPage';
  static const String CALL_LOGINPAGE  = LOGIN+LOGINPAGE ;

  static const String RECOVERYPAGE = '/recoveryPage';
  static const String CALL_RECOVERYPAGE = LOGIN+RECOVERYPAGE;

  static const String REGISTERPAGE = '/registerPage';
  static const String CALL_REGISTERPAGE = LOGIN+REGISTERPAGE;

  static const String DETAILOBJECT = '/detailObjectivePage';
  static const String CALL_DETAIL_OBJECTIVE = CALL_HOMEPAGE+DETAILOBJECT;

  static String getNameByRoute(String route) {
    switch ("/${route.replaceAll("/", "")}") {


      //endregion
      default:
        return "Início";
        break;
    }
  }


}
