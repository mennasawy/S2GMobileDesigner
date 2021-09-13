import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/const.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

enum NoteNavigationMode { noteDetails, noteContent }

List<TextSpan> noteContentWidgetList(BuildContext context, String noteContent,
    NoteNavigationMode navigationMode, Function onMentionedTextTapped) {
  List<String> noteMentionedName = [];
  List<String> noteMentionedId = [];
  List<String> finalSplittedNoteTextContent = [];
  String content;
  List<TextSpan> textSpanArray = [];
  noteContent = removeAllHtmlTags(noteContent);
  splitMentionIdanName(noteContent, noteMentionedName, noteMentionedId);
  if (noteMentionedId != null) {
    for (int j = 0; j < noteMentionedId.length; j++) {
      content = noteContent
          .replaceAll(noteMentionedId[j], '')
          .replaceAll(new RegExp(r'[=&#*]'), '')
          .replaceAll(noteMentionedName[j], '@${j}');
      noteContent = content;
    }
    noteContent = trimNoteContent(noteContent, navigationMode);
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
            textSpanArray
                .add(TextSpan(text: mentionTextList[i], style: noteTextStyle));
          } else {
            textSpanArray.add(TextSpan(
                text: '@' +
                    noteMentionedName[int.parse('${mentionTextList[i]}')] +
                    ' ',
                style: normalLightBlueTextStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    onMentionedTextTapped(int.parse(
                        noteMentionedId[int.parse('${mentionTextList[i]}')]));
                  }));
          }
        }
      } else {
        textSpanArray.add(TextSpan(
            text: finalSplittedNoteTextContent[i] + ' ', style: noteTextStyle));
      }
    }
  }
  return textSpanArray;
}

String removeAllHtmlTags(String noteContent) {
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

String trimNoteContent(String noteContent, NoteNavigationMode mode) {
  return (mode == NoteNavigationMode.noteDetails)
      ? (noteContent.trim().length <= 70)
          ? noteContent
          : noteContent.trim().substring(0, 70) + '...'
      : noteContent;
//  return noteContent;
}
