import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';


class TitleDescriptionWebWidget extends StatelessWidget {
  final String title;
  final String? description;
  final GestureTapCallback? action;
  final IconData? iconData;

  TitleDescriptionWebWidget({required this.title,
     this.description,
    this.action,
    this.iconData});

  @override
  Widget build(BuildContext context) {
    return      InkWell(
      onTap: action,
      child:
      Container(
          margin: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(iconData ?? Icons.keyboard_arrow_right,
                color: AppThemeUtils.colorPrimary,),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: Text(title ,
                              style: AppThemeUtils.normalBoldSize(
                                  fontSize: 14))),
                    ],
                  )),
              description == null ? SizedBox() : Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    description!,
                    style: AppThemeUtils.normalSize(fontSize: 14),
                  )),
            ],
          )
      ),
    );
  }


}
