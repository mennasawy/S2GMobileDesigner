import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Utilities/WidgetsUtilites/loginHeader.dart';
import 'package:templets/Utilities/app_constants.dart';

class MenuScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: <Widget>[
        getBackGroundImgWidget(context),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: 20),
            getCloseIconWidget(context),
            SizedBox(height: 35),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  getLogoWidget(context),
                  SizedBox(height: 15),
                  getTextWidget(
                    "dashboard",
                    context,
                  ),
                  SizedBox(height: 15),
                  getTextWidget(
                    "todo",
                    context,
                  ),
                  SizedBox(height: 15),
                  getTextWidget(
                    "application",
                    context,
                  ),
                  SizedBox(height: 15),
                  getTextWidget(
                    "profile",
                    context,
                  ),
                ],
              ),
            ),
            Spacer(),
            getFooterWidget(context)
          ],
        ),
      ]),
    ));
  }

  Widget getBackGroundImgWidget(context) {
    return Image.asset(
      BG_MENU,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
    );
  }

  Widget getCloseIconWidget(context) {
    return Row(
      children: <Widget>[
        Spacer(),
        Container(
          height: 25,
          width: 25,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
                width: 25,
                height: 25,
                child: Image.asset(
                  IC_CLOSE,
                  fit: BoxFit.cover,
                )),
          ),
        ),
        SizedBox(
          width: 30,
        )
      ],
    );
  }

  Widget getLogoWidget(context) {
    return logoWidget(context, false, null);
  }

  Widget getTextWidget(String text, BuildContext context) {
    return GestureDetector(
      child: Container(
          color: Colors.white.withOpacity(0),
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text(
              text,
              style: titlesTextStyle,
//              style: TextStyle(
//                  fontSize: 28,
//                  fontWeight: FontWeight.w900,
//                  color: BLACK.withOpacity(0.7)
//              ),
            ),
          )),
    );
  }

  Widget getFooterWidget(context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(width: 20),
            getFooterTextWidget(
              "setting",
              context,
            ),
            Spacer(),
            getFooterTextWidget(
              "support",
              context,
            ),
            SizedBox(width: 20)
          ],
        ),
      ],
    );
  }

  Widget getFooterTextWidget(String text, context) {
    return GestureDetector(
      child: Container(
          // width: 80,
          height: 50,
          child: Text(text, style: normalTextStyle
              // TextStyle(
              //     fontSize: TEXT_FONT_SIZE,
              //     fontWeight: FontWeight.w700,
              //     color: Colors.black.withOpacity(0.6)),
              )),
    );
  }
}
