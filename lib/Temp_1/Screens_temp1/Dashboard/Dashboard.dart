import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBarTemplate1/NTGAppBar.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'DashboardWidgetUtils.dart';
import 'charts/drawGridChart.dart';
import 'charts/drawPieChart.dart';

class Dashboard extends StatefulWidget {
  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: NTGAppBar(
          pageName: "dashboard",
          appBarType: AppBarType.appBarWithMenu,
          appBarActions: notificationIcon(context)),
      resizeToAvoidBottomInset: false,
      backgroundColor: WHITE,
      body: WillPopScope(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: DashboardScreenBody(),
          ),
        ),
      ),
    ));
  }

  Widget DashboardScreenBody() {
    return Column(
      children: <Widget>[
        getDashboardTaps(),
        SizedBox(
          height: 5,
        ),
        myToDoListWidget(context),
        SizedBox(
          height: 20,
        ),
        // build counter grid
        buildGridCounter(context),
        //SimpleBarChart(),
        DashboardBody(),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget DashboardBody() {
    return chartsListWidget();
  }

  Widget chartsListWidget() {
    return ListView.builder(
        controller: scrollControllerChartsList,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 9.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CounterChartUDA(),
                Container(
//                  height: getScreenHeight(context) * 0.65, //600
                  constraints: BoxConstraints(
                    minHeight: 200,
                    maxHeight: 470,
                  ),
                  width: getScreenWidth(context),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 15.0, //8
                        spreadRadius: 0.0, //5
                        offset: Offset(1, 1), //0.1
                      ),
                    ],
                  ),
                  child: drawPieChart(
                    listRowItems: listRowItemsWidget,
                    chartTitle: "pie chart",
                  ),
                ),
                GridChart()
              ],
            ),
          );
        });
  }

  Widget notificationIcon(context) {
    return GestureDetector(
        child: Align(
      alignment: Alignment.topCenter,
      child: Image.asset(
        IC_NOTIFICATION_IN_ACTIVE,
        fit: BoxFit.cover,
      ),
    ));
  }

  Widget myToDoListWidget(BuildContext context) {
    return Container(
        height: getScreenHeight(context) * 0.14, //0.18
        decoration: getStickyNotesContainerDecoration(),
        child: Center(
            child: ListTile(
          leading: iconMyTaskWidget(context),
          title: Text(
            "1",
//                toDoListLength == null ? '' : '$toDoListLength',
          ),
          subtitle: Text(
            "my sticky notes",
          ),
          trailing: iconMyTaskTrailingWidget(context),
        )));
  }

  BoxDecoration getStickyNotesContainerDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.topLeft,
        colors: [Light_Yellow_Right, Light_Yellow_Left],
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          blurRadius: 15.0, //8
          spreadRadius: 0.0, //5
          offset: Offset(0, 0.75), //0.1
        )
      ],
    );
  }

  Widget iconMyTaskWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Image.asset(
        IC_MY_TASKS_TODO,
        height: getScreenHeight(context) * 0.12,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget iconMyTaskTrailingWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Image.asset(
        IC_MY_TASKS_TOMORROW,
        height: getScreenHeight(context) * 0.17,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget getDashboardTaps() {
    return Container(
      height: 45,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: dashboardCardDetails(),
              );
            }),
      ),
    );
  }

  dashboardCardDetails() {
    return Container(
      width: 160,
      height: 45,
      child: Card(
        color: WHITE,
        child: Center(
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                "tap",
              )),
        ),
        elevation: 5,
      ),
    );
  }

  Widget CounterChartUDA() {
    return InkWell(
      onTap: () {}, // () => _selectedChart(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: getScreenHeight(context) * 0.17,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: counterChartDetailsData(),
      ),
    );
  }

  Widget counterChartDetailsData() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "counter chart uda",
            style: Theme.of(context)
                .textTheme
                .title, // TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Row(
              //  crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 15.0, bottom: 10),
                  child: CircleAvatar(
                    backgroundColor: TRANSPARENT,
//                    radius: 34,
                    child: Icon(
                      Icons.home,
                      size: 30,
                    ), // FaIcon(FontAwesomeIcons.gamepad),
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '10',
                      style: normalBoldedTextStyle,
                    ),
                    Text(
                      "sub title",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                // SizedBox(
                //   width: 30,
                // ),
              ],
            ),
          ),
        ]);
  }
}
