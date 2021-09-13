import 'package:flutter/material.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBarTemplate1/NTGAppBar.dart';
import 'package:templets/Utilities/app_constants.dart';

TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

class NotificationsScreen extends StatefulWidget {
  _NotificationsScreen createState() {
    return _NotificationsScreen();
  }
}

class _NotificationsScreen extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: NTGAppBar(
            pageName: "notification",
            appBarType: AppBarType.appBarWithBack,
          ),
          body: buildList(context)),
    );
  }

  Widget buildList(BuildContext context) {
    return ListView.builder(
      itemBuilder: _getListItemTile,
      itemCount: 2,
    );
  }

  Widget _getListItemTile(BuildContext context, int index) {
    return GestureDetector(
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 20.0, 0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  height: 15,
                                  width: 10,
                                  decoration: (index == 0)
                                      ? BoxDecoration(
                                          color: Colors.black,
                                          shape: BoxShape.circle,
                                        )
                                      : BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                        ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  height: 70,
                                  child: VerticalDivider(color: Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ))
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width - 50,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    "description",
                                    style: normalTextStyle,
                                  ),
//                                      child: Text.rich(
//                                        TextSpan(
//                                          children: <InlineSpan>[
//                                            TextSpan(
//                                                text: handleDescription(index),
//                                                style: normalTextStyle),
//                                          ],
//                                        ),
//                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 40),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      child: Text.rich(
                                        TextSpan(
                                          children: <InlineSpan>[
                                            TextSpan(
                                                text: "11.20",
                                                style: TextStyle(
                                                    fontFamily: 'SF Pro Text',
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.blue)),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
