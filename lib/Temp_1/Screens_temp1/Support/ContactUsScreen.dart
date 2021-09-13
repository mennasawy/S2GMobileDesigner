import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Utilities/WidgetsUtilites/RaisedButtonWidget.dart';
import 'package:templets/Utilities/WidgetsUtilites/buildTextFieldMethods.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            tabTitleTextWidget(),
            titleTextMessageWidget(),
            SizedBox(
              height: 10,
            ),
            messageContetntWidget(),
            SizedBox(
              height: getScreenHeight(context) * 0.15,
            ),
            submitMessageButtonWidget(context),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  Widget tabTitleTextWidget() {
    return Container(
      padding: new EdgeInsets.fromLTRB(20, 20, 20, 20),

      ///to solve two lines issue
//      height: 100,
      child: Text(
        "contact us",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
            fontSize: 25.0,
            color: Colors.black),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget titleTextMessageWidget() {
    return Container(
      padding: new EdgeInsets.only(left: 15, right: 15),
      width: getScreenWidth(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getNormalTitle("title", context, null),
          Container(
            height: getScreenHeight(context) * 0.07,
            child: TextField(
              maxLines: 1,
              decoration: InputDecoration(
                filled: true,
                fillColor: Light_Blue,
                focusedBorder: buildOutlineInputBorder(context),
                enabledBorder: buildOutlineInputBorder(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget messageContetntWidget() {
    return Container(
//      height: getScreenHeight(context)*0.07,/////
      padding: new EdgeInsets.only(left: 15, right: 15),
      width: getScreenWidth(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getNormalTitle("message", context, null),
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: 30.0, maxHeight: 150.0),
            child: TextField(
              maxLines: 10,
              minLines: 1,
              decoration: InputDecoration(
                filled: true,
                fillColor: LITE_BLUE,
                focusedBorder: buildOutlineInputBorder(context),
                enabledBorder: buildOutlineInputBorder(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget submitMessageButtonWidget(BuildContext context) {
    return Container(
      padding: new EdgeInsets.only(left: 25, right: 25, bottom: 15),
      width: getScreenWidth(context),
      child: NTGButton(
        buttonText: "send message",
        onPressedButton: () {},
      ),
    );
  }

//  OutlineInputBorder outlineInputBorder() {
//    return OutlineInputBorder(
//      borderSide: BorderSide(
//        color: LITE_BLUE_ACCENT,
//        width: TEXTFIELD_SEARCH_BORDER_RADUIS_WIDTH,
//      ),
//      borderRadius: BorderRadius.circular(TEXTFIELD_SEARCH_BORDER_RADUIS),
//    );
//  }

}
