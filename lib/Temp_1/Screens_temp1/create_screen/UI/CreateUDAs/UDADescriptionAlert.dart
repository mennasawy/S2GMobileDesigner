import 'package:templets/Utilities/app_constants.dart';
import 'package:flutter/material.dart';

class UDADescriptionAlert {
  final String message;
  final BuildContext context;

  UDADescriptionAlert({this.message, this.context});

  Future<void> showAlert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: alertView,
    );
  }

  Widget alertView(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      title: getAlertTitleWidget(),
      titlePadding: EdgeInsets.all(0),
      content: alertContent(context),
      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
    );
  }

  // X button and alert image
  Column getAlertTitleWidget() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                }),
          ],
        ),
        Icon(Icons.phone_iphone),
      ],
    );
  }

  ConstrainedBox alertContent(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 50.0,
        maxHeight: 300.0,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SingleChildScrollView(child: alertMessage()),
          ],
        ),
      ),
    );
  }

  Text alertMessage() {
    return Text(
      message ?? "",
      textAlign: TextAlign.center,
      style: normalTextStyle,
    );
  }
}
