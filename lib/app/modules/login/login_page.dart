import 'package:flutter/material.dart';
import 'package:new_marketplace_web/app/modules/login/widget/options_login.dart';
import 'package:new_marketplace_web/app/modules/login/widget/options_login_page.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';
import 'package:new_marketplace_web/app/utils/utils.dart';
import 'package:responsive_framework/responsive_framework.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = new ScrollController();
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: ResponsiveRowColumn(
          rowMainAxisAlignment: MainAxisAlignment.center,
          rowCrossAxisAlignment: CrossAxisAlignment.center,
          layout: ResponsiveBreakpoints.of(context).largerThan(MOBILE)
              ? ResponsiveRowColumnType.ROW
              : ResponsiveRowColumnType.COLUMN,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: OptionsLogin(_scrollController),
              ),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                child: Stack(
                  children: [
                    OptionsLoginPage(),
                    Utils.isSmalSize(
                      BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width,
                      ),
                    )
                        ? SizedBox()
                        : Align(
                            alignment: Alignment.bottomRight,
                            child: FloatingActionButton(
                              backgroundColor: AppThemeUtils.colorPrimary,
                              onPressed: () {
                                if (_scrollController.hasClients)
                                  _scrollController.animateTo(
                                    0,
                                    duration: new Duration(milliseconds: 200),
                                    curve: Curves.easeOut,
                                  );
                              },
                              child: Icon(Icons.arrow_circle_up_rounded),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
