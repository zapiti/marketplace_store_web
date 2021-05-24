import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketplace_store_web/app/components/divider/line_view_widget.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

class PlusLessComponent extends StatefulWidget {
  final TextEditingController controller;
  final Function actionAdd;
  final Function actionRemove;
  final ValueChanged<String> changedValue;
  final bool containsValue;

  PlusLessComponent(
      {this.controller,
      this.actionAdd,
      this.actionRemove,
      this.changedValue,
      this.containsValue = false});

  @override
  _PlusLessComponentState createState() => _PlusLessComponentState();
}

class _PlusLessComponentState extends State<PlusLessComponent> {
  var currentValue = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentValue = widget.containsValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child:  !currentValue
        ? RaisedButton(
            color: AppThemeUtils.colorPrimary,
            onPressed: () {
              if (!currentValue) {
                setState(() {
                  currentValue = !currentValue;
                });
              }
              widget.actionAdd();
            },
            //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView())),
            child: Text(
              'Comprar',
              style: TextStyle(color: AppThemeUtils.whiteColor, fontSize: 16),
            ),
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide.none),
          )
        : Container(
            child: Center(
                child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                !currentValue ? SizedBox() : lineViewWidget(height: 0.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    !currentValue
                        ? SizedBox()
                        : Expanded(
                            child: Container(
                                decoration: _boxDecoration(
                                    color: !currentValue
                                        ? Colors.transparent
                                        : AppThemeUtils.whiteColor,
                                    borderWidth: 0),
                                child: InkWell(
                                  onTap: () {
                                    if ((int.tryParse(widget.controller.text) ??
                                            0) <=
                                        1) {
                                      setState(() {
                                        currentValue = !currentValue;
                                      });
                                    }
                                    widget.actionRemove();
                                  },
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    child: Icon(
                                      Icons.remove,
                                      color: AppThemeUtils.colorPrimary,
                                      size: 18,
                                    ),
                                  ),
                                ))),
                    !currentValue
                        ? SizedBox()
                        : Expanded(
                            child: Container(
                            height: 35,
                            child: TextField(
                              controller: widget.controller,
                              scrollPadding: EdgeInsets.only(bottom: 0),
                              maxLines: 1,
                              enabled: false,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(6),
                              ],
                              onChanged: (text) {
                                if ((int.tryParse(widget.controller.text) ??
                                        0) <=
                                    0) {
                                  setState(() {
                                    currentValue = !currentValue;
                                  });
                                }
                                widget.changedValue(text);
                              },
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: new InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 15),
                                  border: InputBorder.none),
                            ),
                          )),
                    /**/
                    Expanded(
                        child: Container(
                            decoration: _boxDecoration(
                                color: !currentValue
                                    ? Colors.transparent
                                    : Theme.of(context).primaryColor,
                                borderWidth: 0),
                            child: InkWell(
                              onTap: () {
                                if (!currentValue) {
                                  setState(() {
                                    currentValue = !currentValue;
                                  });
                                }
                                widget.actionAdd();
                              },
                              child: Container(
                                width: 35,
                                height: 35,
                                child: Icon(
                                  Icons.add,
                                  color: !currentValue
                                      ? Theme.of(context).primaryColor
                                      : AppThemeUtils.whiteColor,
                                  size: 18,
                                ),
                              ),
                            ))),
                  ],
                )
              ],
            ),
            decoration: _boxDecoration(),
          ))));
  }
}

Widget plusLessSimpleComponent(BuildContext context,
    {TextEditingController controller,
    Function actionAdd,
    Function actionRemove,
    ValueChanged<String> changedValue}) {
  return Container(
      height: 50,
      width: 100,
      child: Center(
          child: Container(
        height: 37,
        width: 180,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            InkWell(
                onTap: actionRemove,
                child: Container(
                  width: 35,
                  height: 35,
                  child: Icon(
                    Icons.remove,
                    color: AppThemeUtils.whiteColor,
                    size: 18,
                  ),
                )),
            Expanded(
                child: Container(
                    child: TextField(
              controller: controller,
              maxLines: 1,
              inputFormatters: [
                LengthLimitingTextInputFormatter(6),
              ],
              onChanged: changedValue,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 12),
                  border: InputBorder.none),
            ))),
            Container(
                child: InkWell(
              onTap: actionAdd,
              child: Container(
                width: 35,
                height: 35,
                child: Icon(
                  Icons.add,
                  color: AppThemeUtils.whiteColor,
                  size: 18,
                ),
              ),
            )),
          ],
        ),
        decoration: _boxDecoration(),
      )));
}

BoxDecoration _boxDecoration(
    {Color color = Colors.white, double borderWidth = 1}) {
  return new BoxDecoration(
    color: color,
    borderRadius: BorderRadius.all(Radius.circular(5)),
    border: Border.all(color: Color(0xffE6E6E6), width: borderWidth),
    shape: BoxShape.rectangle,
  );
}
