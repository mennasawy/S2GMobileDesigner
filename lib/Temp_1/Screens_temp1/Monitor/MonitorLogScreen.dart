import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBarTemplate1/NTGAppBar.dart';
import 'package:templets/Utilities/app_constants.dart';

class Log extends StatefulWidget {
  @override
  LogState createState() => LogState();
}

class LogState extends State<Log> {
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: WHITE,
          appBar: NTGAppBar(
            appBarType: AppBarType.appBarWithClose,
            pageName: "log",
          ),
          body: body()),
    );
  }

  body() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[recordLogsListWidget()],
      ),
    );
  }

  recordLogsListWidget() {
    return Container(
      constraints: BoxConstraints(minHeight: 20.0, maxHeight: 80),
      decoration: getBoxDecorationWidget(),
//        height: getScreenHeight(context)*0.7,
      child: ListView.separated(
        itemCount: 1,
        scrollDirection: Axis.vertical,
        controller: _scrollController,
        separatorBuilder: (BuildContext context, int index) => Divider(
          thickness: 1,
//          indent: 15,
//          endIndent: 15,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward_ios),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'action by',
                    style: normalTextStyle,
                  ),
                  Text(
                    '11/1',
                    style: normalTextStyle,
                  ) //
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FittedBox(
                    child: Text(
                      "admin",
                      style: normalBoldedTextStyle,
                    ),
                  ),
                  Text(
                    '12/2',
                    style: normalTextStyle,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  BoxDecoration getBoxDecorationWidget() {
    var b = BorderSide(
      color: Colors.grey,
    );
    return BoxDecoration(
      borderRadius: BorderRadius.circular(5.0),
//              color: GREY,
      border: Border(
        top: b,
        left: BorderSide(
          color: Colors.grey,
        ),
        right: BorderSide(
          color: Colors.grey,
        ),
        bottom: BorderSide(
          color: Colors.grey,
        ),
      ),
    );
  }
}
