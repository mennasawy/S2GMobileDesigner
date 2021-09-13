import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Utilities/WidgetsUtilites/FontUtils.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/BasicButton.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/Temp2WidgetsWithBorder.dart';
import 'package:templets/Utilities/app_constants.dart';

class BoxedButtonWidget extends StatefulWidget {
  final bool isMandatory;
  final String title;
  final Function onButtonTapped;
  final String buttonTitle;
  final String buttonLogo;
  const BoxedButtonWidget(
      {Key key,
      this.isMandatory,
      this.title,
      this.onButtonTapped,
      this.buttonTitle,
      this.buttonLogo})
      : super(key: key);

  @override
  _BoxedButtonWidgetState createState() => _BoxedButtonWidgetState();
}

class _BoxedButtonWidgetState extends State<BoxedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Temp2WidgetBorder(
      isMandatoryUDA: widget.isMandatory,
      title: widget.title,
      decoration: BoxDecoration(
        color: WHITE,
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        border: Border.all(
          color: DARK_GREY,
        ),
        boxShadow: [
          BoxShadow(
              blurRadius: 5.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 3.0),
              color: DARK_GREY)
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: BasicButton(
            bgColor: Colors.blue[700],
            buttonChild: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.buttonTitle,
                  style: FontUtils.buttonTitlesTextStyle(WHITE),
                ),
                Icon(Icons.phone_iphone),
              ],
            ),
            onPressedButton: widget.onButtonTapped),
      ),
    );
  }
}
