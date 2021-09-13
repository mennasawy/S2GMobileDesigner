import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Utilities/app_constants.dart';

enum ScreenType { dashboard, todo, stickyNotes, shortcuts, apps }

class NavigationItems {
  final List icons;
  final List navigatorNames;

  static final NavigationItems instace = NavigationItems.getdata();

  factory NavigationItems() {
    return instace;
  }

  NavigationItems.getdata()
      : icons = <String>[
          IC_DASHBOARD_TEMP2,
          IC_TODOTASKS_TEMP2,
          IC_STICKYNOTES_TEMP2,
          IC_SHORTCUTS_TEMP2,
        ],
        navigatorNames = <String>[
          'Dashboard',
          'Tasks',
          'Sticky Notes',
          'Shortcuts',
          'Apps'
        ];

  String getItemName(int index) {
    return navigatorNames[index];
  }

  String getItemIcon(int index) {
    return icons[index];
  }

  int itemLenght() {
    return icons.length;
  }
}
