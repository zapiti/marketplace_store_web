import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_web/app/components/plus_less/plus_less_component.dart';
import 'package:new_marketplace_web/app/modules/client/modules/cart/cart_store.dart';
import 'package:new_marketplace_web/app/modules/store/model/product.dart';


buildPlusLessButton(BuildContext context, Product _product, CartStore controller) {
  TextEditingController controllerTextField = TextEditingController();

  var product = controller.getProductByShopping(_product);
  var myQtd = controller.getQtdItemToCart(product);
  var number = myQtd < 10 ? "0$myQtd" : "$myQtd";
  controllerTextField.text = "$number";
  controllerTextField.selection =
      TextSelection.fromPosition(TextPosition(offset: controllerTextField.text.length));
  int getValueController(TextEditingController controller) {
    var value =
    controllerTextField.value.text.isEmpty ? 0 : int.parse(controllerTextField.value.text);
    return value;
  }

  return   PlusLessComponent(
      controller: controllerTextField,
      containsValue:( getValueController(controllerTextField) > 0),
      actionAdd: () {
        int value = getValueController(controllerTextField);

        int qtd = value + 1;
        var number = qtd < 10 ? "0$qtd" : "$qtd";
        controllerTextField.text = "$number";

        _product.quantity = qtd;
        controller.updateCart(_product);
        // NewOrderedBloc()
        //     .updateValue(_product, qtd, _scaffoldKey, desableMessage: true);
      },
      actionRemove: () {
        int value = getValueController(controllerTextField);
        var qtd = 0;
        if (value > 0) {
          qtd = value - 1;
          var number = qtd < 10 ? "0$qtd" : "$qtd";
          controllerTextField.text = "$number";
        }
        _product.quantity = qtd;
        controller.updateCart(_product);
      },
      changedValue: (valueChange) {
        int value2 = valueChange.isEmpty ? 0 : int.parse(valueChange);
        _product.quantity = value2;
        controller.updateCart(_product);
        Future.delayed(Duration(milliseconds: 150), () {
          // NewOrderedBloc().updateValue(_product, value2, _scaffoldKey,
          //     desableMessage: true);
        });
      });
}
