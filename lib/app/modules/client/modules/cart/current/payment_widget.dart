import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_marketplace_web/app/modules/client/modules/order/components/sub_nivel/show_details_order_widget.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';

class PaymentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: buttonSelected(true, "Cartão de crédito/débito",
                      'Pague com o seu cartão', () {},color:AppThemeUtils.colorPrimary)),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: buttonSelected(false, 'Saldo em carteira',
                      'Pague com o seu saldo', () {},color:AppThemeUtils.colorPrimary))
            ],
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: TextField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(24),
                  ],
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  onChanged: (text) {},
                  onSubmitted: (term) {},
                  decoration: InputDecoration(
                      labelText: "Número do cartão",
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.3),
                      )))),
          Row(
            children: [
              Expanded(
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(24),
                        ],
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        onChanged: (text) {},
                        onSubmitted: (term) {},
                        decoration: InputDecoration(
                            labelText: "Validade",
                            border: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.3),
                            )))),
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(24),
                        ],
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        onChanged: (text) {},
                        onSubmitted: (term) {},
                        decoration: InputDecoration(
                            labelText: "CVV",
                            border: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.3),
                            )))),
              )
            ],
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: TextField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(24),
                  ],
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  onChanged: (text) {},
                  onSubmitted: (term) {},
                  decoration: InputDecoration(
                      labelText: "Nome do titular",
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.3),
                      )))),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: TextField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(24),
                  ],
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  onChanged: (text) {},
                  onSubmitted: (term) {},
                  decoration: InputDecoration(
                      labelText: "Apelido do cartão (opcional)",
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.3),
                      )))),
          Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: ElevatedButton(
                onPressed: () {},
                child: Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "SALVAR",
                      style: AppThemeUtils.normalBoldSize(
                          color: AppThemeUtils.whiteColor),
                    )),
                style: ElevatedButton.styleFrom(
                    primary: AppThemeUtils.colorPrimary, elevation: 0),
              ))
        ],
      ),
    );
  }
}
