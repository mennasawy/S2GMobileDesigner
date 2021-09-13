import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:templets/Utilities/Temp2UtilMethods.dart';
import 'package:templets/Utilities/app_constants.dart';

import '../../utility_methods.dart';

class AppModulesCustomDrawer extends StatefulWidget {
  const AppModulesCustomDrawer({Key key}) : super(key: key);

  @override
  _AppModulesCustomDrawerState createState() => _AppModulesCustomDrawerState();
}

class _AppModulesCustomDrawerState extends State<AppModulesCustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Material(child: drawerWidget());
  }

  Drawer drawerWidget() {
    return Drawer(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
              child: appTitleHeaderWidget(),
              height: getScreenHeight(context) * 0.3),
          Expanded(
            child: allModulesWithScreensWidget(),
            // height: getScreenHeight(context) * 0.68
          ),
        ],
      ),
    ));
  }

  Column appTitleHeaderWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //App icon widget
        Container(
          decoration: shadedCircularDecoration(1, WHITE),
          margin: EdgeInsets.only(top: 20),
          child: CircleAvatar(
            radius: 50,
            child: ClipOval(
              child: Icon(Icons.home, size: 100),
            ),
            backgroundColor: GREY,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "name",
          style: normalTextStyle, //subtitleTextStyle(BLACK),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: getScreenHeight(context) * 0.02),
        Divider(
          indent: 50,
          endIndent: 50,
          height: 0,
          color: DARK_GREY,
        ),
      ],
    );
  }

  ListView allModulesWithScreensWidget() {
    return ListView.separated(
        itemCount: 2,
        separatorBuilder: (BuildContext context, int index) => Divider(
            height: 5,
            indent: getScreenWidth(context) * 0.1,
            endIndent: getScreenWidth(context) * 0.1,
            color: DARK_GREY),
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            child: singleModuleWithScreensWidget(index),
          );
        });
  }

  Column singleModuleWithScreensWidget(
    int index,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Module title widget
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: shadedCircularDecoration(0.5, WHITE),
                padding: EdgeInsets.all(1),
                child: ClipOval(
                  child: Icon(
                    Icons.home,
                    size: 25, //getScreenWidth(context) * 0.09,
                    color: Main_Dark_Grey,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(
                "module",
                style: normalTextStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        //Module children of screens widget
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: screensListWidget(index),
          ),
        ),
      ],
    );
  }

  ListView screensListWidget(int moduleIndex) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        // separatorBuilder: (BuildContext context, int index) => Divider(
        //       indent: 0,
        //       endIndent: 0,
        //       height: 0,
        //       color: Main_Dark_Grey,
        //     ),
        itemCount: 2,
        itemBuilder: (context, index) {
          return ListTile(
            selected: true,
//            selectedTileColor: DARK_GREY.withOpacity(0.2),
            leading: Icon(Icons.home),
            title: Text(
              "menu",
              style: normalTextStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          );
        });
  }
}
