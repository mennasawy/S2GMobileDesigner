import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Note/MentionNoteEmpInfo.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Note/savedNote.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/Note/NoteDetailsPresenter.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBars.dart';
import 'package:templets/Utilities/WidgetsUtilites/FontUtils.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2NoteUDA/NoteUDAUtils.dart';

import 'Temp2NoteMentionedUserInfo.dart';

class Temp2NoteDetailScreen extends StatefulWidget {
  final savedNote noteItemDetails;

  const Temp2NoteDetailScreen({Key key, this.noteItemDetails})
      : super(key: key);
  @override
  _NoteDetailScreenState createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<Temp2NoteDetailScreen>
    implements NoteDetailsView {
  NoteDetailsPresenter _presenetr;

  @override
  void initState() {
    _presenetr = NoteDetailsPresenter(widget.noteItemDetails, this, context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Template2AppBars(
          appBarType: Template2AppBarType.secendary,
          screenName: "Note Details",
        ),
        body: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "By " + " ${_presenetr.noteItemDetails.userName}",
                style: FontUtils.boldNormalTextStyle(BLACK),
              ),
              Text(
                "${dateFormat(_presenetr.noteItemDetails.dateTime, format: "MM/dd/yyyy")}",
                style: FontUtils.normalTextStyle(BLACK26),
              ),
              SizedBox(
                height: 13,
              ),
              Container(
                child: SingleChildScrollView(
                  child: RichText(
                    text: TextSpan(
                        style: noteTextStyle,
                        children: noteContentWidgetList(
                            context,
                            _presenetr.noteItemDetails.description,
                            NoteNavigationMode.noteContent,
                            _presenetr.getMentionedUserData)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void changeState() {
    setState(() {});
  }

  @override
  void onMentionedUserDataLoaded(MentionedUserInfo userInfo) {
    naviagteToUserDetails(userInfo);
  }

  naviagteToUserDetails(MentionedUserInfo userInfo) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => Temp2NoteMentionedUserInfo(
                  mentionedUser: userInfo,
                )));
  }
}
