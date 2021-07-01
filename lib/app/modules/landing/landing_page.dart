import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketplace_store_web/app/app_store.dart';
import 'package:marketplace_store_web/app/components/appbar/custom_landing_app_bar.dart';
import 'package:marketplace_store_web/app/components/drawer/custom_landing_drawer.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';
import 'package:marketplace_store_web/app/utils/image/image_path.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';

class LandingPage extends StatefulWidget {
  @override
  LandingPageState createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      final _appStore = Modular.get<AppStore>();
      _appStore.getCurrentUserFutureValue().then((value) {
        if (value != null) {
          if (value.client != null) {
            Modular.to
                .pushReplacementNamed(ConstantsRoutes.CALL_CLIENT_HOMEPAGE);
          } else if (value.establishment != null) {
            Modular.to
                .pushReplacementNamed(ConstantsRoutes.CALL_STORE_HOMEPAGE);
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Utils.isSmalSize(
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width))
          ? null
          : CustomLandingDrawer(),
      body: Stack(
        children: <Widget>[
          Image.asset(
            ImagePath.bgLanding,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Image.asset(ImagePath.bgTopLanding,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover),
          Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                ImagePath.phones,
                height: MediaQuery.of(context).size.width / 2 > 600
                    ? 600
                    : MediaQuery.of(context).size.width / 2,
                fit: BoxFit.cover,
              )),
          CustomLandingAppBar(),
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 500,
                height: MediaQuery.of(context).size.height,
                margin: EdgeInsets.only(top: 0, left: 20, right: 20),
                child: Center(
                    child: SingleChildScrollView(
                        child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          "LIBERDADE E SEGURANÇA,\nBAIXE O APP",
                          style: AppThemeUtils.normalBoldSize(
                              color: AppThemeUtils.whiteColor, fontSize: 26),
                        )),
                    Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          "Melhore sua qualidade de vida, receba suas compras em casa, valorizando o seu tempo.",
                          style: AppThemeUtils.normalSize(
                              color: AppThemeUtils.whiteColor, fontSize: 24),
                        )),
                    Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                                          primary: Colors.transparent,
                                          elevation: 0),
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
                                          primary: Colors.transparent,
                                          elevation: 0),
                                    )))
                          ],
                        ))
                  ],
                ))),
              )),
        ],
      ),
    );
  }
}
