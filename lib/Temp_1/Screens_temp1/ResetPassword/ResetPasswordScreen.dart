import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/BasicTextInputUDA.dart';
import 'package:templets/Utilities/WidgetsUtilites/FooterWidget.dart';
import 'package:templets/Utilities/WidgetsUtilites/RaisedButtonWidget.dart';
import 'package:templets/Utilities/WidgetsUtilites/loginHeader.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class ResetPasswordScreen extends StatefulWidget {
  final Uint8List logoImage;

  const ResetPasswordScreen({Key key, this.logoImage}) : super(key: key);

  @override
  ResetPasswordScreenState createState() => ResetPasswordScreenState();
}

class ResetPasswordScreenState extends State<ResetPasswordScreen> {
  ResetPasswordScreenState() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                HeaderWidget(context, false, null),
                SizedBox(
                  height: getScreenHeight(context) * 0.04, //35
                ),
                resetPasswordWidget(),
                FooterTextWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget resetPasswordWidget() {
    return Container(
      width: getScreenWidth(context),
      height: getScreenHeight(context) * 0.55,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          emailTextWidget(),
          SizedBox(
            height: 40.0,
          ),
          resetPasswordButtonWidget(),
        ],
      ),
    );
  }

  Widget emailTextWidget() {
    return Padding(
      padding: new EdgeInsets.only(left: 20.0, right: 20.0),
      child: BasicTextInputUDA(
        title: "email",
        isMandatory: true,
        isVisible: true,
        inputHint: "y@ntg.com",
      ),
    );
  }

  Widget resetPasswordButtonWidget() {
    return Padding(
        padding: new EdgeInsets.only(left: 50.0, right: 50.0),
        child: NTGButton(
          buttonText: "reset password",
          onPressedButton: () {},
        ));
  }

  Widget FooterTextWidget() {
    return Column(
      children: <Widget>[
        Divider(
          height: 1,
          thickness: 2,
          color: LITE_GREY,
        ),
        FooterWidget(
          textTitle: "",
          buttonTitle: "login",
          buttonAction: () {},
        ),
      ],
    );
  }
}
