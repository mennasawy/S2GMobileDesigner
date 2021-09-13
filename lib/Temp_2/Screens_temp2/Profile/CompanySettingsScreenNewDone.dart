import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBars.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/BasicButton.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/DecorationUtils.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class NewSettingScreen extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<NewSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
//      onWillPop: () => bottomBarManager.openPreviousScreen(context),
      child: DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: getSettingAppBar(),
          backgroundColor: Colors.grey[50],
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 5),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        inputServerDataCard(context),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 5),
                    child: comapnyAndDeviceIDCard(context),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  BasicButton(
                    textColor: Main_Blue,
                    bgColor: WHITE,
                    buttonWidth: getScreenWidth(context) * 0.8,
                    buttonHeight: 40,
                    buttonText: "QR Scan",
                    onPressedButton: (){},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BasicButton(
                      buttonWidth: getScreenWidth(context) * 0.8,
                      buttonHeight: 40,
                      onPressedButton: () {},
                      buttonText: "Check License"),
                  SizedBox(
                    height: 10,
                  ),
                  BasicButton(
                      onPressedButton: (){},
                      textColor: WHITE,
                      bgColor: GREEN,
                      buttonWidth: getScreenWidth(context) * 0.8,
                      buttonHeight: 40,
                      buttonText: "save"),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
//          bottomNavigationBar: BottomNavigatioBarWidget(
//            context: context,
//            screenType: ScreenType.setting,
//          ),
          // floatingActionButton: BottomBarFloatingbutton(),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }

  getSettingAppBar() {
    return Template2AppBars(
      screenName: "company setting",
      appBarType: Template2AppBarType.main,
      appBarButtomHeight: 120,
      buttomWidget: Center(
        child: Text(
          "If you need to edit any data in company setting you must log out first",
          style: normalTextStyle,
        ),
      ),
    );
  }

  Card comapnyAndDeviceIDCard(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 25),
        child: Column(children: [
          buildBasicTextInputUDA(
            context,
            title: "Sitting_companyName",
          ),
          SizedBox(height: 25),
          buildBasicTextInputUDA(
            context,
            isReadonly: true,
            title: "Sitting_deviceID",
            iconName: IC_DUPLICATE_FIELD,
          ),
          SizedBox(height: 20),
        ]),
      ),
    );
  }

  Card inputServerDataCard(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 25),
        child: Column(
          children: [
            buildBasicTextInputUDA(
              context,
              title: "Sitting_server",
            ),
            SizedBox(height: 25),
            buildBasicTextInputUDA(
              context,
              title: "Sitting_port",
            ),
            SizedBox(height: 20),
            getCupertinoSwitch(),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  Row getCupertinoSwitch() {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text("SSL"),
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

  TextField buildBasicTextInputUDA(
    BuildContext context, {
    String title,
    TextEditingController controller,
    bool isReadonly,
    String iconName,
  }) {
    return TextField(
        controller: controller,
//      title: title ?? " ",
//      isVisible: true,
//      isReadOnly: isReadonly ?? _presenter.isReadOnly(),
        decoration: getTextFieldInputDecoration(
          iconName: iconName,
        ));
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
