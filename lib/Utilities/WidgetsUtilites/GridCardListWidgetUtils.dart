import 'package:flutter/material.dart';

import '../app_constants.dart';
import 'AppBars/AppBarTemplate1/NTGAppBar.dart';

enum GridType {
  drillDown,
  gridChart,
}

class DrawGridList extends StatefulWidget {
  @override
  _DrawGridListState createState() => _DrawGridListState();
}

class _DrawGridListState extends State<DrawGridList> {
  List<String> getColmnCaptionList = ["name", "age"];
  List<String> values = ["ahmed", "10"];

  @override
  Widget build(BuildContext context) {
    return gridListWidget();
  }

  Widget gridListWidget() {
    return SafeArea(
      child: Scaffold(
          appBar: NTGAppBar(
            pageName: "chart details",
            appBarType: AppBarType.appBarWithClose,
          ),
          body: drawDataTable()),
    );
  }

  Widget drawDataTable() {
//    var chartObject = widget.chart.objects;
//    var width = chartObject.first.columnsSize.first.toDouble();
    return SingleChildScrollView(
      controller: ScrollController(),
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        controller: ScrollController(),
        scrollDirection: Axis.horizontal,
        child: DataTable(
            horizontalMargin: 6.0,
            columnSpacing: 10.0,
            headingRowHeight: 30.0,
            dataRowHeight: 50.0,
            columns: [
              ...getColmnCaptionList
                  .map((e) => DataColumn(
                        label: Container(
                            width: 100,
                            child: Text(
                              e,
                            )),
                      ))
                  .toList()
            ],
            rows: getColmnCaptionList
                .map(
                  (row) => DataRow(cells: [
                    ...values
                        .map((cellValue) => DataCell(
                              Container(
                                width: 75,
                                height: 50,
//          margin: EdgeInsets.only(top: 10),
                                child: Center(
                                  child: RichText(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    textAlign: TextAlign.center,
                                    strutStyle: StrutStyle(fontSize: 12.0),
                                    text: TextSpan(
                                        style: TextStyle(
                                          color: BLACK,
                                        ),
                                        text: cellValue.toString()),
                                  ),
                                ),
                              ),
//                        onTap: () => _showPopupDetails(
//                            context, cellValue.value.toString())),
                            ))
                        .toList(),
                  ]),
                )
                .toList()),
      ),
    );
  }
}
