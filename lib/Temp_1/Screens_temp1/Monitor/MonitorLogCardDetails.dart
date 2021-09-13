import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBarTemplate1/NTGAppBar.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class LogCard extends StatefulWidget {
  @override
  _LogCardState createState() => _LogCardState();
}

class _LogCardState extends State<LogCard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: NTGAppBar(
          appBarType: AppBarType.appBarWithBack,
          pageName: "log",
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          width: getScreenWidth(context),
          height: 220,
          child: Card(
//            margin: const EdgeInsets.all(5),
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      ('Field Name:  nnn'),
                      style: normalBlueTextStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Old Value :",
                      style: normalTextStyle,
                    ),
                    FittedBox(
                        child: Text(
                      "mmm",
                      style: normalTextStyle,
                    )),
                    SizedBox(
                      height: 6,
                    ),
                    FittedBox(
                        child: Text(
                      'New value :',
                      style: normalTextStyle,
                    )),
                    Text(
                      "newww",
                      style: normalTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
