import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Note/MentionNoteEmpInfo.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Note/savedNote.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/Note/NoteUDAPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUtils.dart';
import 'package:templets/Utilities/WidgetsUtilites/FontUtils.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/BasicButton.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/DecorationUtils.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/Temp2WidgetsWithBorder.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2NoteUDA/Temp2NoteDetailsScreen.dart';
import 'NoteUDAUtils.dart';
import 'Temp2AddNoteScreen.dart';
import 'Temp2NoteMentionedUserInfo.dart';

class Temp2NoteUDA extends StatefulWidget {
  final Function onAddNote;
  final FormType formType;
  final int objectRecId;
  final String validationMessage;
  final bool isValidationMSGWarning;
  final bool isValid;
  bool isVisible;
  bool isReadOnly;
  bool isMandatory;
  bool isLocation = false;
  bool validationCondition;
  final UDAsWithValues noteUDA;

  Temp2NoteUDA({
    Key key,
    this.onAddNote,
    this.formType,
    this.validationMessage,
    this.isValidationMSGWarning,
    this.isValid,
    this.isVisible,
    this.isReadOnly,
    this.isMandatory,
    this.isLocation,
    this.validationCondition,
    this.noteUDA,
    this.objectRecId,
  }) : super(key: key);

  @override
  _Temp2NoteUDAState createState() => _Temp2NoteUDAState();
}

class _Temp2NoteUDAState extends State<Temp2NoteUDA> implements NoteUDAView {
  NotePresenter _noteUDAPresenter;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _noteUDAPresenter = NotePresenter(this, context,
        validationCondition: widget.validationCondition,
        validationMessage: widget.validationMessage,
        isReadOnly: widget.isReadOnly,
        isLocation: widget.isLocation,
        isMandatory: widget.isMandatory,
        isValid: widget.isValid,
        isValidationMSGWarning: widget.isValidationMSGWarning,
        isVisible: widget.isVisible,
        onAddNote: widget.onAddNote,
        noteUDA: widget.noteUDA,
        formType: widget.formType,
        objectRecId: widget.objectRecId);
//    noteItemsList = (widget.listOfNotes.isNotEmpty) ? widget.listOfNotes : [];
  }

  @override
  Widget build(BuildContext context) {
    return drawWidgetOrEmptyContainer(
        _noteUDAPresenter.isVisibleWidget(),
        getUDAWithTitleWidget(
            context,
            getNoteWidget(),
            "",
            _noteUDAPresenter.noteUDA.udaDescription,
            _noteUDAPresenter.validationMessage,
            _noteUDAPresenter.isValidationMSGWarning,
            _noteUDAPresenter.isMandatory,
            hexToColor(_noteUDAPresenter.noteUDA.labelColor)));
  }

  Widget getNoteWidget() {
    return Temp2WidgetBorder(
      isMandatoryUDA: false,
      title: _noteUDAPresenter.noteUDA.udaCaption,
      child: Stack(
        children: <Widget>[
          noteUDAContent(),
          _noteUDAPresenter.isDataLoading() ? DrawProgressBar() : Container()
        ],
      ),
    );
  }

  Widget noteUDAContent() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
//      mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          drawWidgetOrEmptyContainer(
              isNotEmptyList(_noteUDAPresenter.noteItemsList), buildNoteList()),
          addNewNoteButton(),
        ],
      ),
    );
  }

  buildNoteList() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListView(
          controller: _scrollController,
          shrinkWrap: true,
          children: noteItemCard()),
    );
  }

  noteItemCard() {
    return _noteUDAPresenter.noteItemsList.map((item) {
      return Container(
        padding: const EdgeInsets.only(bottom: 8),
//        height: getScreenHeight(context),
        child: InkWell(
            onTap: () => NavigateToDetails(item),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: drawContainerBorder(item.cardColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "By " + " ${item.userName}",
                        style: FontUtils.boldNormalTextStyle(BLACK),
                      ),
                      GestureDetector(
                        onTap: () => _noteUDAPresenter.onDeleteIconTapped(
                            _noteUDAPresenter.noteItemsList.indexOf(item)),
                        child: Icon(Icons.phone_iphone),
                      ),
                    ],
                  ),
                  Text(
                    "${dateFormat(item.dateTime, format: "MM/dd/yyyy")}",
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
                                item.description,
                                NoteNavigationMode.noteContent,
                                _noteUDAPresenter.getMentionedUserData)),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      );
    }).toList();
  }

  Widget addNewNoteButton() {
    return BasicButton(
        buttonChild: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Add Note",
              style: FontUtils.buttonTitlesTextStyle(WHITE),
            ),
            Icon(Icons.add),
          ],
        ),
        onPressedButton: onAddNoteButtonAction);
//            _noteUDAPresenter.isReadOnly ? onAddNoteButtonAction : null);
  }

  NavigateToDetails(savedNote noteItem) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => Temp2NoteDetailScreen(
                  noteItemDetails: noteItem,
                )));
  }

  onAddNoteButtonAction() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => Temp2AddNewNote(
                  addIconAction: _noteUDAPresenter.saveNoteButtonAction,
                )));
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
