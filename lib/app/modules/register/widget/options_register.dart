import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_marketplace_web/app/modules/register/register_store.dart';
import 'package:new_marketplace_web/app/utils/image/image_path.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';

class OptionsRegister extends StatefulWidget {
  final ScrollController scrollController;

  OptionsRegister(this.scrollController);

  @override
  _OptionsRegisterState createState() => _OptionsRegisterState();
}

class _OptionsRegisterState
    extends ModularState<OptionsRegister, RegisterStore> {
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
       Observer(builder: (_)=>   Container(
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
                        "DESEJA SE CADASTRAR PARA?",
                        textAlign: TextAlign.center,
                        style: AppThemeUtils.normalBoldSize(
                            color: AppThemeUtils.whiteColor, fontSize: 20),
                      )),
                  Container(
                      height: 50,
                      width: 200,
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          controller.selectPage(controller.PEDIDO);
                          if (widget.scrollController.hasClients)
                            widget.scrollController.animateTo(
                              widget.scrollController.position.maxScrollExtent,
                              duration: new Duration(milliseconds: 200),
                              curve: Curves.easeOut,
                            );
                        },
                        child: Text(
                          "FAZER UM PEDIDO",
                          style: AppThemeUtils.normalBoldSize(
                              color: controller.actualPage == controller.PEDIDO
                                  ? AppThemeUtils.colorPrimary
                                  : AppThemeUtils.whiteColor,fontSize: 14),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary:
                                controller.actualPage == controller.PEDIDO
                                    ? Colors.white
                                    : Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                side: BorderSide(
                                    color: AppThemeUtils.whiteColor,
                                    width: 1))),
                      )),
                  Container(
                      height: 50,
                      width: 200,
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          controller.selectPage(controller.PRODUTO);
                          if (widget.scrollController.hasClients)
                            widget.scrollController.animateTo(
                              widget.scrollController.position.maxScrollExtent,
                              duration: new Duration(milliseconds: 200),
                              curve: Curves.easeOut,
                            );
                        },
                        child: Text(
                          "ANUNCIAR PRODUTOS",
                          style: AppThemeUtils.normalBoldSize(
                              color: controller.actualPage == controller.PRODUTO
                                  ? AppThemeUtils.colorPrimary
                                  : AppThemeUtils.whiteColor,fontSize: 14),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: controller.actualPage == controller.PRODUTO
                                ? Colors.white
                                : Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                side: BorderSide(
                                    color:AppThemeUtils.whiteColor,
                                    width: 1))),
                      )),
                  Container(
                      height: 50,
                      width: 200,
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          controller.selectPage(controller.ENTREGADOR);
                          if (widget.scrollController.hasClients)
                            widget.scrollController.animateTo(
                              widget.scrollController.position.maxScrollExtent,
                              duration: new Duration(milliseconds: 200),
                              curve: Curves.easeOut,
                            );
                        },
                        child: Text(
                          "REALIZAR ENTREGAS",
                          style: AppThemeUtils.normalBoldSize(
                            color: controller.actualPage == controller.ENTREGADOR
                                ? AppThemeUtils.colorPrimary
                                : AppThemeUtils.whiteColor,fontSize: 14
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary:
                                controller.actualPage == controller.ENTREGADOR
                                    ? Colors.white
                                    : Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                side: BorderSide(
                                    color: AppThemeUtils.whiteColor,
                                    width: 1))),
                      )),
                ],
              )))
        ],
      ),
    );
  }
}
