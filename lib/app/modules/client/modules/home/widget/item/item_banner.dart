import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/components/picker/user_image_widget.dart';
import 'package:marketplace_store_web/app/modules/client/modules/home/model/my_banner.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

class ItemBanner extends StatelessWidget {
  final MyBanner banner;

  ItemBanner(this.banner);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      child: Stack(
        children: [
          ImageWidgetComponent(banner.image,
              width: double.infinity, fit: BoxFit.cover, height: 150),
          Container(
            width: double.infinity,
            height: double.infinity,

            decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Text(
                  banner.title,
                  style: AppThemeUtils.normalBoldSize(
                      color: AppThemeUtils.whiteColor, fontSize: 22),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Text(
                  banner.description,
                  style: AppThemeUtils.normalSize(
                      color: AppThemeUtils.whiteColor, fontSize: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
