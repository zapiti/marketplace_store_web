import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'image_path.dart';


Widget getLogoIcon() {

  return Container(
      width: 300,
      height: 220,child: SvgPicture.asset(ImagePath.imageLogo),
   );
}
