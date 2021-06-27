import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/components/divider/line_view_widget.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

void showWidgetDialog({
  required Widget customWidget,
  required BuildContext context,
}) {
  showDialog(
      context: context,
      builder: (ctx) => _DialogGeneric(
            customWidget: customWidget,
          ));
}

class _DialogGeneric extends StatelessWidget {
  final Widget customWidget;

  final _scrollController = ScrollController();

  _DialogGeneric({
    required this.customWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child:SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                  width: MediaQuery.of(context).size.width > 500
                      ? 500
                      : MediaQuery.of(context).size.width * 0.8,
                  child: Material(
                      color: Colors.transparent,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.transparent,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child:  Scrollbar(
                              controller: _scrollController, // <---- Here, the controller
                              isAlwaysShown: true, // <---- Required
                              child: ListBody(children: <Widget>[
                            Container(
                                padding: EdgeInsets.only(top: 0, bottom: 0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  border:
                                      Border.all(color: Colors.white, width: 0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Column(children: [
                                  customWidget,
                                  lineViewWidget(),
                                  Container(
                                      height: 45,
                                      width: double.infinity,
                                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                                      child: ElevatedButton(
                                        child: Text(
                                          "Fechar",
                                          style: AppThemeUtils.normalSize(
                                              color: AppThemeUtils.whiteColor),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .popUntil((route) => route.isFirst);
                                        },
                                        style: ElevatedButton.styleFrom(
                                            primary: AppThemeUtils.colorPrimary,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: new BorderRadius.circular(4.0),
                                                side: BorderSide(color: AppThemeUtils.colorPrimary))),
                                      ))
                                ],)),
                          ])))))),
    );
  }
}
