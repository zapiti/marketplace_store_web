import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_web/app/modules/client/modules/bag/bag_store.dart';
import 'package:new_marketplace_web/app/modules/client/modules/bag/widget/finish_order/stage/address_order.dart';
import 'package:new_marketplace_web/app/modules/client/modules/bag/widget/finish_order/stage/finish_cash_order.dart';
import 'package:new_marketplace_web/app/modules/client/modules/bag/widget/finish_order/stage/initial_order.dart';
import 'package:new_marketplace_web/app/modules/client/modules/bag/widget/finish_order/stage/payment_order.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';
import 'package:timelines/timelines.dart';

class FinishOrder extends StatelessWidget {
  final controller = Modular.get<BagStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        body: Column(
          children: [
            Container(
                height: 100,
                child: _timeLineBuilder(context, _sizeWidget(context),
                    controller.processIndex, controller.getColor, (index) {
                  controller.goNextProgress(index);
                })),
            Expanded(child: _getActualStage(controller.processIndex))
          ],
        ),
        floatingActionButton:  controller.processIndex == 3 ? null : FloatingActionButton.extended(
          label: Row(
            children: [Text('CONTINUAR'), Icon(Icons.arrow_forward)],
          ),
          onPressed: () {
            controller.goNextProgress(null);
          },
          backgroundColor: AppThemeUtils.inProgressColor,
        ),
      );
    });
  }
}

_getActualStage(int processIndex) {
  switch (processIndex) {
    case 0:
      return InitialOrder();
    case 1:
      return AddressOrder();
    case 2:
      return PaymentOrder();
    case 3:
      return FinishCashOrder();
    default:
      return SizedBox();
  }
}

double _sizeWidget(BuildContext context) {
  return (MediaQuery.of(context).size.width * 0.95 / finishProgress.length);
}

Timeline _timeLineBuilder(
    BuildContext context,
    double sizeWidget,
    int processIndex,
    Color Function(int) colorIndex,
    Function(int) onTapAtIndex) {
  return Timeline.tileBuilder(
    theme: TimelineThemeData(
      direction: Axis.horizontal,
      connectorTheme: ConnectorThemeData(
        space: 5.0,
        thickness: 5.0,
      ),
    ),
    builder: TimelineTileBuilder.connected(
      connectionDirection: ConnectionDirection.before,
      itemExtentBuilder: (_, __) => sizeWidget > 300 ? 300 : sizeWidget,
      oppositeContentsBuilder: (context, index) {
        return SizedBox();
      },
      contentsBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            finishProgress[index],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: colorIndex(index),
            ),
          ),
        );
      },
      indicatorBuilder: (_, index) {
        var color;
        var child;
        if (index == processIndex) {
          color = AppThemeUtils.inProgressColor;
          child = Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(
              strokeWidth: 3.0,
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          );
        } else if (index < processIndex) {
          color = AppThemeUtils.completeColor;
          child = Icon(
            Icons.check,
            color: Colors.white,
            size: 15.0,
          );
        } else {
          color = AppThemeUtils.todoColor;
        }

        if (index <= processIndex) {
          return Stack(
            children: [
              InkWell(
                  onTap: () {
                    onTapAtIndex(index);
                  },
                  child: DotIndicator(
                    size: 30.0,
                    color: color,
                    child: child,
                  )),
            ],
          );
        } else {
          return Stack(
            children: [
              OutlinedDotIndicator(
                borderWidth: 4.0,
                color: color,
              ),
            ],
          );
        }
      },
      connectorBuilder: (_, index, type) {
        if (index > 0) {
          if (index == processIndex) {
            final prevColor = colorIndex(index - 1);
            final color = colorIndex(index);
            List<Color> gradientColors;
            if (type == ConnectorType.start) {
              gradientColors = [Color.lerp(prevColor, color, 0.5)!, color];
            } else {
              gradientColors = [prevColor, Color.lerp(prevColor, color, 0.5)!];
            }
            return DecoratedLineConnector(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradientColors,
                ),
              ),
            );
          } else {
            return SolidLineConnector(
              color: colorIndex(index),
            );
          }
        } else {
          return null;
        }
      },
      itemCount: finishProgress.length,
    ),
  );
}
