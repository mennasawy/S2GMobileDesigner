import 'package:flutter/material.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBars.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/BasicButton.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

enum pushNavigation { Always, SetTime, Never }

class Push_navigation extends StatefulWidget {
  @override
  _Push_navigationState createState() => _Push_navigationState();
}

class _Push_navigationState extends State<Push_navigation> {
  pushNavigation _site = pushNavigation.Always;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      appBar: Template2AppBars(
        screenName: "notification",
        appBarType: Template2AppBarType.secendary,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: pushNotificationBody(),
      ),
    );
  }

  Widget pushNotificationBody() {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Always'),
          leading: Radio(
            value: pushNavigation.Always,
            groupValue: _site,
            onChanged: (value) {
              setState(() {
                _site = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Set Time'),
          leading: Radio(
            value: pushNavigation.SetTime,
            groupValue: _site,
            onChanged: (value) {
              setState(() {
                _site = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Never'),
          leading: Radio(
            value: pushNavigation.Never,
            groupValue: _site,
            onChanged: (value) {
              setState(() {
                _site = value;
              });
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: BasicButton(
            buttonWidth: getScreenWidth(context) * 0.4,
            buttonHeight: getScreenWidth(context) * 0.12,
            onPressedButton: () {},
            buttonText: "save",
          ),
        ),
      ],
    );
  }
}
