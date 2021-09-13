import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/StickyNotes/ToDoItem.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBars.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/DecorationUtils.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

enum StickyNoteNavigationMode {
  dashboard,
  bottomBar,
}

class ToDoStickyNotes2 extends StatefulWidget {
  final StickyNoteNavigationMode mode;

  const ToDoStickyNotes2({Key key, this.mode}) : super(key: key);

  @override
  _ToDoStickyNotes2State createState() => _ToDoStickyNotes2State();
}

class _ToDoStickyNotes2State extends State<ToDoStickyNotes2> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  var titleStyle = TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: 'Montserrat');

  var detailsStyle =
      TextStyle(fontSize: 14.0, color: BLACK, fontFamily: 'Montserrat');

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: SafeArea(
        child: Scaffold(
          appBar: Template2AppBars(
            screenName: "sticky notes",
            appBarType: Template2AppBarType.main,
          ),
          key: _scaffoldKey,
          backgroundColor: GREY,
          body: getStickyNotesWidget(),
        ),
      ),
    );
  }

  getStickyNotesWidget() {
    return Container(
        margin: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[getAddNewNoteWidget(), myToDoListWidget()],
        ));
  }

  Widget getAddNewNoteWidget() {
    return GestureDetector(
        child: Container(
      margin: EdgeInsets.only(top: 10),
      width: getScreenWidth(context) * 0.92,
      height: getScreenHeight(context) * 0.12,
      decoration: drawContainerBorder(WHITE),
      child: ListTile(
        title: Text(
          "new note",
          style: normalBoldedTextStyle,
        ),
        subtitle: Text(
          "new details",
          style: normalTextStyle,
        ),
        trailing: GestureDetector(
          child: Image.asset(
            BTN_ADD,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ));
  }

  Widget myToDoListWidget() {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (ctx, index) => TodoItem(),
            )));
  }
}
