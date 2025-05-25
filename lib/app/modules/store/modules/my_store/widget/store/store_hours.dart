import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_web/app/components/select/custom_drop_menu.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';
import 'package:new_marketplace_web/app/utils/utils.dart';

import '../../../../store_store.dart';
import '../../my_store_store.dart';

class StoreHours extends StatefulWidget {
  @override
  _StoreHoursState createState() => _StoreHoursState();
}

class _StoreHoursState extends State<StoreHours> {
  final storeControl = Modular.get<StoreStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 0, top: 0),
      child: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Defina os horários de funcionamento por dia",
              style: AppThemeUtils.normalSize(fontSize: 18),
            ),
          ),
          ...(storeControl.establishment?.operationHours ?? [])
              .asMap()
              .map((index, e) => MapEntry(
                    index,
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          height: 45,
                          margin: EdgeInsets.all(10),
                          child: ElevatedButton(
                            child: Text(
                              e.day.toString(),
                              style: AppThemeUtils.normalSize(
                                  color: AppThemeUtils.whiteColor),
                            ),
                            onPressed: () {
                              setState(() {
                                e.isClosed = !(e.isClosed ?? true);
                                storeControl
                                    .establishment?.operationHours![index] = e;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: (e.isClosed ?? true)
                                    ? AppThemeUtils.colorGrayLight
                                    : AppThemeUtils.successColor),
                          ),
                        )),
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.all(10),
                          child: CustomDropMenuWidget(
                            controller:
                                TextEditingController(text: e.start ?? '00:00'),
                            isExpanded: true,
                            listen: (text) {
                              e.start = text;
                              storeControl
                                  .establishment?.operationHours![index] = e;
                            },
                            title: "00:00",
                            listElements: Utils.getHours(),
                          ),
                        )),
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.all(10),
                                child: CustomDropMenuWidget(
                                  controller: TextEditingController(
                                      text: e.end ?? '00:00'),
                                  isExpanded: true,
                                  title: "00:00",
                                  listen: (text) {
                                    e.end = text;
                                    storeControl.establishment
                                        ?.operationHours![index] = e;
                                  },
                                  listElements: Utils.getHours(),
                                ))),
                      ],
                    ),
                  ))
              .values
              .toList(),
          Container(
            height: 45,
            width: 200,
            margin: EdgeInsets.all(10),
            child: ElevatedButton(
              child: Text(
                "DEFINIR",
                style:
                    AppThemeUtils.normalSize(color: AppThemeUtils.whiteColor),
              ),
              onPressed: () {
                storeControl.updateEstablishment(
                    context, storeControl.establishment!);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppThemeUtils.colorPrimary),
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      )),
    );
  }
}
