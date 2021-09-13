import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/Dashboard/DashboardWidgetUtils.dart';
import 'package:templets/Temp_1/Screens_temp1/Dashboard/charts/drawGridChart.dart';
import 'package:templets/Temp_1/Screens_temp1/Dashboard/charts/drawPieChart.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBars.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/DecorationUtils.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/Temp2WidgetsWithBorder.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class DashboardScreen2 extends StatefulWidget {
  @override
  _DashboardScreen2State createState() => _DashboardScreen2State();
}

class _DashboardScreen2State extends State<DashboardScreen2> {
//  BottomBarManager bottomBarManager = new BottomBarManager();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
//  DashboardPresenter _presenter;
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: SafeArea(
        child: Scaffold(
          appBar: dashboardAppBar(),
          key: _scaffoldKey,
          backgroundColor: GREY,
          body: Stack(
            children: [DashboardScreenBody()],
          ),
        ),
      ),
    );
  }

  Widget dashboardAppBar() {
    return Template2AppBars(
      appBarType: Template2AppBarType.main,
      screenName: "dashboard",
//      appBarButtomHeight: getScreenHeight(context) * 0.215,
//      buttomWidget: appBarBottomWidget(),
//      onTap: (){AppDe},
    );
  }

  Widget appBarBottomWidget() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "user name",
            ),
            Row(
              children: <Widget>[
                Text("Let's be productive today", style: normalTextStyle),
                SizedBox(
                  width: 10,
                ),
                Image.asset(
                  IC_TODO_CALENDER,
                  width: 15,
                  height: 15,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.navigate_next),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget DashboardScreenBody() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: getScreenHeight(context),
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
//            DashboardTasksCard(),
            getTabsWidget(),
            SizedBox(
              height: 5,
            ),
            buildGridCounter(
              context,
            ),
            //SimpleBarChart(),
            DashboardBody(),
          ],
        ),
      ),
    );
  }

  Widget DashboardTasksCard() {
    return Center(
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.all(9),
//        width: getScreenWidth(context) * 0.87,
          height: getScreenHeight(context) * 0.12,
          decoration: drawContainerBorder(WHITE),
          child: ListTile(
            leading: Image.asset(
              IC_MY_TASKS_TODO,
              height: getScreenHeight(context) * 0.07,
              fit: BoxFit.fill,
            ),
            title: Text(
              "You've got",
              style: normalBoldedTextStyle,
            ),
            subtitle: Text(
              "0 Tasks today",
              style: normalTextStyle,
            ),
            trailing: Icon(Icons.navigate_next),
          ),
        ),
      ),
    );
  }

  Widget getTabsWidget() {
    return Container(
      height: 45,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: getDashboardTabViewCard(index),
//                onTap: () {
//                  _presenter.onDashboardTapSelected(index);
//                },
              );
            }),
      ),
    );
//    return Container(
//        height: 40,
//        child: ListView.builder(
//            itemCount: _presenter.dasboardTapsList.length,
//            scrollDirection: Axis.horizontal,
//            shrinkWrap: true,
//            physics: ScrollPhysics(),
//            itemBuilder: (BuildContext context, int index) {
//              return Container(
//                height: 40,
//                margin: EdgeInsets.only(left: 3, right: 3),
//                child: GestureDetector(
//                  onTap: () {
//                    _presenter.onDashboardTapSelected(index);
//                  },
//                  child: Card(
//                      shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(10.0),
//                        side: BorderSide(color: Light_Grey, width: 0),
//                      ),
//                      child: Container(
//                        margin: EdgeInsets.all(5),
//                        child: Row(
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            children: [
//                              Text(
//                                _presenter.dasboardTapsList[index].objectName,
//                                style: getDahboardTabTitleTextStyle(
//                                    _presenter.dasboardTapsList[index]),
//                              ),
//                              _presenter.dasboardTapsList[index]
//                                          .isTabSelected ==
//                                      true
//                                  ? Container(
//                                      margin: EdgeInsets.only(left: 5),
//                                      height: 8,
//                                      width: 8,
//                                      decoration: new BoxDecoration(
//                                        color: Colors.blue,
//                                        shape: BoxShape.circle,
//                                      ),
//                                    )
//                                  : Container()
//                            ]),
//                      )),
//                ),
//              );
//            }));
  }

  Container getDashboardTabViewCard(int index) {
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
          onPressed: (){},
//        minWidth: 80,
//        height: 40,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: DARK_GREY, width: 1),
          ),
          color: WHITE,
          child: Text(
            "TAP",
          ),
        ));
  }

  Widget DashboardBody() {
    return chartsWidget();
  }

  Widget chartsWidget() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
//              CounterChartUDA(),

              GridChart(),
              Container(
                padding: const EdgeInsets.all(9.0),
                child: Temp2WidgetBorder(
                  isMandatoryUDA: false,
                  title: "chart",
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: 200,
                      maxHeight: 470,
                    ),
                    child: drawPieChart(
                      listRowItems: listRowItemsWidget,
                      chartTitle: "pie chart",
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
