import 'package:templets/Temp_2/Screens_temp2/todo_screens/TodoUtilsTemp2.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBars.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InprocessScreen2 extends StatelessWidget {
  static const routeName = '/InprocessScreen';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: GREY,
        appBar: Template2AppBars(
          onTap: () {},
          screenName: 'In Process',
          appBarType: Template2AppBarType.secendary,
        ),
        body: Column(
          children: <Widget>[
            getTasksCountWidget(context),
            Expanded(
              child: getTasksListWidget(context),
            )
          ],
        ),
      ),
    );
  }

  getTasksCountWidget(context) {
    return Container(
      height: 70,
      width: getScreenWidth(context),
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: Light_Grey, width: 0),
          ),
          child: Container(
            margin: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Task Pending',
                  style: toDoTitleStyle,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: 30,
                  height: 30,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '2',
                      style: normalWhiteBoldedTextStyle,
                    ),
                  ),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: BLUE),
                )
              ],
            ),
          )),
    );
  }

  Widget getTasksListWidget(context) {
    return ListView(
        children: <Widget>[Container(child: getTaskWidget(context))]);
  }

  Widget getTaskWidget(context) {
    return Container(
      height: 130,
      width: getScreenWidth(context),
      margin: EdgeInsets.fromLTRB(8, 10, 8, 0),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: Light_Grey, width: 0),
          ),
          child: Container(
            margin: EdgeInsets.all(15),
            child: Column(children: [
              getTaskNameWidget(context),
              Container(
                height: 36,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(),
//                      getAssignedMembersWidget(task, context),
                    getTaskEndDateWidget(context)
                  ],
                ),
              ),
              Spacer(),
              getTaskDescriptionWidget(),
            ]),
          )),
    );
  }

  getTaskEndDateWidget(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: getScreenWidth(context) / 2 - 40,
      child: Row(
        children: <Widget>[
          Icon(
            FontAwesomeIcons.calendarAlt,
            color: LIGHT_GREEN,
          ),
          SizedBox(width: 5),
          Text(
            '1-1-2022',
            style: TextStyle(
                fontSize: 14.0, color: LIGHT_GREEN, fontFamily: 'Montserrat'),
          )
        ],
      ),
    );
  }

  Widget getTaskNameWidget(context) {
    return Container(
        height: 35,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Text(
                'Task Name',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: BLACK,
                    fontFamily: 'Montserrat'),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: <Widget>[
                IconButton(icon: pickUpIconWidget(), onPressed: () {}),
                Container(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                        icon: Image.asset(IC_INCOMPLETE_TASK),
                        onPressed: () => {})),
              ],
            )
          ],
        ));
  }

  Widget pickUpIconWidget() {
    return Icon(
      Icons.people,
      size: 20,
      color: Main_Green,
    );
  }

  Widget getTaskDescriptionWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Flexible(
          child: Text(
            'Task Description   ',
            style: TextStyle(
                fontSize: 14.0, color: BLACK, fontFamily: 'Montserrat'),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
