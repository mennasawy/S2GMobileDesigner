import 'package:flutter/material.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBarTemplate1/NTGAppBar.dart';
import 'package:templets/Utilities/WidgetsUtilites/RaisedButtonWidget.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  ChangePasswordScreenState createState() => ChangePasswordScreenState();
}

class ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
          child: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                NTGAppBar(
                  pageName: "change password",
                  appBarType: AppBarType.appBarWithBack,
                ),
                headerWidget(),
                getOldPsswordWidget(),
                getNewPsswordWidget(),
                SizedBox(
                  height: getScreenHeight(context) * 0.1,
                ),
                SaveButton(),
              ],
            ),
          ),
        ],
      )),
    );
  }

  Widget headerWidget() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 5,
        ),
        Image.asset(
          IMG_CHANGE_PASSWORD,
          height: getScreenHeight(context) * 0.15,
          width: getScreenWidth(context) * 0.30,
        ),
        Center(
            child: Text(
          "change password",
          style: normalTextStyle,
        )),
        SizedBox(
          height: getScreenHeight(context) * 0.03,
        ),
      ],
    );
  }

  Widget getOldPsswordWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RichText(
          text: TextSpan(
              text: "old password",
              style: labelTextStyle,
              children: <TextSpan>[
                TextSpan(text: ' *', style: labelMandatoryTextStyle),
              ]),
        ),
        Container(
          height: getScreenHeight(context) * 0.07,
          width: getScreenWidth(context) - WIDTH_OFFSET,
          child: TextField(
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.visibility,
                  color: Main_Blue,
                ),
              ),
              focusedBorder: getOutlineBorder(),
              enabledBorder: getOutlineBorder(),
              filled: true,
              enabled: true,
              hoverColor: LITE_BLUE,
              fillColor: LITE_BLUE,
              border: getOutlineBorder(),
            ),
          ),
        ),
        SizedBox(
          height: getScreenHeight(context) * 0.02,
        ),
      ],
    );
  }

  Widget getNewPsswordWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RichText(
          text: TextSpan(
              text: "new password",
              style: labelTextStyle,
              children: <TextSpan>[
                TextSpan(text: ' *', style: TextStyle(color: RED))
              ]),
        ),
        Container(
          height: getScreenHeight(context) * 0.07,
          width: getScreenWidth(context) - WIDTH_OFFSET,
          child: TextField(
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.visibility,
                  color: Main_Blue,
                ),
              ),
              focusedBorder: getOutlineBorder(),
              enabledBorder: getOutlineBorder(),
              filled: true,
              enabled: true,
              fillColor: LITE_BLUE,
              border: getOutlineBorder(),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
      ],
    );
  }

  Widget SaveButton() {
    return NTGButton(
      buttonText: "SAVE",
    );
  }

  OutlineInputBorder getOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(TEXTFIELD_BORDER_RADUIS),
      borderSide: BorderSide(
        color: LITE_BLUE,
        width: TEXTFIELD_BORDER_RADUIS_WIDTH,
      ),
    );
  }
}
