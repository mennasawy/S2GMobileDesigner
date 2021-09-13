import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Temp_2/Models/BottomNavigationModel.dart';

class BottomBarManager {
  //BuildContext context;

  static final BottomBarManager _instance = BottomBarManager._internal();

  factory BottomBarManager() {
    return _instance;
  }

  BottomBarManager._internal();

  pushStyle(Widget screen, BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => screen,
        transitionDuration: Duration(seconds: 0),
      ),
    );
  }

  doNavigation(context, screen) {
    {
//      switch (screen) {
//        //Hamdy review .. separate case login in one function
//        case ScreenType.dashboard:
//          pushStyle(DashboardScreen2(), context);
//          break;
//        case ScreenType.todo:
//          pushStyle(ToDo2(), context);
//          break;
//        case ScreenType.stickyNotes:
//          pushStyle(ToDoStickyNotes2(), context);
//          break;
//        case ScreenType.shortcuts:
//          pushStyle(ShortcutsMenu(), context);
//          break;
//        case ScreenType.apps:
//          // showAppsBottomSheet = !showAppsBottomSheet;
//          // pushStyle(AppsTempScreen(), context);
//          break;
//      }
    }
  }

  //Hamdy review .. change name to be openPreviousScreen

//Hamdy review .. change name to be StackManager only

  int checkActiveIndex(ScreenType screenType) {
    if (screenType == ScreenType.dashboard) {
      return 0;
    } else if (screenType == ScreenType.todo) {
      return 1;
    } else if (screenType == ScreenType.stickyNotes) {
      return 2;
    } else if (screenType == ScreenType.shortcuts) {
      return 3;
    } else {
      return 0;
    }
  }

  onFloatingButtonTap(BuildContext context) {
//Hamdy review .. remove if else as we do not need to remove from list
    // stackScreen.add(ScreenType.values[4]);
    // pushStyle(AppsTempScreen(), context);
    // showAppsBottomSheet = !showAppsBottomSheet;
  }
}
