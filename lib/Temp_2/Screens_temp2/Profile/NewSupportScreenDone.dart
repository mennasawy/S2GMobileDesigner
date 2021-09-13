// import 'package:Smart2Go/local/LocalizationFile.dart';
import 'package:flutter/material.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBars.dart';
import 'ContactUsNewScreenDone.dart';

class SupportScreen extends StatefulWidget {
  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: SafeArea(
        child: Scaffold(
          appBar: Template2AppBars(
            screenName: "support",
            appBarType: Template2AppBarType.main,
          ),
          backgroundColor: Colors.grey[50],
          // Color.fromRGBO(235, 239, 245, 1),
          body: Container(
            height: (MediaQuery.of(context).size.height -
                    (MediaQuery.of(context).padding.top -
                        kToolbarHeight -
                        kBottomNavigationBarHeight)) *
                0.9,
            child: ListView(
              children: [
                buttons(context),
              ],
            ),
          ),
//          bottomNavigationBar: BottomNavigatioBarWidget(
//            context: context,
//            screenType: ScreenType.support,
//          ),

          // floatingActionButton: BottomBarFloatingbutton(),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }

  Container buttons(BuildContext context) {
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              child: Row(
                children: [
                  Expanded(
                    child: FlatButton(
//                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Text(
                        "FAQ",
                        // AppLocalizations.of(context).translate('fqa'),
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(
                                color: Colors.black45,
                                width: 2,
                                style: BorderStyle.solid))),
                  ),
                  Expanded(
                    child: FlatButton(
//                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Text(
                        'Contact Us',
                        // AppLocalizations.of(context)
                        // .translate('contact_us'),
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            ),
            ContactUsNewSCreen()
          ]),
    );
  }

  AppBar appBarWidget(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Support',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
//      toolbarHeight: getScreenHeight(context) * 0.13,
      actions: [
        Icon(
          Icons.notifications,
          color: Colors.blueAccent[100],
          size: 50,
        ),
        Icon(
          Icons.person,
          color: Colors.blueAccent[100],
          size: 50,
        ),
      ],
    );
  }
}
