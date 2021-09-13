import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBars.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/DecorationUtils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TaskToDoScreen2 extends StatelessWidget {
  static const routeName = '/TaskToDoScreen';
  List<String> tabs = ['My Tasks', 'Delegated', 'My Team'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: GREY,
        appBar: Template2AppBars(
          screenName: 'Tasks',
          appBarType: Template2AppBarType.main,
        ),
        body: Container(
            margin: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                getSearchAndPanelsWidget(context),
                Expanded(
                  child: getTasksListWidget(context),
                ),
              ],
            )),
      ),
    );
  }

  getSearchAndPanelsWidget(context) {
    return Container(
        height: getScreenHeight(context) * 0.275,
        margin: EdgeInsets.fromLTRB(3, 0, 3, 0),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 50),
              height: getScreenHeight(context) * 0.065,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  searchTextFieldWidget(),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    BTN_ADD,
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                  height: getScreenHeight(context) * 0.21,
                  child: Column(children: <Widget>[
                    getTabsWidget(context),
                    panelCardsWidget(context),
                  ]),
                ),
              ],
            )
          ],
        ));
  }

  Widget searchTextFieldWidget() {
    return Expanded(
      child: Container(
        height: 48,
        child: TextField(
            readOnly: true,
            decoration: getTextFieldInputDecoration(
                isPrefixIcon: true, icon: Image.asset(IC_FILTER_2))),
      ),
    );
  }

  Widget getTabsWidget(context) {
    return Container(
        height: getScreenHeight(context) * 0.063,
        margin: EdgeInsets.only(top: 3),
        child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 40,
                width: getScreenWidth(context) / 3 - 9,
                margin: EdgeInsets.only(left: 3),
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Light_Grey, width: 0),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              tabs[index],
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: index == 0 ? BLACK : DARK_GREY,
                                  fontFamily: 'Montserrat'),
                            ),
                            index == 0
                                ? Container(
                                    margin: EdgeInsets.only(left: 5),
                                    height: 8,
                                    width: 8,
                                    decoration: new BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                    ),
                                  )
                                : Container()
                          ]),
                    )),
              );
            }));
  }

  panelCardsWidget(context) {
    return Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: buildPanelCards(context));
  }

  buildPanelCards(context) {
    return Container(
        width: getScreenWidth(context) * 0.25,
        height: getScreenWidth(context) * 0.25,
//          padding: const EdgeInsets.all(5),
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
            color: BLUE,
            border: Border.all(color: LITE_GREY, width: 2),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 4),
                    width: 25,
                    height: 17,
                    child: IconButton(
                        onPressed: () => {},
                        alignment: Alignment.topRight,
                        icon: Icon(
                          Icons.clear,
                          size: 17,
                          color: WHITE,
                        )),
                    alignment: Alignment.topRight,
                  )
                ],
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text('In Process \n        2',
                      style: TextStyle(
                          fontFamily: 'Tahoma',
                          color: BLACK,
                          fontWeight: FontWeight.w700,
                          fontSize: getScreenWidth(context) *
                              0.042)) //normalWhiteBoldedTextStyle,
                  ),
            ],
          ),
        ));
  }

  Widget getTasksListWidget(context) {
    return ListView(
        children: <Widget>[Container(child: getTaskWidget(context))]);
  }

  Widget getTaskWidget(context) {
    return Container(
      height: 130,
      width: getScreenWidth(context),
      margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
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
            color: RED,
          ),
          SizedBox(width: 5),
          Text(
            '1-1-2020',
            style:
                TextStyle(fontSize: 14.0, color: RED, fontFamily: 'Montserrat'),
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
