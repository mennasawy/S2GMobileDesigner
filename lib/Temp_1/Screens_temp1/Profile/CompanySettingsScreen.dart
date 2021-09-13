import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBarTemplate1/NTGAppBar.dart';
import 'package:templets/Utilities/WidgetsUtilites/RaisedButton.dart';
import 'package:templets/Utilities/WidgetsUtilites/RaisedButtonWidget.dart';
import 'package:templets/Utilities/WidgetsUtilites/buildTextFieldMethods.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/dropdownfield.dart';

//enum SettingsMode { menu, splash }

class NewSetting extends StatefulWidget {
  @override
  NewSettingState createState() => NewSettingState();
}

class NewSettingState extends State<NewSetting> {
  List<String> themesNames = ["theme1", "theme2"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: getAppBrWidget(),
            body: WillPopScope(
              child: SingleChildScrollView(
                child: Material(
                  child: Column(
                    children: <Widget>[
                      headerWidget(),
                      middleWidget1(),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 2, 10, 10),
                      ),
                      middleWidget2(),
//                      setTemplateWidget()
                      getFooterWidget(),
                    ],
                  ),
                ),
              ),
            )));
  }

  Widget getAppBrWidget() {
    return NTGAppBar(
      appBarType: AppBarType.appBarWithBack,
      pageName: "company setting",
    );
  }

  Widget headerWidget() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        getSettingsLabelWidget(),
        Image.asset(
          IMG_COMPANY_SETTINGSCREEN,
          height: getScreenHeight(context) * 0.15,
          width: getScreenWidth(context) * 0.30,
        ),
        SizedBox(
          height: getScreenWidth(context) * 0.02,
        ),
      ],
    );
  }

  Widget middleWidget1() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
            child: Text("Sitting_server"),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(15.10, 0, 15, 5),
              child: TextField(
                  decoration: buildInputDecorations(
                      context, "", false, null, null, null))),
          SizedBox(
            height: getScreenHeight(context) * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
            child: Text("Sitting_port"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration:
                  buildInputDecorations(context, "", false, null, null, null),
            ),
          ),
          SizedBox(
            height: getScreenHeight(context) * 0.02,
          ),
          getCupertinoSwitchWidget(),
          Divider(
            thickness: 1,
            indent: 15,
            endIndent: 15,
          ),
        ]);
  }

  Widget middleWidget2() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start, //<-- move text top

        children: <Widget>[
          SizedBox(
            height: getScreenHeight(context) * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
            child: Text("Sitting_companyName"),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: TextField(
                  decoration: buildInputDecorations(
                      context, "", false, null, null, null))),
          SizedBox(
            height: getScreenHeight(context) * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
            child: Text(
              "Sitting_deviceID",
            ),
          ),
          Container(
            height: getScreenHeight(context) * 0.1,
            width: getScreenWidth(context) * 100,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
              child: TextField(
                readOnly: true,
//                controller: _presenter.userSettingData.deviceIdController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.content_copy,
                      color: BLUE,
                    ),
                  ),
                  focusedBorder: getOutlineBorder(),
                  enabledBorder: getOutlineBorder(),
                  filled: true,
                  enabled: true,
                  hoverColor: LITE_GREY,
                  fillColor: LITE_BLUE,
                  border: getOutlineBorder(),
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
              child: getThemesWidget()),
          SizedBox(
            height: getScreenHeight(context) * 0.04,
          ),
        ]);
  }

  Widget getFooterWidget() {
    return Column(
      children: <Widget>[
        Column(
          children: [
            BlueRaisedButtonWidget(
              hinttext: "Setting_ScanQR",
            ),
            SizedBox(
              height: getScreenHeight(context) * 0.02,
            ),
          ],
        ),
        BlueRaisedButtonWidget(
          hinttext: "Sitting_checkLicense",
        ),
        SizedBox(
          height: getScreenHeight(context) * 0.02,
        ),
        NTGButton(
          buttonText: "Sitting_save",
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "V2.3",
          style: normalGreyTextStyle,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget getSettingsLabelWidget() {
    return Container(
      height: 60,
      width: getScreenWidth(context) * 0.95,
      decoration: BoxDecoration(
        color: Colors.amber[100],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Text(
          "Sitting_Company in menu",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget getCupertinoSwitchWidget() {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10),
        ),
        Text(
          'SSL',
          style: normalBoldedTextStyle,
        ),
        SizedBox(
          width: getScreenWidth(context) * 0.55,
        ),
        CupertinoSwitch(
          activeColor: LIGHT_GREEN,
          value: false,
        )
      ],
    );
  }

  DropDownField getThemesWidget() {
    return DropDownField(
//      value: _presenter.userSettingData.selectedThemeNameController.text,
      hintText: 'Themes',
      labelText: 'Themes',
      context: context,
      items: themesNames,
      required: false,
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

  setTemplateWidget() {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text("New Template"),
        ),
        SizedBox(
          width: 50,
        ),
        CupertinoSwitch(
          value: false,
          activeColor: Colors.green,
        ),
      ],
    );
  }
}
