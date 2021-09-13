import 'package:flutter/material.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class GridChart extends StatefulWidget {
  @override
  _GridChartState createState() => _GridChartState();
}

class _GridChartState extends State<GridChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getScreenHeight(context) * 0.25,
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  "grid chart",
                  style: normalTextStyle,
                ),
              ),
              SizedBox(
                height: 5.0, //20
              ),
//          gridChartBody(),
              getGridChart()
            ],
          ),
        ],
      ),
    );
  }

  Widget getGridChart() {
    return Center(
      child: GestureDetector(
        child: Container(
            width: getScreenWidth(context) * 0.7,
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
                color: LITE_GREY.withOpacity(OPACITY),
                border: Border(
                    top: BorderSide(width: 3.0, color: GREY),
                    bottom: BorderSide(width: 3.0, color: GREY))),
            child: Column(
              children: <Widget>[
                Text(
                  "Tap here to see chart ..",
                  style: normalTextStyle,
                ),
                CircleAvatar(
                  backgroundColor: WHITE,
                  radius: 25,
                  child: Icon(
                    Icons.keyboard_tab,
                    color: BLUE,
                    size: 30,
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget gridChartBody() {
    return Container(
        decoration: BoxDecoration(
            color: LITE_GREY.withOpacity(OPACITY),
            border: Border(
                top: BorderSide(width: 3.0, color: GREY),
                bottom: BorderSide(width: 3.0, color: GREY))),
        child: drawGridListWidget());
  }

  Widget drawGridListWidget() {
//    return Padding(
//      padding: const EdgeInsets.all(8.0),
//      child: ListView.builder(
//          shrinkWrap: true,
//          physics: ScrollPhysics(),
//          itemCount: widget.gridChart.objects.length,
//          itemBuilder: (BuildContext context, int position) {
//            return Container(
//              width: getScreenWidth(context) * 0.7,
//              child: DrawGridList(
//                  position,
//                  widget.gridChart.objects[position].columnCaptions,
//                  [],
//                  GridType.gridChart,
//                  widget.gridChart.objects[position]),
//            );
//          }),
//    );
  }
}
