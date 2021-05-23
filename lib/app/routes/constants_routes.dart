import 'package:flutter/material.dart';

class ConstantsRoutes {
  //static const String INICIO = '/inicio';
  static const String LOGIN = '/login';
  static const String SEARCH = '/search';

  //region <!Loja!>
  static const String STOREROUTE = '/loja';

  static const String HOME_STORE_PAGE = '/home';
  static const String CALL_STORE_HOMEPAGE = STOREROUTE + HOME_STORE_PAGE;

  static const String MY_STORE_PAGE = '/minha_loja';
  static const String CALL_MY_STORE = STOREROUTE + MY_STORE_PAGE;

  static const String ALTER_STORE_PAGE = '/alterar_loja';
  static const String CALL_ALTER_STORE_PAGE = STOREROUTE + ALTER_STORE_PAGE;

  static const String ALTER_PRODUCT_STORE_PAGE = "/alterar_produto";
  static const String CALL_ALTER_PRODUCT_STORE_PAGE =
      STOREROUTE + ALTER_PRODUCT_STORE_PAGE;

  static const String ACCOUNTSTOREPAGE = '/conta';
  static const String CALL_ACCOUNT_STORE_PAGE = STOREROUTE + ACCOUNTSTOREPAGE;

  static const String LOGINPAGE = '/loginPage';
  static const String CALL_LOGINPAGE = LOGIN + LOGINPAGE;

  static const String RECOVERYPAGE = '/recoveryPage';
  static const String CALL_RECOVERYPAGE = LOGIN + RECOVERYPAGE;

  static const String REGISTERPAGE = '/registerPage';
  static const String CALL_REGISTERPAGE = LOGIN + REGISTERPAGE;

  static const String DETAILOBJECT = '/detailObjectivePage';
  static const String CALL_DETAIL_OBJECTIVE =
      CALL_STORE_HOMEPAGE + DETAILOBJECT;

  static const String ALTERPASSSTORE = '/alterar_senha';
  static const String CALL_STORE_ALTERPASS = STOREROUTE + ALTERPASSSTORE;

  static const String WALLET = '/carteira';
  static const String CALL_WALLET = STOREROUTE + WALLET;

  static const String ALTERWALLET = '/alterar_carteira';
  static const String CALL_ALTERWALLET = STOREROUTE + ALTERWALLET;

  static const String HELPSTORE = '/ajuda';
  static const String CALL_STORE_HELP = STOREROUTE + HELPSTORE;

  //endregion

  //region <!Cliente!>
  static const String CLIENTROUTE = '/cliente';

  static const String HOME_CLIENT_PAGE = '/home';
  static const String CALL_CLIENT_HOMEPAGE = CLIENTROUTE + HOME_CLIENT_PAGE;

  // static const String HOME_INITIAL_CLIENT_PAGE  = '/inicio';
  // static const String CALL_INITIAL_CLIENT_HOMEPAGE = CLIENTROUTE + HOME_INITIAL_CLIENT_PAGE;


  static const String HOME_SHOP_CLIENT_PAGE  = '/detalhe_loja/';
  static const String CALL_HOME_SHOP_CLIENT_PAGE = CLIENTROUTE + HOME_SHOP_CLIENT_PAGE;

  static const String ALTERPASSCLIENT = '/alterar_senha';
  static const String CALL_CLIENT_ALTERPASS = CLIENTROUTE + ALTERPASSCLIENT;

  static const String HELPCLIENT= '/ajuda';
  static const String CALL_CLIENT_HELP = CLIENTROUTE + HELPCLIENT;

  static const String ACCOUNTCLIENTPAGE = '/conta';
  static const String CALL_ACCOUNT_CLIENT_PAGE = CLIENTROUTE + ACCOUNTCLIENTPAGE;





  //endregion

  static String getNameByRoute(String route) {
    switch ("/${route.replaceAll("/", "")}") {
      //endregion
      default:
        return "Início";
        break;
    }
  }
}
