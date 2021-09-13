import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Attachment/attach_RowData.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteAttachment {
  final AttachData attachment;
  final String text;
  final Function buttonAction;
  final BuildContext context;
  final Widget imageType;
  final String imageFileName;
  final String title;

  /// note
  final Function getNote;
  TextEditingController noteController = TextEditingController();
  NoteAttachment(
      {this.getNote,
      this.attachment,
      this.text,
      this.buttonAction,
      this.context,
      this.imageType,
      this.title,
      this.imageFileName});

  Future<void> showAlert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: alertView,
    );
  }

  Widget alertView(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        title: Icon(Icons.phone_iphone),
        content: alertContent(context),
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 5),
      ),
    );
  }

  SingleChildScrollView alertContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          AlertFile(),
          SizedBox(
            height: 10,
          ),
          alertMessage(),
          SizedBox(height: 10),
          alertActions(context),
        ],
      ),
    );
  }

  Row AlertFile() {
    return Row(
//      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        imageType,
        SizedBox(
          width: 15,
        ),
        Text(imageFileName),
      ],
    );
  }

  TextField alertMessage() {
    noteController.text = title ?? "";
    return TextField(
      maxLines: 6,
      decoration: InputDecoration(
//            labelText: text ?? '',
        hintText: "Write a Comment",
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: DARK_GREY,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: GREY,
          ),
        ),
      ),
      controller: noteController,
    );
  }

  Widget alertActions(BuildContext context) {
    return FlatButton(
      child: Text(
        "OK",
        style: normalBlueTextStyle,

//        style: getAlertButtonTextStyle(context),
      ),
      onPressed: () {
        buttonAction(attachment, noteController.text);
//       title= noteController.text;
//        (buttonAction != null) ? buttonAction() : handleMultiPopAction();
      },
    );
  }
}
