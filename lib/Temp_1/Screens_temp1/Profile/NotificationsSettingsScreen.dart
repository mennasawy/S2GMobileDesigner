import 'package:flutter/material.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBarTemplate1/NTGAppBar.dart';
import 'package:templets/Utilities/WidgetsUtilites/RaisedButtonWidget.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class NotificationsSettingsScreen extends StatefulWidget {
  @override
  NotificationsSettingsScreenState createState() =>
      NotificationsSettingsScreenState();
}

class NotificationsSettingsScreenState
    extends State<NotificationsSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: NTGAppBar(
        pageName: "notification",
        appBarType: AppBarType.appBarWithBack,
      ),
      body: Material(
        child: Column(children: <Widget>[
          getImageHederWidgit(),
          getRadioListWidget(),
          NTGButton(
            buttonText: "save",
          ),
        ]),
      ),
    ));
  }

  Widget getImageHederWidgit() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Image.asset(
          IMG_NOTFICATION_SETING_SCREEN,
          height: getScreenHeight(context) * 0.15,
          width: getScreenWidth(context) * 0.30,
        ),
      ],
    );
  }

  Widget getRadioListWidget() {
    return Column(
      children: <Widget>[
        RadioListTile(
          title: Text("always", style: normalBoldedTextStyle),
          activeColor: LIGHT_GREEN,
          value: 0,
        ),
        getDivider(),
        RadioListTile(
          title: Text("set time", style: normalBoldedTextStyle),
          activeColor: LIGHT_GREEN,
          value: 1,
        ),
        fromToTime(),
        getDivider(),
        RadioListTile(
          title: Text(
            "never",
            style: normalBoldedTextStyle,
          ),
          activeColor: LIGHT_GREEN,
          value: 2,
        ),
        getDivider(),
        SizedBox(
          height: getScreenHeight(context) * 0.10,
        ),
      ],
    );
  }

  Widget getDivider() {
    return Divider(
      thickness: 1,
      indent: 15,
      endIndent: 15,
    );
  }

  Widget fromToTime() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Visibility(
        child: GestureDetector(
          child: Text("from", style: normalTextStyle),
        ),
        visible: true,
      ),

      Visibility(
        child: GestureDetector(
          child: Container(
            width: 80,
            child: Text("11:20"),
          ),
        ),
        visible: true,
      ),

//        Text(from),

      SizedBox(
        width: 70,
      ),
      Visibility(
        child: GestureDetector(
          child: Text(
            "to",
            style: normalTextStyle,
          ),
        ),
        visible: true,
      ),

      Visibility(
          visible: true,
          child: Container(
            width: 80,
            child: GestureDetector(
              child: Text("11:90"),
            ),
          )),
    ]);
  }
}
