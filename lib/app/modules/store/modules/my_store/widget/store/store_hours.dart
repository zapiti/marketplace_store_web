import 'dart:html';

import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/components/select/custom_drop_menu.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

import '../../my_store_store.dart';

class StoreHours extends StatelessWidget {
  final MyStoreStore controller;

  StoreHours(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 0,top: 0),
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
          Row(
            children: [
              Expanded(
                  child: Container(
                height: 45,
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  child: Text(
                    "Segunda-feira",
                    style: AppThemeUtils.normalSize(
                        color: AppThemeUtils.whiteColor),
                  ),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: AppThemeUtils.successColor),
                ),
              )),
              Expanded(
                  child: Container(
                margin: EdgeInsets.all(10),
                child: CustomDropMenuWidget(
                  controller: TextEditingController(),
                  isExpanded: true,
                  title: "00:00",
                  listElements: [],
                ),
              )),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      child: CustomDropMenuWidget(
                        controller: TextEditingController(),
                        isExpanded: true,
                        title: "00:00",
                        listElements: [],
                      ))),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                height: 45,
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  child: Text(
                    "Terça-feira",
                    style: AppThemeUtils.normalSize(
                        color: AppThemeUtils.whiteColor),
                  ),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: AppThemeUtils.successColor),
                ),
              )),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      child: CustomDropMenuWidget(
                        controller: TextEditingController(),
                        isExpanded: true,
                        title: "00:00",
                        listElements: [],
                      ))),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      child: CustomDropMenuWidget(
                        controller: TextEditingController(),
                        isExpanded: true,
                        title: "00:00",
                        listElements: [],
                      ))),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                height: 45,
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  child: Text(
                    "Quarta-feira",
                    style: AppThemeUtils.normalSize(
                        color: AppThemeUtils.whiteColor),
                  ),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: AppThemeUtils.successColor),
                ),
              )),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      child: CustomDropMenuWidget(
                        controller: TextEditingController(),
                        isExpanded: true,
                        title: "00:00",
                        listElements: [],
                      ))),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      child: CustomDropMenuWidget(
                        controller: TextEditingController(),
                        isExpanded: true,
                        title: "00:00",
                        listElements: [],
                      ))),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                height: 45,
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  child: Text(
                    "Quinta-feira",
                    style: AppThemeUtils.normalSize(
                        color: AppThemeUtils.whiteColor),
                  ),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: AppThemeUtils.successColor),
                ),
              )),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      child: CustomDropMenuWidget(
                        controller: TextEditingController(),
                        isExpanded: true,
                        title: "00:00",
                        listElements: [],
                      ))),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      child: CustomDropMenuWidget(
                        controller: TextEditingController(),
                        isExpanded: true,
                        title: "00:00",
                        listElements: [],
                      ))),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                height: 45,
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  child: Text(
                    "Sexta-feira",
                    style: AppThemeUtils.normalSize(
                        color: AppThemeUtils.whiteColor),
                  ),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: AppThemeUtils.successColor),
                ),
              )),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      child: CustomDropMenuWidget(
                        controller: TextEditingController(),
                        isExpanded: true,
                        title: "00:00",
                        listElements: [],
                      ))),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      child: CustomDropMenuWidget(
                        controller: TextEditingController(),
                        isExpanded: true,
                        title: "00:00",
                        listElements: [],
                      ))),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                height: 45,
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  child: Text(
                    "Sabádo",
                    style: AppThemeUtils.normalSize(
                        color: AppThemeUtils.whiteColor),
                  ),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: AppThemeUtils.successColor),
                ),
              )),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      child: CustomDropMenuWidget(
                        controller: TextEditingController(),
                        isExpanded: true,
                        title: "00:00",
                        listElements: [],
                      ))),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      child: CustomDropMenuWidget(
                        controller: TextEditingController(),
                        isExpanded: true,
                        title: "00:00",
                        listElements: [],
                      ))),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                height: 45,
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  child: Text(
                    "Domingo",
                    style: AppThemeUtils.normalSize(
                        color: AppThemeUtils.whiteColor),
                  ),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: AppThemeUtils.successColor),
                ),
              )),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      child: CustomDropMenuWidget(
                        controller: TextEditingController(),
                        isExpanded: true,
                        title: "00:00",
                        listElements: [],
                      ))),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      child: CustomDropMenuWidget(
                        controller: TextEditingController(),
                        isExpanded: true,
                        title: "00:00",
                        listElements: [],
                      ))),
            ],
          ),
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
              onPressed: () {},
              style:
                  ElevatedButton.styleFrom(primary: AppThemeUtils.colorPrimary),
            ),
          ),SizedBox(height: 50,)
        ],
      )),
    );
  }
}
