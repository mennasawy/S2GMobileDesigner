import 'package:flutter/material.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBars.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/BasicButton.dart';
import 'package:templets/Utilities/app_constants.dart';

class AddStickyNoteScreen2 extends StatefulWidget {
  @override
  _AddStickyNoteScreen2State createState() => _AddStickyNoteScreen2State();
}

class _AddStickyNoteScreen2State extends State<AddStickyNoteScreen2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Template2AppBars(
          screenName: 'add_new_task',
          appBarType: Template2AppBarType.secendary,
        ),
        body: _buildScreenBody(context),
      ),
    );
  }

  Widget _buildScreenBody(context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Card(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
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
    return TextField(
      keyboardType: TextInputType.multiline,
      maxLines: 100,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(10.0, 15.0, 15.0, 10.0),
          hintText: hint,
          hintStyle: hintTextFieldTextStyle,
          enabled: true,
          enabledBorder: getBorder(),
          focusedBorder: getBorder(),
          disabledBorder: getBorder(),
          focusedErrorBorder: getBorder(),
          filled: true,
          fillColor: WHITE),
    );
  }

  getBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: GREY,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(5),
    );
  }

  Widget _buildSaveTask(context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      alignment: Alignment.bottomRight,
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(10),
        child: BasicButton(
          buttonHeight: 45,
          buttonWidth: 200,
          buttonText: "save",
          onPressedButton: () {},
        ),
      ),
    );
  }
}
