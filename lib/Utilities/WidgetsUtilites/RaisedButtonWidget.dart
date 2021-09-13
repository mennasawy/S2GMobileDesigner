import 'package:flutter/material.dart';
import 'package:templets/Utilities/utility_methods.dart';

class ButtonConstant {
  final String buttonText;
  ButtonConstant(
    this.buttonText,
  );
}

class NTGButton extends StatefulWidget {
  final String buttonText;
  final double fontSizePercentage;
  final Function onPressedButton;

  const NTGButton(
      {Key key, this.buttonText, this.onPressedButton, this.fontSizePercentage})
      : super(key: key);

//  NTGButton(String buttonText);

  @override
  _NTGButtonState createState() => _NTGButtonState();
}

class _NTGButtonState extends State<NTGButton> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: getScreenWidth(context) * 0.76,
      height: 45, //getScreenHeight(context) * 0.06,
      child: RaisedButton(
        child: (Text(
          widget.buttonText != null ? widget.buttonText : '',
          style: TextStyle(
              fontSize: getScreenHeight(context) *
                  (widget.fontSizePercentage ?? 0.028)),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        )),
        textColor: Colors.white,
        disabledColor: Colors.lightGreen.withOpacity(0.5),
        onPressed: widget.onPressedButton ?? null,
        disabledTextColor: Colors.blueGrey[50],
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        color: Colors.lightGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
