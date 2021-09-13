import 'package:templets/Temp_2/Screens_temp2/todo_screens/TodoUtilsTemp2.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBars.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Utilities/WidgetsUtilites/DateWidget.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/BasicButton.dart';
import 'package:flutter/material.dart';

class AddNewtasklscreen2_2 extends StatelessWidget {
  static const routeName = '/taskscreen';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: GREY,
        appBar: Template2AppBars(
          screenName: 'Add New Task',
          appBarType: Template2AppBarType.secendary,
          onTap: () {},
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
            child: Column(
              children: <Widget>[
                getTaskTitleWidget(),
                getTaskNameWidget('Task Name', 'Task Name Goes Here', context),
                getCardsListWidget('Task Urgency', false),

                SizedBox(
                  height: 6,
                ),
                getTaskNameWidget('Assign Task', '@ name here', context),
//                Stack(
//                  children: <Widget>[
                //Task Panel Field
                Column(
                  children: <Widget>[
                    getCardsListWidget('Task Panel', true),
                    getStartEndDateWidget(context),
                    //Task Description Field
                    getTaskDescriptionWidget(context),

                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: BasicButton(
                          buttonHeight: 40,
                          buttonWidth: getScreenWidth(context) / 2,
                          buttonText: 'Save Task',
                          onPressedButton: () => {}),
                    ),
                  ],
                ),
//                  ],
//                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getTaskTitleWidget() {
    return Container(
      child: Text(
        'Add New Task',
        style: toDoTitleStyle,
      ),
      alignment: Alignment.centerLeft,
    );
  }

  getTaskNameWidget(String title, String hint, context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: getScreenWidth(context) / 2,
        padding: const EdgeInsets.only(top: 20, bottom: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            getTitleWidget(title),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 40,
              child: TextField(
                readOnly: true,
                decoration: getToDoInputDecoration(context, hint, 5.0),
              ),
            )
          ],
        ),
      ),
    );
  }

  getTitleWidget(String title) {
    return RichText(
        text: TextSpan(children: <TextSpan>[
      TextSpan(
        text: title,
        style: labelTextStyle,
      ),
      if (title != 'Assign Task')
        TextSpan(text: ' *', style: labelMandatoryTextStyle)
    ]));
  }

  getTaskDescriptionWidget(context) {
    return Container(
      width: getScreenWidth(context) - 10,
      padding: const EdgeInsets.only(top: 20, bottom: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getTitleWidget(
            'Task Description',
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 150,
            child: TextField(
              readOnly: true,
              decoration: getToDoInputDecoration(
                  context, 'Task Description Goes Here', 10.0),
              maxLines: 6,
            ),
          )
        ],
      ),
    );
  }

  getCardsListWidget(title, bool isPanels) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  getTitleWidget(title),
                  SizedBox(
                    height: 40,
                    width: 125,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 5),
                      child: ListView(
                        children: <Widget>[getCardWidget(isPanels)],
                      ),
                    ),
                  )
                ])));
  }

  getCardWidget(bool isPanels) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      constraints: BoxConstraints(
        minHeight: 30,
        maxHeight: 40,
        maxWidth: 250,
        minWidth: 80,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: BLACK.withOpacity(0.15),
            offset: Offset(5, 0),
            blurRadius: 2,
            spreadRadius: 0,
          )
        ],
      ),
      child: FlatButton(
        onPressed: () => {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: DARK_GREY, width: 1),
        ),
        color: isPanels ? BLUE : RED,
        child: Text(
          isPanels ? 'In Process' : 'Critical',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w700,
              color: WHITE,
              fontFamily: 'Montserrat'),
        ),
      ),
    );
  }

  Widget getStartEndDateWidget(context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 10),
      width: getScreenWidth(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //Start Date
          Container(
              width: (getScreenWidth(context) / 2) - 20,
              child: getDateFieldWithTitle('Start Date', 'Pick Date', context)),
          //End Date
          Container(
              margin: EdgeInsets.only(left: 10),
              width: (getScreenWidth(context) / 2) - 20,
              child: getDateFieldWithTitle('End Date', 'Pick Date', context)),
        ],
      ),
    );
  }

  Widget getDateFieldWithTitle(String title, String hintText, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        getTitleWidget(title),
        DateWidget(
          enabled: false,
          hintText: hintText,
          dateInputDecoration: getDateDecoration(context, hintText),
        )
      ],
    );
  }
}
