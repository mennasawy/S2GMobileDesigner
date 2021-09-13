import 'package:flutter/material.dart';

import 'common_alert.dart';

class LogoutAlert extends SingleActionAlert {
  final String message;
  final String buttonTitle;
  final Function onButtonTap;
  final BuildContext context;

  LogoutAlert({this.message, this.buttonTitle, this.context, this.onButtonTap});

  Widget alertActions(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(color: Colors.red, width: 2.0)),
          color: Colors.white,
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text(
//     AppLocalizations.of(context).translate('Profile_cancel'),
            buttonTitle,
            style: TextStyle(color: Colors.grey),
          ),
          onPressed: () {
            onButtonTap != null ? onButtonTap() : Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
