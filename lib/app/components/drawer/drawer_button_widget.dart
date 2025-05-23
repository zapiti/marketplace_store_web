import 'package:flutter/material.dart';
import 'package:new_marketplace_web/app/components/divider/line_view_widget.dart';
import 'package:new_marketplace_web/app/components/drawer/semi_circle.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';

class DrawerButton extends StatelessWidget {
   DrawerButton({
    required this.active,
    required this.context,
    required this.title,
    required this.iconData,
    required this.onPressed,
    this.color,
    this.menutitle,
  });

  final bool active;
  final BuildContext context;
  final VoidCallback onPressed;
  final String title;
  final IconData iconData;
  final Color? color;
  final String? menutitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        menutitle == null
            ? SizedBox()
            : Container(
                margin: EdgeInsets.only(top: 15, right: 15, left: 15),
                child: Text(
                  menutitle ?? '',
                  maxLines: 1,
                  style: AppThemeUtils.normalSize(),
                ),
              ),
        menutitle == null ? SizedBox() : lineViewWidget(top: 5, bottom: 15),
        semiCircleWidget(
            48,
            active
                ? (color ?? Theme.of(context).primaryColor)
                : Colors.transparent,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, elevation: 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.only(top: 12, bottom: 12, right: 22),
                  child: Row(children: [
                    Icon(
                      iconData,
                      size: 24,
                      color: active
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      title,
                      style: AppThemeUtils.normalSize(
                          color: active ? Colors.white : AppThemeUtils.black),
                    ),
                  ]),
                ),
              ),
            ))
      ],
    );
  }
}
