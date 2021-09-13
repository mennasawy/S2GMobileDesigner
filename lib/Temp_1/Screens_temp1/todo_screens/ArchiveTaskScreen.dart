import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/TextUDAsPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/BasicTextInputUDA.dart';
import 'package:templets/Temp_2/Screens_temp2/todo_screens/ArchiveTaskScreen.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Utilities/WidgetsUtilites/DateWidget.dart';
import 'package:templets/Utilities/WidgetsUtilites/FontUtils.dart';
import 'package:templets/Utilities/WidgetsUtilites/RaisedButtonWidget.dart';
import 'package:templets/Utilities/WidgetsUtilites/buildTextFieldMethods.dart';
import 'package:flutter/material.dart';
import 'package:templets/dropdownfield.dart';

class DoneTaskScreen extends StatefulWidget {
  static const routeName = '/DoneTaskScreen1';
  @override
  _DoneTaskScreenState createState() => _DoneTaskScreenState();
}

class _DoneTaskScreenState extends State<DoneTaskScreen> {
  List<TasksTab> tabs = [
    TasksTab('Task Details', true),
    TasksTab('Main Info', false)
  ];
  int taskSelect = -1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: WHITE,
            leading: InkWell(
              onTap: () {},
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black54,
              ),
            ),
            title: const Text('Task Completed',
                style: TextStyle(
                    fontFamily: 'Tahoma',
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700)),
          ),
          body: OpenTask(context)),
    );
  }

  Widget OpenTask(context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          SizedBox(height: 10),
          getTabsWidget(),
          tabs[0].selected
              ? Expanded(
                  child: SingleChildScrollView(
                      padding: EdgeInsetsDirectional.only(start: 5.0),
                      child: Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        BasicTextInputUDA(
                          inputType: InputType.number,
                          title: 'Working Hours',
                          isMandatory: true,
                          isVisible: true,
                          isReadOnly: true,
                          inputDecoration: buildInputDecorations(context, 'hh',
                              false, IC_TEXT_FIELD_CHECK, null, null),
                          inputHint: 'hh',
                        ),
                        getSubmissionActionWidget(),
                        SizedBox(
                          height: 20,
                        ),
                        completeButtonWidget(),
                      ])),
                )
              : getTaskMainInfoWidget()
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
            color: BLACK.withOpacity(0.15),
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
      ),
    );
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

  getTaskMainInfoWidget() {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: <Widget>[
            getTaskNameWidget(),
            getTaskDescriptionWidget(),
            getStartEndDateWidget(),
            getActualStart_FinishDateWidget(),
            SizedBox(
              height: 15,
            ),
            completeButtonWidget()
          ],
        ));
  }

  getTaskNameWidget() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(top: 20, bottom: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            getTitleWidget('text_task_name'),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 40,
              child: TextFormField(
                initialValue: 'task name',
                readOnly: true,
                decoration:
                    getInputDecoration(context, '', '', null, null, null),
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

  getTaskDescriptionWidget() {
    return Container(
      width: getScreenWidth(context) - 10,
      padding: const EdgeInsets.only(top: 20, bottom: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getTitleWidget(
            'task_description',
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 150,
            child: TextFormField(
              initialValue: 'task description',
              readOnly: true,
              decoration: getInputDecoration(context, '', '', null, null, null),
              maxLines: 6,
            ),
          )
        ],
      ),
    );
  }

  Widget getStartEndDateWidget() {
    return Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 10),
      width: getScreenWidth(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //Start Date
          Container(
              width: (getScreenWidth(context) / 2) - 50,
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

  Widget getActualStart_FinishDateWidget() {
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

  completeButtonWidget() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: NTGButton(buttonText: 'Task Completed', onPressedButton: () {}));
  }

  getSubmissionActionWidget() {
    return Column(
      children: <Widget>[
        getDropDownFieldWithTitle('Submission Action', 'Select Option'),
      ],
    );
  }

  Widget getDropDownFieldWithTitle(String title, String hintText) {
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
