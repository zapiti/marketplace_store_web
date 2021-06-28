import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

class TileButtonDescription extends StatelessWidget {
  final String? title;
  final String? subtitle;

  final Function action;
  final String? trailing;
  final bool isSelected;

  TileButtonDescription(
      {this.title,
      this.subtitle,
      required this.action,
      this.trailing,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: isSelected ? Colors.green[100] : Colors.grey[100],
          border: Border.all(
            color: isSelected
                ? AppThemeUtils.successColor
                : AppThemeUtils.colorGrayLight!,width: 2
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title ?? '',
                    style: AppThemeUtils.normalBoldSize(
                      fontSize: 16,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2),
                  ),
                  Text(
                    subtitle ?? '',
                    style: AppThemeUtils.normalSize(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: isSelected
                      ? AppThemeUtils.successColor
                      : AppThemeUtils.colorGrayLight),
              child: Text(trailing ?? '', style: AppThemeUtils.normalBoldSize(
                fontSize: 18,
              ),),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
