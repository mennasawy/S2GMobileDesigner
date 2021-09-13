import 'package:flutter/material.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2BasicTextInputUDA.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/BasicButton.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/DecorationUtils.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/Temp2LogoWidget.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class LoginTemp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: WHITE,
          resizeToAvoidBottomPadding: false,
          resizeToAvoidBottomInset: false,
          body: WillPopScope(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  loginHeaderLogoWidget(context),
                  Stack(
                    children: <Widget>[
                      loginBodyContent(context),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }

  // build widgets methods
  Widget loginHeaderLogoWidget(BuildContext context) {
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

  Widget loginBodyContent(BuildContext context) {
    return Container(
      height: getScreenHeight(context) * 0.61,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Temp2BasicTextInputUDA(
            title: "user name",
            isVisible: true,
            isMandatory: true,
//           inputDecoration: getTextFieldInputDecoration(),
          ),
          Temp2BasicTextInputUDA(
            title: "password",
            isVisible: true,
            isMandatory: true,
            isPassword: true,
//           inputDecoration: getTextFieldInputDecoration(),
          ),
          Row(
//            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              remeberMeWidget(),
              ResetPassword(),
            ],
          ),
          BasicButton(
            textColor: WHITE,
            buttonWidth: getScreenWidth(context) * 0.8,
            buttonText: "login",
            onPressedButton: () {},
          ),
          BasicButton(
            bgColor: GREY,
            textColor: BLUE,
            buttonWidth: getScreenWidth(context) * 0.8,
            buttonText: "Setting",
            onPressedButton: () {},
          )
        ],
      ),
    );
  }

  Widget remeberMeWidget() {
    return Expanded(
      child: Row(
        children: <Widget>[
          Checkbox(
            value: true,
            activeColor: BLUE,
          ),
          Text("remeber me"),
        ],
      ),
    );
  }

  Widget ResetPassword() {
    return GestureDetector(
      child: Center(
          child: Text(
        "reset password",
      )),
    );
  }
}
