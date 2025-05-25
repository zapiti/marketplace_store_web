import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_marketplace_web/app/modules/login/login_store.dart';
import 'package:new_marketplace_web/app/utils/image/image_path.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';

class OptionsLogin extends StatefulWidget {
  final ScrollController scrollController;
  OptionsLogin(this.scrollController);
  @override
  _OptionsLoginState createState() => _OptionsLoginState();
}

class _OptionsLoginState extends ModularState<OptionsLogin, LoginStore> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.asset(
            ImagePath.bgLogin,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Image.asset(
            ImagePath.bgTopLogin,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
          Observer(
            builder:
                (_) => Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: SvgPicture.asset(
                          ImagePath.imageLogo,
                          width: 150,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.all(10),
                        child: Text(
                          "DESEJA SE ENTRAR PARA?",
                          textAlign: TextAlign.center,
                          style: AppThemeUtils.normalBoldSize(
                            color: AppThemeUtils.whiteColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 200,
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                controller.actualPage == controller.PEDIDO
                                    ? AppThemeUtils.colorPrimary
                                    : Colors.transparent,
                            elevation: 0,
                          ),
                          onPressed: () {
                            controller.selectPage(controller.PEDIDO);
                            if (widget.scrollController.hasClients)
                              widget.scrollController.animateTo(
                                widget
                                    .scrollController
                                    .position
                                    .maxScrollExtent,
                                duration: new Duration(milliseconds: 200),
                                curve: Curves.easeOut,
                              );
                          },
                          child: Text(
                            "FAZER UM PEDIDO",
                            style: AppThemeUtils.normalBoldSize(
                              color:
                                  controller.actualPage == controller.PEDIDO
                                      ? AppThemeUtils.whiteColor
                                      : AppThemeUtils.colorPrimary,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 200,
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                controller.actualPage == controller.PRODUTO
                                    ? AppThemeUtils.colorPrimary
                                    : Colors.transparent,
                            elevation: 0,
                          ),
                          onPressed: () {
                            controller.selectPage(controller.PRODUTO);
                            if (widget.scrollController.hasClients)
                              widget.scrollController.animateTo(
                                widget
                                    .scrollController
                                    .position
                                    .maxScrollExtent,
                                duration: new Duration(milliseconds: 200),
                                curve: Curves.easeOut,
                              );
                          },
                          child: Text(
                            "ANUNCIAR PRODUTOS",
                            style: AppThemeUtils.normalBoldSize(
                              color:
                                  controller.actualPage == controller.PRODUTO
                                      ? AppThemeUtils.whiteColor
                                      : AppThemeUtils.colorPrimary,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 200,
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                controller.actualPage == controller.ENTREGADOR
                                    ? AppThemeUtils.colorPrimary
                                    : Colors.transparent,
                            elevation: 0,
                          ),
                          onPressed: () {
                            controller.selectPage(controller.ENTREGADOR);
                            if (widget.scrollController.hasClients)
                              widget.scrollController.animateTo(
                                widget
                                    .scrollController
                                    .position
                                    .maxScrollExtent,
                                duration: new Duration(milliseconds: 200),
                                curve: Curves.easeOut,
                              );
                          },
                          child: Text(
                            "REALIZAR ENTREGAS",
                            style: AppThemeUtils.normalBoldSize(
                              color:
                                  controller.actualPage == controller.ENTREGADOR
                                      ? AppThemeUtils.whiteColor
                                      : AppThemeUtils.colorPrimary,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
