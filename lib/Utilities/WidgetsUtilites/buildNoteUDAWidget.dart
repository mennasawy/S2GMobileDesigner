import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Note/MentionNoteEmpInfo.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/Note/MentionNoteEmpInfoPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/TextUDAsPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/BasicTextInputUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUtils.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/const.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'CicularAvatarWidget.dart';
import 'buildTextFieldMethods.dart';

class NoteDetailsWidget extends StatefulWidget {
  final String noteContent;
  final bool isNoteContent;
  final FormType formType;

  NoteDetailsWidget(
      {Key key, this.noteContent, this.isNoteContent, this.formType})
      : super(key: key);

  @override
  _NoteDetailsWidgetState createState() => _NoteDetailsWidgetState();
}

class _NoteDetailsWidgetState extends State<NoteDetailsWidget>
    implements MentionNoteEmpInfoViewContract {
  MentionNoteEmpInfoViewPresenter _presenter;
  bool _isMentionedUserDataLoading = true;
  MentionedUserInfo mentionedUser;
  String noteContentAfterReplace = '';
  List<String> noteMentionedName = [];
  List<String> noteMentionedId = [];
  List<String> finalSplittedNoteTextContent = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
//        padding: EdgeInsets.all(5.0),
        child: RichText(
          text: TextSpan(
              style: noteTextStyle,
              children: NoteTextSpanWidgetList(context, widget.noteContent,
                  widget.isNoteContent, widget.formType)),
        ),
      ),
    );
  }

  List<TextSpan> NoteTextSpanWidgetList(BuildContext context,
      String noteContent, bool isNoteContent, FormType formType) {
    String content;
    List<TextSpan> textSpanArray = [];
    log(LogType.DEBUG, noteContent.replaceAll('"', ''));
    noteContent = removeAllHtmlTags(noteContent, isNoteContent);
    splitMentionIdanName(noteContent, noteMentionedName, noteMentionedId);
    if (noteMentionedId != null) {
      for (int j = 0; j < noteMentionedId.length; j++) {
        content = noteContent
            .replaceAll(noteMentionedId[j], '')
            .replaceAll(new RegExp(r'[=&#*]'), '')
            .replaceAll(noteMentionedName[j], '@${j}');
        noteContent = content;
      }
      noteContent = trimNoteContent(noteContent, isNoteContent);
      finalSplittedNoteTextContent = noteContent.split(' ');
      log(LogType.DEBUG, finalSplittedNoteTextContent);
      for (int i = 0; i < finalSplittedNoteTextContent.length; i++) {
        Pattern numPattern = r'^[0-9]';
        RegExp regex = new RegExp(numPattern);
//          if (!regex.hasMatch(finalSplittedNoteTextContent[i])) {
        if (finalSplittedNoteTextContent[i].contains('@@')) {
          log(LogType.DEBUG, finalSplittedNoteTextContent[i].split('@@'));
          List<String> mentionTextList =
              finalSplittedNoteTextContent[i].split('@@');
          for (int i = 0; i < mentionTextList.length; i++) {
            if (!mentionTextList[i].startsWith(regex) &&
                mentionTextList[i] != null) {
              textSpanArray.add(
                  TextSpan(text: mentionTextList[i], style: noteTextStyle));
            } else {
              textSpanArray.add(TextSpan(
                text: '@' +
                    noteMentionedName[int.parse('${mentionTextList[i]}')] +
                    ' ',
                style: normalLightBlueTextStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _presenter = new MentionNoteEmpInfoViewPresenter(
                        context: context,
                        mentionNoteEmpInfoViewContract: this,
                        empId: int.parse(noteMentionedId[
                            int.parse('${mentionTextList[i]}')]));

//                    _presenter.loadData();
                    log(LogType.DEBUG, mentionedUser);
                    (!_isMentionedUserDataLoading)
                        ? showPopupProfile(context, mentionedUser)
                        : null;
                  },
              ));
            }
          }
        } else {
          textSpanArray.add(TextSpan(
              text: finalSplittedNoteTextContent[i] + ' ',
              style: noteTextStyle));
        }
      }
    }
    return textSpanArray;
  }

  @override
  void onLoadMentionNoteEmpInfoComplete(MentionedUserInfo noteModelApi) {
    setState(() {
      _isMentionedUserDataLoading = false;
      mentionedUser = noteModelApi;
    });
  }

  @override
  void onLoadMentionNoteEmpInfoError() {
    setState(() {
      _isMentionedUserDataLoading = false;
    });
  }
}

String removeAllHtmlTags(String noteContent, bool isNoteContent) {
  return noteContent
      .replaceAll('<p>', '')
      .replaceAll('</p>', '')
      .replaceAll('"', '')
      .replaceAll('noopener noreferrer', '')
      .replaceAll('rel', '')
      .replaceAll('strong', '#')
      .replaceAll(' >', '*= @')
      .replaceAll('<# class', '')
      .replaceAll('</#>', '&');
}

void splitMentionIdanName(String noteContent, List<String> noteMentionedName,
    List<String> noteMentionedId) {
  List<String> splittedNoteText = noteContent.split(new RegExp(r'[=]'));
  for (int i = 0; i < splittedNoteText.length; i++) {
    if (splittedNoteText[i].contains('#')) {
      String noteMentionId =
          splittedNoteText[i].replaceAll('#', '').replaceAll('*', '');
      noteMentionedId.add(noteMentionId);
    }
    if (splittedNoteText[i].contains('@')) {
      noteMentionedName.add(splittedNoteText[i].substring(
          splittedNoteText[i].indexOf('@') + 1,
          splittedNoteText[i].indexOf('&')));
    }
  }
}

String trimNoteContent(String noteContent, bool isNoteContent) {
  (isNoteContent)
      ? noteContent = noteContent.trim().length <= 70
          ? noteContent
          : noteContent.trim().substring(0, 70) + '...'
      : noteContent = noteContent;
  return noteContent;
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
                                      convertStringtoImage(selectedItem.image))
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
