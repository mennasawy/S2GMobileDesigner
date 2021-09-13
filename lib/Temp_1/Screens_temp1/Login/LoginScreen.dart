import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/BasicTextInputUDA.dart';
import 'package:templets/Utilities/WidgetsUtilites/FooterWidget.dart';
import 'package:templets/Utilities/WidgetsUtilites/RaisedButton.dart';
import 'package:templets/Utilities/WidgetsUtilites/RaisedButtonWidget.dart';
import 'package:templets/Utilities/WidgetsUtilites/loginHeader.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: WHITE,
          resizeToAvoidBottomPadding: false,
          resizeToAvoidBottomInset: false,
          body: WillPopScope(
            child: Column(
              children: <Widget>[
                Container(
                    height: (getScreenHeight(context) - 70) * 0.3,
                    child: HeaderWidget(context, false, null)),
                Container(
                    height: (getScreenHeight(context) - 70) * 0.7,
                    child: _LoginWidget(
                        context, (getScreenHeight(context) - 70) * 0.7)),
                _FooterWidget(context),
              ],
            ),
          )),
    );
  }

  // build widgets methods
  Widget _LoginWidget(BuildContext context, double widgetHeight) {
    return Container(
      width: getScreenWidth(context),
      // height: getScreenHeight(context) * 0.57,
      child: Stack(children: <Widget>[
        Column(
          children: <Widget>[
            Spacer(),
            Container(
              height: 80,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: BasicTextInputUDA(
                title: "Email",
                isMandatory: true,
                labelColor: null,
                isVisible: true,
                isUserName: true,
                inputHint: "ex: email@ntg.com",
              ),
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 80,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: BasicTextInputUDA(
                    labelColor: null,
                    title: "password",
                    isMandatory: true,
                    isVisible: true,
                    isPassword: true,
                  ),
                ),
                _RememberMeWidget()
              ],
            ),
            Spacer(),
            Spacer(),
            // Expanded(flex: 2, child: _RememberMeWidget()),
//            SizedBox(
//              height: (widgetHeight) * 0.1,
//            ),
            NTGButton(
              buttonText: "Sign in",
              onPressedButton: (){},
            ),
            SizedBox(
              height: (widgetHeight) * 0.05,
            ),
            BlueRaisedButtonWidget(
              color: null,
              hinttext: "Setting",
              onpressed: (){},
            ),
            Spacer()
          ],
        ),
//        drawWidgetOrEmptyContainer(_isRecaptured, _recapturaLoginWidget()),
      ]),
    );
  }

  Widget _RememberMeWidget() {
    return Container(
        padding: EdgeInsets.fromLTRB(8, 0, 8, 10),
        height: 50, //getScreenHeight(context) * 0.08,
        child: CheckboxListTile(
          value: true,
//          value: _presenter.rememberMe,
//          onChanged: (rememberMe) =>
//              _presenter.onRemeberMeValueChanged(rememberMe),
          title: Text("remeber_me"),
          activeColor: LIGHT_GREEN,
        ));
  }

  Widget _recapturaLoginWidget(BuildContext context) {
    return Center(
      child: Dialog(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: getScreenWidth(context) * 0.8,
          decoration: ShapeDecoration(
            color: WHITE,
            shape: Border.all(color: Colors.black),
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
//                width: MediaQuery.of(context).size.width * 0.8,
//                child: WebView(
//                  initialUrl: "https://tsystem.ntgeg.com/dev/rest/reCaptcha",
//                  javascriptMode: JavascriptMode.unrestricted,
//                  javascriptChannels: Set.from([
//                    JavascriptChannel(
//                        name: 'Captcha',
//                        onMessageReceived: (JavascriptMessage message) =>
//                            _presenter.onRecapturedSuccess(message))
//                  ]),
//                  onWebViewCreated: (WebViewController w) {
//                    webViewController = w;
//                  },
//                ),
              ),
              RaisedButton(
                onPressed: () {
//                  _presenter.onRecaptureButtonClosed();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _FooterWidget(BuildContext context) {
    return Expanded(
//      height: 44, //getScreenHeight(context) * 0.08,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Divider(
              height: 3,
              color: GREY,
            ),
          ),
          Expanded(
              flex: 3,
              child: FooterWidget(
                textTitle: "",
                buttonTitle: 'reset_password',
                buttonAction: (){},
              )),
          Expanded(
            flex: 2,
            child: Container(),
          )
        ],
      ),
    );
  }
}
