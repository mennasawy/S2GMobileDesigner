import 'package:flutter/material.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBars.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/BasicButton.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class Language extends StatefulWidget {
  Language({key}) : super(key: key);

  @override
  _LanguageWidget createState() => _LanguageWidget();
}

class _LanguageWidget extends State<Language> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      appBar: Template2AppBars(
        screenName: "language",
        appBarType: Template2AppBarType.secendary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            ListTile(
              title: const Text('عربي'),
              leading: Radio(
                value: 1,
                groupValue: 0,
              ),
            ),
            ListTile(
              title: const Text('English'),
              leading: Radio(
                value: 0,
                groupValue: 0,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: BasicButton(
                buttonWidth: getScreenWidth(context) * 0.4,
                buttonHeight: getScreenWidth(context) * 0.12,
                buttonText: "save",
                onPressedButton: (){},
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void changeState() {
    setState(() {});
  }
}
