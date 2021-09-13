import 'package:flutter/material.dart';
import 'package:templets/Temp_2/Models/BottomNavigationModel.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class ItemWidget extends StatelessWidget {
  NavigationItems navigationItems = NavigationItems();

  ScreenType screens;

  Function(int) tapped;
  int index;

  ItemWidget({this.tapped, this.screens, this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        tapped(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            navigationItems.getItemIcon(index),
            fit: BoxFit.fill,
            color: screens.index == index ? Colors.blueAccent : Main_Dark_Grey,
            width: getScreenWidth(context) * 0.075,
            height: getScreenWidth(context) * 0.075,
          ),
          Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                //Hamdy review .. separate in a function
                navigationItems.getItemName(index),
                style: normalTextStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )),
        ],
      ),
    );
  }
}
