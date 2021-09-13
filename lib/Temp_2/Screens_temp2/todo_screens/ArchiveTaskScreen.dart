import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/TextUDAsPresenter.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2BasicTextInputUDA.dart';
import 'package:templets/Temp_2/Screens_temp2/todo_screens/TodoUtilsTemp2.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBars.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Utilities/WidgetsUtilites/DateWidget.dart';
import 'package:templets/Utilities/WidgetsUtilites/FontUtils.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/BasicButton.dart';
import 'package:flutter/material.dart';
import 'package:templets/dropdownfield.dart';

class DoneTaskScreen2 extends StatefulWidget {
  static const routeName = '/DoneTaskScreen';
  @override
  _DoneTaskScreen2State createState() => _DoneTaskScreen2State();
}

class _DoneTaskScreen2State extends State<DoneTaskScreen2> {
  List<TasksTab> tabs = [
    TasksTab('Task Details', true),
    TasksTab('Main Info', false)
  ];
  int taskSelect = -1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: GREY,
          appBar: Template2AppBars(
            onTap: () {},
            screenName: 'Task Completed',
            appBarType: Template2AppBarType.secendary,
          ),
          body: OpenTask(context)),
    );
  }

  Widget OpenTask(context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          getTabsWidget(),
          tabs[0].selected
              ? Expanded(
                  child: SingleChildScrollView(
                      padding: EdgeInsetsDirectional.only(start: 5.0),
                      child: Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: getWorkingHoursWidget(
                              title: 'Working Hours',
                              hint: 'hh',
                              context: context),
                        ),
                        getSubmissionActionWidget(context),
                        SizedBox(
                          height: 10,
                        ),
                        completeButton(),
                      ])),
                )
              : getTaskMainInfoWidget(context)
        ],
      ),
    );
  }

  Widget getTabsWidget() {
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 5),
      height: 40,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: tabs.length,
            itemBuilder: (BuildContext context, int index) {
              return getTab(index);
            }),
      ),
    );
  }

  Widget getTab(int index) {
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
              color: Colors.black.withOpacity(0.15),
              offset: Offset(5, 0),
              blurRadius: 2,
              spreadRadius: 0,
            )
          ],
        ),
        child: FlatButton(
          onPressed: () => onSelectTab(index),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: DARK_GREY, width: 1),
          ),
          color: WHITE,
          child: Text(
            tabs[index].name,
            textAlign: TextAlign.center,
            style: getTabTitleTextStyle(index),
          ),
        ));
  }

  TextStyle getTabTitleTextStyle(int index) {
    return tabs[index].selected
        ? FontUtils.boldNormalTextStyle(Colors.black)
        : FontUtils.normalTextStyle(DARK_GREY);
  }

  onSelectTab(int index) {
    tabs.forEach((tab) {
      tab.selected = false;
    });
    tabs[index].selected = true;
    setState(() {});
  }

  getTaskMainInfoWidget(context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: <Widget>[
            getTaskNameWidget(context),
            getTaskDescriptionWidget(context),
            getStartEndDateWidget(context),
            getActualStart_FinishDateWidget(context),
            SizedBox(
              height: 15,
            ),
            completeButton()
          ],
        ));
  }

  getTaskNameWidget(context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: getScreenWidth(context) / 2,
        padding: const EdgeInsets.only(top: 20, bottom: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            getTitleWidget('Task Name'),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 40,
              child: TextFormField(
                initialValue: 'task name',
                readOnly: true,
                decoration: getToDoInputDecoration(context, '', 5.0),
              ),
            )
          ],
        ),
      ),
    );
  }

  getTitleWidget(String title) {
    return Text(
      title,
      style: labelTextStyle,
    );
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
            child: TextFormField(
              initialValue: 'task description',
              readOnly: true,
              decoration: getToDoInputDecoration(context, '', 10.0),
              maxLines: 6,
            ),
          )
        ],
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
              child: getDateFieldWithTitle('Start Date')),
          //End Date
          Container(
              margin: EdgeInsets.only(left: 10),
              width: (getScreenWidth(context) / 2) - 20,
              child: getDateFieldWithTitle('End Date')),
        ],
      ),
    );
  }

  Widget getActualStart_FinishDateWidget(context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 10),
      width: getScreenWidth(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //Start Date
          Container(
              width: (getScreenWidth(context) / 2) - 50,
              child: getDateFieldWithTitle('Actual Start Date')),
          //End Date
          Container(
              margin: EdgeInsets.only(left: 10),
              width: (getScreenWidth(context) / 2) - 20,
              child: getDateFieldWithTitle('Finish Date')),
        ],
      ),
    );
  }

  Widget getDateFieldWithTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        getTitleWidget(title),
        Container(
            margin: EdgeInsets.only(top: 10),
            child: DateWidget(
              enabled: false,
              hintText: '',
//              dateInputDecoration: getDateDecoration(context, ''),
            ))
      ],
    );
  }

  Align completeButton() {
    return Align(
      alignment: Alignment.bottomRight,
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(15),
        child: BasicButton(
            buttonHeight: 45,
            buttonWidth: 200,
            buttonText: 'Task Completed',
            onPressedButton: () {}),
      ),
    );
  }

  SizedBox getWorkingHoursWidget({String title, String hint, context}) {
    return SizedBox(
      width: getScreenWidth(context) * 0.7,
      child: Temp2BasicTextInputUDA(
        inputType: InputType.number,
        title: title,
        isMandatory: true,
        isVisible: true,
        isReadOnly: true,
      ),
    );
  }

  InputDecoration getInputDecoration({String hint}) {
    OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Colors.black54,
      ),
    );
    return InputDecoration(
      focusedBorder: border,
      hintStyle: TextStyle(color: Colors.grey.shade500),
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      enabledBorder: border,
    );
  }

  getSubmissionActionWidget(context) {
    return Column(
      children: <Widget>[
        getDropDownFieldWithTitle(
            'Submission Action', 'Select Option', context),
      ],
    );
  }

  Widget getDropDownFieldWithTitle(String title, String hintText, context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
              text: title,
              style: labelTextStyle,
            ),
            TextSpan(text: ' *', style: labelMandatoryTextStyle)
          ])),
          SizedBox(
            height: 5,
          ),
          DropDownField(
            enabled: false,
            hintText: hintText,
            context: context,
            items: [],
            required: false,
          )
        ],
      ),
    );
  }
}

class TasksTab {
  String name;
  bool selected;

  TasksTab(this.name, this.selected);
}
