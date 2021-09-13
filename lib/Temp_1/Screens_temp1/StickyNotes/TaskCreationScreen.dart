import 'package:flutter/material.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBarTemplate1/NTGAppBar.dart';
import 'package:templets/Utilities/WidgetsUtilites/RaisedButtonWidget.dart';

class TaskCreationScreen extends StatefulWidget {
  @override
  _TaskCreationState createState() => _TaskCreationState();
}

class _TaskCreationState extends State<TaskCreationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: NTGAppBar(
          appBarType: AppBarType.appBarWithBack,
          pageName: "add new task",
        ),
        body: _buildScreenBody(context),
      ),
    );
  }

  Widget _buildScreenBody(context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Card(
              elevation: 3.0,
              child: buildTaskTextContainer("new task"),
            ),
          ),
          _buildSaveTask(context),
        ],
      ),
    );
  }

  TextField buildTaskTextContainer(String hint) {
    return (TextField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: new InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding:
              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
          hintText: hint),
      //    onChanged: (value) => onMentionPerson(value),
    ));
  }

  Widget _buildSaveTask(context) {
    return NTGButton(
      buttonText: "save",
      onPressedButton: (){},
    );
  }
}
