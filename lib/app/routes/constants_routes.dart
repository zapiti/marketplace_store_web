import 'package:flutter/material.dart';

class ConstantsRoutes {
  //static const String INICIO = '/inicio';
  static const String LOGIN = '/login';
  static const String SEARCH = '/search';
  static const String STOREROUTE = '/loja';

  static const String HOMEPAGE = '/home';
  static const String CALL_HOMEPAGE = STOREROUTE+HOMEPAGE;

  static const String MY_STORE_PAGE = '/minha_loja';
  static const String CALL_MY_STORE = STOREROUTE+MY_STORE_PAGE;

  static const String ACCOUNTPAGE = '/conta';
  static const String CALL_ACCOUNTPAGE = STOREROUTE+ACCOUNTPAGE;


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
