import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Utilities/WidgetsUtilites/FontUtils.dart';
import 'package:templets/Utilities/app_constants.dart';

class Template2AppBars extends StatefulWidget implements PreferredSizeWidget {
  final Template2AppBarType appBarType;
  final String screenName;
  final String appBarBottomTitle;
  final Function onTap;
  final Widget buttomWidget;
  final double appBarButtomHeight;
  @override
  final Size preferredSize;

  Template2AppBars(
      {Key key,
      this.appBarType,
      this.screenName,
      this.buttomWidget,
      this.appBarButtomHeight,
      this.onTap,
      this.appBarBottomTitle})
      : preferredSize = Size.fromHeight(appBarButtomHeight ?? kToolbarHeight);

  @override
  _Template2AppBarsState createState() => _Template2AppBarsState();
}

enum Template2AppBarType { main, secendary }

class _Template2AppBarsState extends State<Template2AppBars> {
  String _profileImageURL;
  bool isNewNotificationGet;
  TabController _tabController;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Container(
//      height: 70,
      child: getAppBar(widget.appBarType),
    );
  }

  AppBar getAppBar(Template2AppBarType type) {
    switch (type) {
      case Template2AppBarType.main:
        return mainAppBar();
      case Template2AppBarType.secendary:
        return secandaryAppBar();
    }
  }

  AppBar mainAppBar() {
    return AppBar(
      backgroundColor: WHITE,
      shape: Border(bottom: BorderSide(color: GREY, width: 1)),
      leading: menuIcon(),
      title: Text(
        widget.screenName ?? " ",
        style: FontUtils.subtitleTextStyle(
          BLACK,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      titleSpacing: 0,
      centerTitle: false,
      actions: <Widget>[
        NotificationIcon(),
        ProfileImageIcon(),
      ],
      elevation: 1,
      bottom: widget.buttomWidget != null
          ? PreferredSize(
              child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: widget.buttomWidget,
            ))
          : null,
    );
  }

  AppBar secandaryAppBar() {
    return AppBar(
      backgroundColor: WHITE,
      shape: Border(bottom: BorderSide(color: GREY, width: 1)),
      iconTheme: IconThemeData(
        color: BLACK, //change your color here
      ),
      elevation: 1,
      titleSpacing: 0,
      centerTitle: false,
      title: Text(
        widget.screenName ?? " ",
        style: FontUtils.titleTextStyle(BLACK),
        overflow: TextOverflow.ellipsis,
      ),
      leading: GestureDetector(
          onTap: widget.onTap ?? () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back_ios)),
    );
  }

  Widget menuIcon() {
    return GestureDetector(
        onTap: widget.onTap,
//        onTap: () => Navigator.of(context).push(createAnimatedRoute()),
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 16, 13, 16),
          child: Image.asset(
            TEMP2_IC_MENU,
            fit: BoxFit.fill,
            width: 15,
            height: 15,
          ),
        ));
  }

  Widget NotificationIcon() {
    return GestureDetector(
        onTap: () => null,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(3, 12, 5, 12),
          child: Image.asset(
            TEMP2_IC_NOTIFICATION_SEEN_2,
            fit: BoxFit.cover,
          ),
        ));
  }

  Widget ProfileImageIcon() {
    return GestureDetector(
      onTap: () => null,
      child: Container(
        margin: EdgeInsets.fromLTRB(4, 4, 12, 6),
        child: CircleAvatar(
          backgroundColor: WHITE,
          radius: 23,
          child: Container(),
        ),
      ),
    );
  }

  Route openAnimatedRoute(Widget routeWidget) {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 600),
      pageBuilder: (context, animation, secondaryAnimation) => routeWidget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0, 1);
        var end = Offset.zero;
        var curve = Curves.easeIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
