import 'package:flutter/material.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBarTemplate1/NTGAppBar.dart';
import 'package:templets/Utilities/WidgetsUtilites/RaisedButtonWidget.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class ChangeLanguageScreen extends StatefulWidget {
  @override
  _ChangeLanguageScreenState createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  @override
  Widget build(BuildContext context) {
//    appLanguage = Provider.of<AppLanguage>(context);

    return SafeArea(
      child: Scaffold(
        appBar: NTGAppBar(
            appBarType: AppBarType.appBarWithBack, pageName: "laonguage"),
        body: Column(children: <Widget>[
          getHeaderWidget(),
          getFooterWidget(),
          NTGButton(buttonText: "save"),
        ]),
      ),
    );
  }

  Widget getHeaderWidget() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Image.asset(
          IMG_LANGUAGE_SCREEN,
          height: getScreenHeight(context) * 0.15,
          width: getScreenWidth(context) * 0.30,
        )
      ],
    );
  }

  Widget getFooterWidget() {
    return Column(
      children: <Widget>[
        RadioListTile(
          title: Text(
            'English',
            style: normalBoldedTextStyle,
          ),
          activeColor: LIGHT_GREEN,
          value: 0,
        ),
        getDivider(),
        RadioListTile(
          title: Text('عربي', style: normalBoldedTextStyle),
          activeColor: LIGHT_GREEN,
          value: 1,
        ),
        getDivider(),
        SizedBox(
          height: getScreenHeight(context) * 0.25,
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

  @override
  void changeState() {
    setState(() {});
  }
}
