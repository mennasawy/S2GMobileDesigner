import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'counterItem.dart';

ScrollController scrollControllerChartsList = ScrollController();
ScrollController listRowsItem = ScrollController();

Widget buildGridCounter(BuildContext context) {
  return GridView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: 1,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 1.9),
      ),
      itemBuilder: (BuildContext context, int index) {
        return new Card(
            elevation: 5,
            margin: EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: new CounterItem());
      });
}

Widget listRowItemsWidget(
  BuildContext context,
) {
  return Container(
    padding: EdgeInsets.only(left: 10, right: 10),
    width: getScreenWidth(context),
    height: 80,
    child: ListView.builder(
        controller: listRowsItem,
        scrollDirection: Axis.vertical,
        //        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Container(
//                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 10.0,
                          height: 10.0,
                          decoration: new BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                        ),
                        SizedBox(
                          width: 7, //20
                        ),
                        Text(
                          "data",
                          style: normalTextStyle,
                        ),
                        SizedBox(
                          width: 7, //20
                        ),
                        Text(
                          '100 %',
                          style: labelTextStyle,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
  );
}

//Widget listRowItemsWidget(
//    BuildContext context,
//    List<ChartObject> ChartsObjectsList,
//    ChartModel chart,
//    ChartUDAType chartType,
//    Function drillDownAction) {
//  return Container(
//    padding: EdgeInsets.only(left: 10, right: 10),
//    width: getScreenWidth(context),
//    height: 70,
//    child: ListView.builder(
//        controller: listRowsItem,
//        scrollDirection: Axis.horizontal,
//        shrinkWrap: true,
//        itemCount: ChartsObjectsList.length,
//        itemBuilder: (BuildContext context, int index) {
//          return GestureDetector(
//            onTap: ((chartType == ChartUDAType.pieCart ||
//                chartType == ChartUDAType.radarChart) &&
//                chart.drillDown == true)
//                ? () {
//              drillDownAction(chart, "", index);
//            }
//                : () {},
//            child: Container(
//              padding: EdgeInsets.all(5),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.start,
//                children: <Widget>[
//                  new Container(
////                    width: 150,
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      children: <Widget>[
//                        Container(
//                          width: 10.0,
//                          height: 10.0,
//                          decoration: new BoxDecoration(
//                              color:
//                              colorConvert(ChartsObjectsList[index].color),
//                              shape: BoxShape.circle),
//                        ),
////                        SizedBox(
////                          width: 15, //20
////                        ),
//                        Text(
//                          ChartsObjectsList[index].label ?? "",
//                          style: labelTextStyle,
//                        ),
//                        SizedBox(
//                          width: 6, //20
//                        ),
//                        percentageItemConvert(
//                            ChartsObjectsList[index].percentage),
//                      ],
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          );
//        }),
//  );
//}
Widget percentageItemConvert(double percentage) {
  double per = double.parse(percentage.toStringAsFixed(2));
  return Text(
    '($per' + '%)',
    style: labelTextStyle,
  );
}

//TextStyle getDahboardTabTitleTextStyle(DashboardFreeModuleTaps tab) {
//  return (tab.isTabSelected != null && tab.isTabSelected)
//      ? selectedStyle
//      : unselectedStyle;
//}

TextStyle unselectedStyle =
    TextStyle(color: DARK_GREY, fontFamily: 'SF Pro Text');
TextStyle selectedStyle = TextStyle(
    color: BLACK, fontFamily: 'SF Pro Text', fontWeight: FontWeight.w700);
