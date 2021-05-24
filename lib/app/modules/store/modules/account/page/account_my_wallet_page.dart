import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:marketplace_store_web/app/components/page/page_web.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';
import 'package:timelines/timelines.dart';

class AccountMyWalletPage extends StatefulWidget {
  @override
  AccountMyWalletPageState createState() => AccountMyWalletPageState();
}

class AccountMyWalletPageState extends State<AccountMyWalletPage> {
  var enableWallet = false;

  @override
  Widget build(BuildContext context) {
    return PageWeb(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.only(top: 30, bottom: 20),
            child: Text(
              "Minha carteira",
              style: AppThemeUtils.normalBoldSize(
                  color: AppThemeUtils.colorPrimary, fontSize: 24),
            )),
        Container(
          child: Stack(
            children: [
              Container(
                  height: 170,
                  width: double.infinity,
                  color: !enableWallet
                      ? AppThemeUtils.darkGrey
                      : AppThemeUtils.successColor,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        child: Text(
                          Utils.moneyMasked( 45),
                          style: AppThemeUtils.normalBoldSize(
                              fontSize: 28, color: AppThemeUtils.whiteColor),
                        ),
                      ),
                      Container(
                        child: Text(
                          "Saldo atual",
                          style: AppThemeUtils.normalSize(
                              fontSize: 18, color: AppThemeUtils.whiteColor),
                        ),
                      )
                    ],
                  )),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  margin: EdgeInsets.only(top: 135, right: 30, left: 30),
                  child: ElevatedButton(
                    child: Text(
                      !enableWallet
                          ? "SAQUE DISPONÍVEL EM 7 DIAS"
                          : "SAQUE DISPONÍVEL",
                      style: AppThemeUtils.normalSize(
                          color: !enableWallet
                              ? AppThemeUtils.darkGrey
                              : AppThemeUtils.successColor),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: AppThemeUtils.whiteColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(12.0),
                            side: BorderSide(
                                color: !enableWallet
                                    ? AppThemeUtils.darkGrey
                                    : AppThemeUtils.successColor))),
                    onPressed: () {
                      setState(() {
                        enableWallet = !enableWallet;
                      });
                    },
                  )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.centerRight,
                child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: AppThemeUtils.whiteColor,
                    ),
                    onPressed: () {
                      Modular.to.pushNamed(ConstantsRoutes.CALL_ALTERWALLET);
                    }),
              )
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Text(
              "Últimas transações",
              style: AppThemeUtils.normalBoldSize(fontSize: 18),
            )),
        Container(
            margin: EdgeInsets.only(left: 35, right: 20, top: 10),
            child: FixedTimeline.tileBuilder(
              mainAxisSize: MainAxisSize.min,
              theme: TimelineThemeData(
                nodePosition: 0,
                color: AppThemeUtils.colorPrimary,
                connectorTheme: ConnectorThemeData(
                  thickness: 3.0,
                  color: AppThemeUtils.colorPrimary,
                ),
                indicatorTheme: IndicatorThemeData(
                  size: 15.0,
                ),
              ),
              verticalDirection: VerticalDirection.up,
              builder: TimelineTileBuilder.connectedFromStyle(
                contentsAlign: ContentsAlign.basic,
                connectionDirection: ConnectionDirection.before,
                contentsBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "Saque realizado",
                          style: AppThemeUtils.normalBoldSize(),
                        ),
                      ),
                      Container(
                        child: Text(
                          Utils.moneyMasked( 45),
                          style: AppThemeUtils.normalSize(),
                        ),
                      )
                    ],
                  ),
                ),
                connectorStyleBuilder: (context, index) =>
                    ConnectorStyle.solidLine,
                indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
                itemCount: 10,
              ),
            ))
      ],
    ));
  }
}
