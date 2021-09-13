import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/BasicTextInputUDA.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBars.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/BasicButton.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/DecorationUtils.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

// ignore: must_be_immutable
class ChangePassWordNewScreen extends StatefulWidget {
  @override
  _ChangePassWordNewScreenState createState() =>
      _ChangePassWordNewScreenState();
}

class _ChangePassWordNewScreenState extends State<ChangePassWordNewScreen> {
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController;

    return SafeArea(
      child: Scaffold(
        appBar: Template2AppBars(
          screenName: "change password",
          appBarType: Template2AppBarType.secendary,
        ),
        body: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    headerWidget(context),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: getOldPsswordWidget(context),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: getNewPsswordWidget(context),
                    ),
                    SizedBox(
                      height: getScreenHeight(context) * 0.05,
                    ),
                    saveButton(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget headerWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "change password",
          style: normalTextStyle,
        ),
      ),
    );
  }

  Widget getOldPsswordWidget(BuildContext context) {
    return BasicTextInputUDA(
      inputDecoration: getTextFieldInputDecoration(),
      isVisible: true,
      title: "old password",
      isMandatory: true,
      isPassword: true,
    );
  }

  Widget getNewPsswordWidget(BuildContext context) {
    return BasicTextInputUDA(
      inputDecoration: getTextFieldInputDecoration(),
      isVisible: true,
      title: "change password",
      isMandatory: true,
      isPassword: true,
    );
  }

  Widget saveButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: BasicButton(
        buttonWidth: getScreenWidth(context) * 0.4,
        buttonHeight: getScreenWidth(context) * 0.12,
        buttonText: "save",
      ),
    );
  }
}
