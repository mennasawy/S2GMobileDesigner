import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/CheckBoxUDAPresenter.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckBoxUDA extends StatefulWidget {
  bool value;
  bool isVisible;
  final String title;
  String udaDescription;
  final String labelColor;
  bool isReadOnly = false;
  bool isMandatory = false;
  bool isLocation = false;

  CheckBoxUDA({
    Key key,
    this.onValueChange,
    this.title,
    @required this.value,
    this.isReadOnly,
    this.isVisible,
    this.isMandatory,
    this.isLocation,
    this.udaDescription,
    this.labelColor,
  }) : super(key: key) {
    if (isVisible == null) isVisible = true;
  }

  @override
  _CheckBoxUDAState createState() => _CheckBoxUDAState();
  final Function(bool) onValueChange;
}

class _CheckBoxUDAState extends State<CheckBoxUDA>
    implements CheckBoxUDAViewInterface {
  CheckBoxUDAPresenter checkBoxUDAPresenter;

  @override
  void initState() {
    super.initState();
    initializePresenter();
  }

  @override
  Widget build(BuildContext context) {
    return drawWidgetOrEmptyContainer(
        widget.isVisible == true && widget.isLocation != true,
        getUDAWithTitleWidget(context));
  }

  Row getUDAWithTitleWidget(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: getUDATitleWidget(context, widget.isMandatory, widget.title,
              widget.udaDescription, hexToColor(widget.labelColor)),
        ),
        CupertinoSwitch(
          key: widget.key,
          value: widget.value,
          onChanged: checkBoxUDAPresenter.onCheckBoxValueChange,
          activeColor: checkBoxUDAPresenter.checkBoxActiveColor(),
        ),
      ],
    );
  }

  initializePresenter() {
    checkBoxUDAPresenter = CheckBoxUDAPresenter(
      view: this,
      onValueChange: widget.onValueChange,
      isReadOnly: widget.isReadOnly,
      value: widget.value,
    );
  }

  @override
  updateCheckBoxWidget() {
    setState(() {});
  }
}
