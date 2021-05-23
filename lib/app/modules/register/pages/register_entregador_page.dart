import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketplace_store_web/app/components/empty/empty_view.dart';
import 'package:marketplace_store_web/app/utils/image/image_path.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

class RegisterEntregadorPage extends StatefulWidget {
  @override
  _RegisterEntregadorPageState createState() => _RegisterEntregadorPageState();
}

class _RegisterEntregadorPageState extends State<RegisterEntregadorPage> {
  @override
  Widget build(BuildContext context) {
    return Container(

        child: Center(
        child: Container(
          width: 400,
      child: Center(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "SEJA UM DE NOSSOS PARCEIROS",
                  style: AppThemeUtils.normalBoldSize(
                      color: AppThemeUtils.colorPrimary, fontSize: 26),textAlign: TextAlign.center,
                )),
            Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "Baixe o app e trabalhe com a gente.",
                  style: AppThemeUtils.normalSize(
                      color: AppThemeUtils.colorPrimary, fontSize: 24),textAlign: TextAlign.center,
                )),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                        child: Container(
                            height: 75,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            padding: EdgeInsets.all(10),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: SvgPicture.asset(
                                ImagePath.apple,
                                fit: BoxFit.fill,
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent, elevation: 0),
                            ))),
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.all(10),
                            height: 75,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: SvgPicture.asset(
                                ImagePath.google,
                                fit: BoxFit.fill,
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent, elevation: 0),
                            )))
                  ],
                ))
          ],
        )),
      ),
    )));
  }
}
