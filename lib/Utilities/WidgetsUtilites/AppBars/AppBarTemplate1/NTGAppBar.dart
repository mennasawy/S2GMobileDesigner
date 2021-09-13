import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Utilities/WidgetsUtilites/FontUtils.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

enum AppBarType {
  appBarWithBack,
  appBarWithMenu,
  appBarWithClose,
}

class NTGAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String pageName;
  final Color appBarColor;
  final Color titleColor;
  final String menuIconImage;
  final AppBarType appBarType;
  final Widget appBarBottom;
  final Widget appBarActions;
  @override
  final Size preferredSize;

  NTGAppBar({
    Key key,
    this.pageName,
    this.appBarColor,
    this.titleColor,
    this.menuIconImage,
    this.appBarType,
    this.appBarBottom,
    this.appBarActions,
  }) : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      child: AppBar(
        title: Text(pageName ?? '',
            style: FontUtils.subtitleTextStyle(
              BLACK,
            ) //titleColor == WHITE ? whiteTitlesTextStyle : titlesTextStyle,
            ),
        titleSpacing: appBarType == AppBarType.appBarWithBack
            ? 0
            : NavigationToolbar.kMiddleSpacing,
        automaticallyImplyLeading: appBarType == AppBarType.appBarWithBack,
        elevation: 0,
        centerTitle: false,
        backgroundColor: WHITE,
        leading:
            appBarType == AppBarType.appBarWithBack ? backIcon(context) : null,
        actions: <Widget>[
          drawWidgetOrEmptyContainer(
              appBarActions != null,
              Padding(
                padding: EdgeInsets.all(10),
                child: appBarActions,
              )),
          drawWidgetOrEmptyContainer(
              appBarType == AppBarType.appBarWithMenu, menuIcon(context)),
          drawWidgetOrEmptyContainer(
              appBarType == AppBarType.appBarWithClose, closeIcon(context)),
        ],
        bottom: appBarBottom,
      ),
    );
  }

  Widget backIcon(context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        // padding: EdgeInsets.only(left: 20.0,top: 0.0,right: 20.0,bottom: 0.0),
        child: Align(
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: BLACK,
            ),
            iconSize: 30,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ));
  }

  Widget menuIcon(context) {
    return GestureDetector(
        // onTap: () => Navigator.of(context).push(createAnimatedRoute()),
        child: Padding(
      padding: EdgeInsets.all(19),
      child: Icon(Icons.phone_iphone),
    ));
  }

  Widget closeIcon(context) {
    return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: EdgeInsets.all(19.0),
          child: Icon(Icons.phone_iphone),
        ));
  }
}
