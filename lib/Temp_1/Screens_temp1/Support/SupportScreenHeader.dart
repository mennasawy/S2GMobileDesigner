import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'ContactUsScreen.dart';
import 'FAQScreen.dart';

class SupportScreenHeader extends StatefulWidget {
  @override
  _SupportScreenHeaderState createState() => _SupportScreenHeaderState();
}

class _SupportScreenHeaderState extends State<SupportScreenHeader> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Container(
//          height: getScreenHeight(context)*0.1,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.topLeft,
            colors: [Sky_blue, Lite_Sky_Blue],
          )),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            extendBodyBehindAppBar: true,
            appBar: settingsAppBar(),
//            NTGAppBar(appBarType: AppBarType.appBarWithMenu,appBarColor: Colors.transparent,appBarBottom: tabBarWidget(context) ,),
            body: WillPopScope(
              child: TabBarView(
                children: <Widget>[
                  tabBarBodyWidget("FQA"),
                  tabBarBodyWidget("contact us"), //contact us
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget settingsAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(170), //kToolbarHeight
      child: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Image.asset(BTN_MENU_WHITE),
            // onPressed: menuIconAction,
            // _onMenuClick
          ),
        ],
        leading: new Container(),
        bottom: tabBarWidget(context),
      ),
    );
  }

  Widget tabBarWidget(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(120), //kToolbarHeight
      child: Container(
        padding: new EdgeInsets.only(top: 5, bottom: 0.3),
        height: 120,
        child: TabBar(
          indicatorColor: Colors.white,
          labelStyle: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 22.0, color: Colors.white),
          unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 22.0,
              color: Colors.black12),
          labelPadding: new EdgeInsets.only(
              //         top: getScreenHeight(context) * 0.03,
              bottom: 10),
          // bottom:getScreenHeight(context) * 0.05),
          indicatorWeight: 4.0,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: <Widget>[
            Container(
//              padding: new EdgeInsets.only(top: 30),
//          height: getScreenHeight(context) * 0.30,
              height: 120,
              child: Tab(
                icon: Image.asset(
                  IC_FAQ,
                  height: 40,
                ),
                text: "FQA",
              ),
            ),
            Container(
              padding: new EdgeInsets.only(top: 10, bottom: 0.3),
              height: 120,
              child: Tab(
                icon: Image.asset(
                  IC_CONTACTUS,
                  height: 40,
                ),
                text: "contact us",
              ),
            ),
            //  ),
          ],
        ),
      ),
    );
    // );
  }

  Widget tabBarBodyWidget(String tabName) {
    return Container(
//        height: 50,
      margin: EdgeInsets.only(top: 200), // getScreenHeight(context)*0.30
      decoration: BoxDecoration(
        color: Colors.white, // white
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: (tabName == "contact us")
          ? ContactUsScreen()
          : FAQScreen(), ////contact us
    );
  }
}
