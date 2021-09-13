import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBarTemplate1/NTGAppBar.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'ToDoItem.dart';

class MYTodoListScreen extends StatefulWidget {
  @override
  _MYTodoListScreenState createState() => _MYTodoListScreenState();
}

class _MYTodoListScreenState extends State<MYTodoListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: WHITE,
          appBar: NTGAppBar(
            appBarType: AppBarType.appBarWithBack,
            appBarActions: addIcon(context), //appBarActions(),
            pageName: "my todo list",
          ),
          body: myToDoListWidget()),
    );
  }

  Row appBarActions() {
    return Row(
      children: <Widget>[
        addIcon(context),
//        SizedBox(width: 20),
        settingsIcon(context),
        SizedBox(width: 10),
      ],
    );
  }

  Widget addIcon(context) {
    return GestureDetector(
        child: Padding(
      padding: EdgeInsets.fromLTRB(5, 5, 10, 5),
      // padding: EdgeInsets.only(top:getScreenHeight(context)*0.009),
//          alignment: Alignment.topCenter,
      child: Image.asset(
        BTN_ADD,
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width * 0.07,
        height: MediaQuery.of(context).size.width * 0.07,
      ),
    ));
  }

  Widget settingsIcon(context) {
    return PopupMenuButton(
      icon: Icon(
        Icons.more_vert,
        color: Colors.black,
        size: MediaQuery.of(context).size.width * 0.08,
      ),
      itemBuilder: (_) => [
        PopupMenuItem(
          child: Text("clear"),
          value: 0,
        ),
      ],
    );
  }

  Widget myToDoListWidget() {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (ctx, index) => TodoItem(),
    );
  }
}
