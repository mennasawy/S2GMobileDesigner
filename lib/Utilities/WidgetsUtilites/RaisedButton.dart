import 'package:flutter/material.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'dart:ui';

import 'package:templets/Utilities/utility_methods.dart';

class BlueRaisedButtonWidget extends StatefulWidget {
  String hinttext;
  Function onpressed;
  String color;
  BlueRaisedButtonWidget({this.hinttext, this.onpressed, this.color});
  @override
  _BlueRaisedButtonWidget createState() => _BlueRaisedButtonWidget();
}

class _BlueRaisedButtonWidget extends State<BlueRaisedButtonWidget> {
  RaisedButton buildButton(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(
              color: (widget.color == null)
                  ? (widget.onpressed != null ? Colors.blue : GREY)
                  : hexToColor(widget.color))),
      elevation: 0.5,
      textColor:
          (widget.color == null) ? Colors.blue : hexToColor(widget.color),
      color: Colors.white,
      disabledColor: (widget.color == null) ? GREY : hexToColor(widget.color),
      child: Text(widget.hinttext,
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: getScreenHeight(context) * 0.028)),
      onPressed: widget.onpressed ?? null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.75,
        height: 45, //getScreenHeight(context) * 0.063,
        child: buildButton(context));
  }
}
