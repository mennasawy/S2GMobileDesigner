import 'package:flutter/material.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class BasicButton extends StatelessWidget {
  final String buttonText;
  final Function onPressedButton;
  final double buttonHeight;
  final double buttonWidth;
  final Color bgColor;
  final Color textColor;
  final Widget buttonChild;
  const BasicButton(
      {Key key,
      this.buttonText,
      this.onPressedButton,
      this.buttonHeight,
      this.bgColor,
      this.textColor,
      this.buttonWidth,
      this.buttonChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: buttonWidth ?? MediaQuery.of(context).size.width * 0.7,
        height: buttonHeight ?? getScreenHeight(context) * 0.075,
        child: buildBasicButton(context));
  }

  Widget buildBasicButton(BuildContext context) {
    return RaisedButton(
      child: buttonChild ??
          Text(
            buttonText != null ? buttonText : '',
            style: TextStyle(fontSize: 17),
          ),
      textColor: textColor ?? WHITE,
      color: bgColor ?? Main_Blue,
      disabledColor:
          bgColor?.withOpacity(0.5) ?? Colors.blue[700].withOpacity(0.6),
//        textColor:ThemeManager.themeColor(ThemeSection.buttons,ThemeProperty.fontColor),
//        disabledColor: ThemeManager.themeColor(
//            ThemeSection.buttons, ThemeProperty.borderColor)
//            .withOpacity(0.5), //Colors.lightGreen.withOpacity(0.5),
      onPressed: onPressedButton ?? null,
      disabledTextColor: textColor ?? Colors.blueGrey[50],
      padding: EdgeInsets.all(5),
//        color: ThemeManager.themeColor(
//            ThemeSection.buttons, ThemeProperty.borderColor),
//        Colors.lightGreen,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
