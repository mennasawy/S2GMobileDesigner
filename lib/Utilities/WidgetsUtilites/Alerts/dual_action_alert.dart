import 'package:flutter/material.dart';
import 'package:templets/Utilities/utility_methods.dart';

import 'common_alert.dart';

class DualActionAlert extends SingleActionAlert {
  final String message;
  final String leftButtonTitle;
  final String rightButtonTitle;
  final Function leftButtonAction;
  final Function rightButtonAction;
  final BuildContext context;

  DualActionAlert(
      {this.message,
      this.leftButtonTitle,
      this.leftButtonAction,
      this.rightButtonTitle,
      this.rightButtonAction,
      this.context});

  @override
  Widget alertActions(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: FlatButton(
            child: Text(
              leftButtonTitle ?? "",
              style: getAlertButtonTextStyle(context),
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              (leftButtonAction != null)
                  ? leftButtonAction()
                  : Navigator.of(context).pop();
            },
          ),
        ),
        Container(
          width: 1,
          height: 30,
          color: Colors.grey[350],
        ),
        Expanded(
          flex: 5,
          child: FlatButton(
            child: Text(
              rightButtonTitle ?? "",
              style: getAlertButtonTextStyle(context),
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              (rightButtonAction != null)
                  ? rightButtonAction()
                  : Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
