import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/StickyNotes/MyToDoListScreen.dart';

class StickyNotesScreen extends StatelessWidget {
  static const routeName = '/StickyNotesScreen1';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MYTodoListScreen(),
    );
  }
}
