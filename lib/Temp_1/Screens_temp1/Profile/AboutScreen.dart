import 'package:flutter/material.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBarTemplate1/NTGAppBar.dart';
import 'package:templets/Utilities/app_constants.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: NTGAppBar(
          pageName: "about",
          appBarType: AppBarType.appBarWithBack,
        ),
        body: Material(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 100, 20, 10),
                      child: Container(
                        width: 150.0,
                        height: 150.0,
                        decoration: new BoxDecoration(
                          //   color: const Color(0xff7c94b6),
                          image: new DecorationImage(
                            image: new AssetImage('logo.png'),
                            fit: BoxFit.contain,
                          ),
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(100.0)),
//                        border: new Border.all(
//                         // color: Colors.red,
//                          width: 4.0,
//                        ),
                        ),
                      ),
                    ),
                    Text(
                      "Smart2Go",
                      style: normalBoldedTextStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "1.0",
                      style: normalBoldedTextStyle,
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "@ 2016 NTG Clarity  ",
                    style: normalTextStyle,
                  ),
                  Image(
                    image: AssetImage('ntg_logo.png'),
                    height: 30,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
