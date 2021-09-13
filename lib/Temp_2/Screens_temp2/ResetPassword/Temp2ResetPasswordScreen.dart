import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2BasicTextInputUDA.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/BasicButton.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/DecorationUtils.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/Temp2LogoWidget.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class Temp2ResetPasswordScreen extends StatefulWidget {
  final Uint8List logoImage;

  const Temp2ResetPasswordScreen({Key key, this.logoImage}) : super(key: key);

  @override
  _Temp2ResetPasswordScreenState createState() =>
      _Temp2ResetPasswordScreenState();
}

class _Temp2ResetPasswordScreenState extends State<Temp2ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[headerLogoWidget(), reserPasswordContent()],
            ),
          ],
        ),
      ),
    );
  }

  Widget headerLogoWidget() {
    return Container(
      height: getScreenHeight(context) * 0.33,
      child: Center(
        child: Container(
          padding: EdgeInsets.all(3),
          decoration: drawContainerBorder(WHITE, borderColor: WHITE),
//          borderRadius: BorderRadius.circular(2.0),
          child: getLogoWidget(null),
        ),
      ),
    );
  }

  Widget reserPasswordContent() {
    return Container(
      padding: const EdgeInsets.all(25.0),
      height: getScreenHeight(context) * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Temp2BasicTextInputUDA(
            title: "email",
            isVisible: true,
            isMandatory: true,
//           inputDecoration: getTextFieldInputDecoration(),
          ),
          BasicButton(
            textColor: WHITE,
            buttonWidth: getScreenWidth(context) * 0.75,
            buttonText: "Reset Password",
          ),
        ],
      ),
    );
  }
}
