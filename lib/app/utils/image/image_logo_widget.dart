import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

import 'image_path.dart';


Widget getLogoIcon() {

  return Container(
      width: 300,color: AppThemeUtils.colorPrimary,
      height: 150,child: SvgPicture.asset(ImagePath.imageLogo),
   );
}
