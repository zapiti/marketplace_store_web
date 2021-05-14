import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/modules/login/widget/options_login.dart';
import 'package:marketplace_store_web/app/modules/login/widget/options_login_page.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';
import 'package:responsive/flex_widget.dart';
import 'package:responsive/responsive_row.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = new ScrollController();
    return Scaffold(
      body: SingleChildScrollView(controller: _scrollController,
       child: ResponsiveRow(

            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              FlexWidget(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: OptionsLogin(_scrollController),
                ),
                xs: 12,
                md: 12,
                xl: 6,
                sm: 12,
                lg: 6,
                xxl: 6,
                xxxl: 6,
              ),
              FlexWidget(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  child: Stack(
                    children: [
                      OptionsLoginPage(),
                      Utils.isSmalSize(BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width))
                          ? SizedBox()
                          : Align(
                          alignment: Alignment.bottomRight,
                          child: FloatingActionButton(
                              backgroundColor: AppThemeUtils.colorPrimary,
                              onPressed: () {
                                if (_scrollController.hasClients)
                                  _scrollController.animateTo(
                                    0,
                                    duration:
                                    new Duration(milliseconds: 200),
                                    curve: Curves.easeOut,
                                  );
                              },
                              child: Icon(Icons.arrow_circle_up_rounded)))
                    ],
                  ),
                ),
                xs: 12,
                md: 12,
                xl: 6,
                sm: 12,
                lg: 6,
                xxl: 6,
                xxxl: 6,
              ),
            ])
      ),
    );
  }
}
