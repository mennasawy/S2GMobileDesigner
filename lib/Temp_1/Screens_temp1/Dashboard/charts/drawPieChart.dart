import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:templets/Utilities/app_constants.dart';

class drawPieChart extends StatefulWidget {
  final String chartTitle;
  final Function listRowItems;

  drawPieChart({this.listRowItems, this.chartTitle});

  @override
  _drawPieChartState createState() => _drawPieChartState();
}

class _drawPieChartState extends State<drawPieChart> {
  @override
  Widget build(BuildContext context) {
    return drawPieChartWidget();
  }

  Widget drawPieChartWidget() {
    Map<String, double> dataMap = {
      "Flutter": 5,
      "React": 3,
      "Xamarin": 2,
      "Ionic": 2,
    };
    List<Color> colorList = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
    ];

    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 15, bottom: 10),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(
                      // AppLocalizations.of(context).translate('dashboard_MyTaskAnalysis'),
                      "pie chart", ///////chartsListGETob
                      style: normalBoldedTextStyle),
                ),
                GestureDetector(
                  onTap: () {},
                  child: new PieChart(
                    dataMap: dataMap,
                    animationDuration: Duration(milliseconds: 800),
                    chartRadius:
                        MediaQuery.of(context).size.width * 0.7, // /1.7
                    showChartValuesInPercentage: true,
                    showChartValues: true,
                    chartValueBackgroundColor: Colors.grey[200],
                    colorList: colorList,
                    showLegends: false,
                    decimalPlaces: 1,
                    chartValueStyle: styleDashboard,
                  ),
                ),
                SizedBox(
                  height: 5.0, //20
                ),
                Expanded(
                  flex: 2,
                  child: widget.listRowItems(context),
                ),

//            SizedBox(
//              height: 5.0, //20
//            ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
