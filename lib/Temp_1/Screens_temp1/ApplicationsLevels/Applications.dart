import 'package:flutter/material.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBarTemplate1/NTGAppBar.dart';
import 'package:templets/Utilities/app_constants.dart';

class Applications extends StatefulWidget {
  @override
  _ApplicationsState createState() => _ApplicationsState();
}

class _ApplicationsState extends State<Applications> {
  List<Widget> appsWidget = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getAppsWidget();

    return SafeArea(
        child: Scaffold(
      backgroundColor: WHITE,
      appBar: NTGAppBar(
        pageName: "application",
        appBarType: AppBarType.appBarWithMenu,
      ),
      //MenuAppBar(pageName: "Applications"),
      body: WillPopScope(
          child: ListView(
        children: <Widget>[
          SizedBox(height: 35),
          Column(
            children: <Widget>[for (var row in appsWidget) row],
          )
        ],
      )),
    ));
  }

  // card
  Decoration cardDecoration(appColor) {
    return BoxDecoration(
      color: appColor,
      borderRadius: BorderRadius.circular(10),
      border: Border(
        top: BorderSide(width: 2, color: Light_Grey, style: BorderStyle.solid),
        bottom: BorderSide(width: 2, color: Light_Grey),
        left: BorderSide(width: 2, color: Light_Grey),
        right: BorderSide(width: 2, color: Light_Grey),
//        right: BorderSide(width: 2, color: Light_Grey.withOpacity(0.6)),
      ),
//      ],
    );
  }

  BorderSide getBorderSide() {
    return BorderSide(width: 2, color: Light_Grey, style: BorderStyle.solid);
  }

  Widget appCard() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      width: MediaQuery.of(context).size.width / 2 - 5,
      height: MediaQuery.of(context).size.width / 2 - 5,
      child: RaisedButton(
        //have to add theme.............important
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: getBorderSide(),
        ),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            appImage(),
            Expanded(flex: 1, child: appNameWidget("APPLICATION NAME"))
          ],
        ),
      ),
    );
  }

  Expanded appImage() {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: Icon(
          Icons.home,
          color: Colors.blue,
          size: MediaQuery.of(context).size.height * 0.18,
        ),
      ),
    );
  }

  Widget appNameWidget(String appName) {
    return Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.4),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
            appName,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.w400, color: BLACK),
          ),
        ));
  }

  getAppsWidget() {
    appsWidget = [];
    Widget singleCard = Row(
      children: <Widget>[
        appCard(),
      ],
    );
    appsWidget.add(Column(
      children: <Widget>[
        singleCard,
        SizedBox(
          height: 10,
        ),
      ],
    ));
  }
}
