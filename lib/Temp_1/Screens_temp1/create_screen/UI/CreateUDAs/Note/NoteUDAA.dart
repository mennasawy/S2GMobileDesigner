import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Note/MentionNoteEmpInfo.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Note/savedNote.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/Note/NoteUDAPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/TextUDAsPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/BasicTextInputUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/Note/NoteUDAUtils.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUtils.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/WidgetsUtilites/CicularAvatarWidget.dart';
import 'package:templets/Utilities/WidgetsUtilites/RaisedButton.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Utilities/WidgetsUtilites/buildTextFieldMethods.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/Note/noteCreation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'noteDetailScreen.dart';

class NoteUDAs extends StatefulWidget {
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

  NoteUDAs({
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
  _NoteUDAsState createState() => _NoteUDAsState();
}

class _NoteUDAsState extends State<NoteUDAs> implements NoteUDAView {
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
        _noteUDAPresenter.isVisible == true &&
            _noteUDAPresenter.isLocation != true,
        getUDAWithTitleWidget(
            context,
            getNoteWidget(),
            _noteUDAPresenter.noteUDA.udaCaption,
            _noteUDAPresenter.noteUDA.udaDescription,
            _noteUDAPresenter.validationMessage,
            _noteUDAPresenter.isValidationMSGWarning,
            _noteUDAPresenter.isMandatory,
            hexToColor(_noteUDAPresenter.noteUDA.labelColor)));
  }

  getNoteWidget() {
    return Stack(
      children: <Widget>[
        noteContentBody(),
        _noteUDAPresenter.isDataLoading() ? DrawProgressBar() : Container()
      ],
    );
  }

  Widget noteContentBody() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: getScreenHeight(context) * 0.01,
          ),
          (_noteUDAPresenter.noteItemsList != null)
              ? _buildNotesList()
              : Container(
                  height: 30,
                ),
          Center(
              child: BlueRaisedButtonWidget(
            hinttext: "Add New Note",
            onpressed: (!widget.isReadOnly) ? onAddNoteButtonAction : null,
          ))
        ],
      ),
    );
  }

  _buildNotesList() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListView(
          controller: _scrollController,
          shrinkWrap: true,
          children: _buildNoteListCard()),
    );
  }

  _buildNoteListCard() {
    return _noteUDAPresenter.noteItemsList.map((item) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: InkWell(
          onTap: () => NavigateToDetails(item),
          child: Container(
            height: getScreenHeight(context) * 0.175,
            width: getScreenWidth(context) * 0.9,
            decoration: BoxDecoration(
                color: LITE_GREY.withOpacity(OPACITY),
                border: Border.all(
                    color: LITE_BLUE, width: TEXTFIELD_BORDER_RADUIS_WIDTH),
                borderRadius: BorderRadius.circular(TEXTFIELD_BORDER_RADUIS)),
            child: Container(
//                width: getScreenWidth(context) * 0.85,
              padding: EdgeInsets.all(getScreenHeight(context) * 0.009),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
                    height: getScreenHeight(context) * 0.06,
                    width: getScreenWidth(context) * 0.85,
                  ),
                  SizedBox(
                    height: getScreenHeight(context) * 0.01,
                  ),
                  Container(
                    child: RichText(
                      text: TextSpan(style: noteTextStyle, children: <TextSpan>[
                        TextSpan(text: "By "),
                        TextSpan(
                            text: item.userName,
                            style: normalLightBlueTextStyle),
                      ]),
                    ),
                  ),
                  Container(
//                    height: getScreenHeight(context)*0.02,
//                      width: getScreenWidth(context) * 0.85,
                    child: Row(
                      children: <Widget>[
                        Text(
                            '${new DateFormat("dd-MM-yyyy").format(DateTime.fromMillisecondsSinceEpoch(item.dateTime, isUtc: true))}',
                            style: greyLogTimeTextStyle),
                        Spacer(),
                        Container(
                          width: getScreenWidth(context) * 0.125,
                          child: GestureDetector(
                            onTap: () => _noteUDAPresenter.onDeleteIconTapped(
                                _noteUDAPresenter.noteItemsList.indexOf(item)),
                            child: Icon(Icons.phone_iphone),
                          ),
                        ),
                        Container(
                          width: getScreenWidth(context) * 0.125,
                          child: GestureDetector(
                            onTap: () => NavigateToDetails(item),
                            child: Icon(
                              Icons.navigate_next,
                              size: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  NavigateToDetails(savedNote noteItem) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => NoteDetailScreen(
                  noteItemDetails: noteItem,
                )));
  }

  onAddNoteButtonAction() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => NoteCreation(
                  addIconAction: _noteUDAPresenter.saveNoteButtonAction,
                )));
  }

  @override
  void changeState() {
    setState(() {});
  }

  @override
  void onMentionedUserDataLoaded(MentionedUserInfo userInfo) {
    showPopupProfile(context, userInfo);
  }

  Future showPopupProfile(BuildContext context, var selectedItem) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)), //this right here
            child: Container(
              height: getScreenHeight(context) * 0.85,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.cancel,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              try {
                                Navigator.pop(context, ''); //close the popup
                              } catch (e) {}
                            },
                          ),
                        ]),
                    // SizedBox(
                    //   height: 5.0,
                    // ),
                    Center(
                      child: Container(
                        width: 110,
                        height: 110,
                        child: (selectedItem.image != null)
                            ? CircleAvatar(
                                radius: 50,
                                backgroundColor: WHITE,
                                backgroundImage: Image.memory(
                                        convertStringtoImage(
                                            selectedItem.image))
                                    .image,
                              )
                            : CircularAvatarWidget(
                                type: ImageType.AssetImage,
                                image: IMG_PROFILE_NOPHOTO,
                              ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                            border: Border.all(width: 2, color: BLUE)),
                      ),
                    ),
                    BasicTextInputUDA(
                      inputType: InputType.text,
                      inputDecoration: buildInputDecorations(
                          context, selectedItem.name, false, null, null, null),
                      isVisible: true,
                      isReadOnly: true,
                      title: "Name",
                      isMandatory: false,
                      inputHint: selectedItem.name,
                    ),
                    BasicTextInputUDA(
                      inputType: InputType.text,
                      inputDecoration: buildInputDecorations(
                          context, '', false, null, null, null),
                      isVisible: true,
                      isReadOnly: true,
                      title: "Job title",
                      isMandatory: false,
                    ),
                    BasicTextInputUDA(
                      inputType: InputType.text,
                      inputDecoration: buildInputDecorations(
                          context, selectedItem.email, false, null, null, null),
                      isVisible: true,
                      isReadOnly: true,
                      title: "Email",
                      isMandatory: false,
                      inputHint: selectedItem.email,
                    ),
                    BasicTextInputUDA(
                      inputType: InputType.text,
                      inputDecoration: buildInputDecorations(
                          context,
                          selectedItem.mobilePhone,
                          false,
                          IC_TEXT_FIELD_CHECK,
                          null,
                          null),
                      isVisible: true,
                      isReadOnly: true,
                      title: "phone",
                      isMandatory: false,
                      inputHint: selectedItem.mobilePhone,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
