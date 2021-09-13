import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class Temp2CheckBoxUDA extends StatefulWidget {
  bool value;
  bool isVisible;
  final String title;
  String udaDescription;
  final String labelColor;
  bool isReadOnly = false;
  bool isMandatory = false;
  bool isLocation = false;

  Temp2CheckBoxUDA({
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
  _Temp2CheckBoxUDAState createState() => _Temp2CheckBoxUDAState();
  final Function(bool) onValueChange;
}

class _Temp2CheckBoxUDAState extends State<Temp2CheckBoxUDA> {
  // bool value;
  // bool isVisible;
  // final String name;
  // bool isReadOnly = false;
  // final Function(bool) onValueChange;

  // @override
  // void didUpdateWidget(CheckBoxUDA oldWidget) {
  //   if (isReadOnly != widget.isReadOnly && widget.isReadOnly != null) {
  //     isReadOnly = widget.isReadOnly;
  //   }
  //   if (isVisible != widget.isVisible && widget.isVisible != null) {
  //     isVisible = widget.isVisible;
  //   }
  //   super.didUpdateWidget(oldWidget);
  // }

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
          onChanged: (v) => {
            widget.isReadOnly != true
                ? setState(() => {
                      widget.value = v,
                      widget.onValueChange(v),
                    })
                : null
          },
          activeColor: (widget.isReadOnly == true) ? DARK_GREY : Main_Green,
        ),
      ],
    );
  }
}
