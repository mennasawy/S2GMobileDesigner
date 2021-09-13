import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Utilities/utility_methods.dart';

class FooterWidget extends StatefulWidget {
  final String textTitle;
  final String buttonTitle;
  final Function buttonAction;

  FooterWidget({Key key, this.textTitle, this.buttonTitle, this.buttonAction})
      : super(key: key);

  @override
  _FooterWidgetState createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  @override
  Widget build(BuildContext context) {
    double widgetHeight = 60.0;

    return Container(
//      padding: new EdgeInsets.only(left: 50),
      color: Colors.white,
      width: getScreenWidth(context),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            textWidget(),
            buttonWidget(),
          ],
        ),
      ),
    );
  }

  Widget textWidget() {
    return Text(
      widget.textTitle,
      textAlign: TextAlign.center,
    );
  }

  Widget buttonWidget() {
    return GestureDetector(
      onTap: buttonAction,
      child: Text(
        ' ' + widget.buttonTitle,
        textAlign: TextAlign.start,
      ),
    );
  }

  buttonAction() {
    // (widget.buttonAction != null) ? widget.buttonAction() : Navigator.of(context).pop(); //utils
    if (widget.buttonAction != null) widget.buttonAction();
  }
}
