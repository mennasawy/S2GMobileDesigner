import 'package:flutter/material.dart';
import 'package:templets/Temp_2/Screens_temp2/ShortCuts/Template2/shortcutsScreen.dart';

class ShortCutsScreen extends StatelessWidget {
  static const routeName = '/ShortCutsScreen1';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShortcutsMenu(),
    );
  }
}
