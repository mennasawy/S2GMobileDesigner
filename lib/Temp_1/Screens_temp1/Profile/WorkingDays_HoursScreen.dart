import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/BasicTextInputUDA.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBarTemplate1/NTGAppBar.dart';
import 'package:templets/Utilities/WidgetsUtilites/RaisedButtonWidget.dart';
import 'package:templets/Utilities/WidgetsUtilites/TimeWidget.dart';
import 'package:templets/Utilities/WidgetsUtilites/buildTextFieldMethods.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class WorkingDaysHours extends StatefulWidget {
  @override
  _WorkingDaysHoursState createState() => _WorkingDaysHoursState();
}

class _WorkingDaysHoursState extends State<WorkingDaysHours> {
  _WorkingDaysHoursState();
  List weekDaysObject = [
    "saturday",
    "sunday",
    "monday",
    "tuesday",
    "sunday",
    "sunday",
    "sunday"
  ];
  TextStyle style(opacity) {
    return TextStyle(
        fontSize: TEXT_FONT_SIZE,
        fontWeight: FontWeight.w700,
        color: Colors.black.withOpacity(opacity));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: NTGAppBar(
          appBarType: AppBarType.appBarWithClose,
          pageName: "working days",
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(height: 35),
            for (var day in weekDaysObject) getRowOfDayWidget(day),
            SizedBox(height: 20),
            textWidget(),
            SizedBox(height: 20),
            getStartWorkingHourWidget(),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: BasicTextInputUDA(
                inputDecoration:
                    buildInputDecorations(context, "", false, null, null, null),
                title: "hour cost",
                isVisible: true,
                isMandatory: false,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: BasicTextInputUDA(
                inputDecoration:
                    buildInputDecorations(context, "", false, null, null, null),
                title: "working day hour",
                isVisible: true,
                isMandatory: false,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: NTGButton(
                  buttonText: "save",
                )),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  getRowOfDayWidget(day) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: getCheckBoxWidget(
        day,
      ),
    );
  }

  Widget textWidget() {
    return Padding(
      padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: Text(
        "working_hours",
        style: boldtitlesTextStyle,
      ),
    );
  }

  getCheckBoxWidget(day) {
    return Container(
      height: 40,
      child: Row(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                "$day",
//                '  ' + day["day"],
//                style: day["value"] ? style(1.0) : style(0.6),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          // Spacer(),
          CupertinoSwitch(
            value: true,
//            onChanged: (v) => {
//              setState(() {
//                day["value"] = v;
//              })
//            },
            activeColor: LIGHT_GREEN,
          ),
        ],
      ),
    );
  }

  getStartWorkingHourWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
//        SizedBox(width: 10),
          getNormalTitle("start", context, null),
          SizedBox(
            height: 8,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2 - 20,
            child: TimeWidget(
              name: "start",
//              initialTimeValue: ConvertStringToDataTime(
//                  _presenter.userData.startWorkingHour, "hh:mm"),
            ),
          ),
          SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }
}
