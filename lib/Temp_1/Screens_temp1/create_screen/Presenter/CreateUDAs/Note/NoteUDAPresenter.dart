import 'dart:math';

import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Note/MentionNoteEmpInfo.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/ErrorResponse/error_data.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Note/models.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Note/savedNote.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/CreateUDAs/Note/AddNoteService.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUtils.dart';
import 'package:templets/Utilities/api_constant.dart';
import 'package:templets/Utilities/const.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Utilities/WidgetsUtilites/Alerts/dual_action_alert.dart';
import 'package:templets/dependency_injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotePresenter implements NoteUDAContract {
  NoteUDAServices NoteUDARepository;
  DeleteNoteServices deleteNoteRepository;
  MentionNoteEmpInfoRepository mentionNoteEmpInfoRepository;
  NoteUDAView _view;
  BuildContext _context;

  final Function onAddNote;
  UDAsWithValues noteUDA;
  final FormType formType;
  MentionedUserInfo mentionedUser;

  final String validationMessage;
  final int objectRecId;

  final bool isValidationMSGWarning;
  final bool isValid;
  bool isVisible;
  bool isReadOnly;
  bool isMandatory;
  bool isLocation = false;
  bool validationCondition;
  bool isMentionedUserDataLoading = false;

  List<savedNote> noteItemsList = [];
  List<NotesModel> notesList = [];

  List<Color> noteCardColorList = [
    Colors.pink[200],
    Colors.green[200],
    Colors.amber[200],
    Colors.purple[200],
    Colors.orangeAccent[100],
    Colors.teal[200]
  ];
  NotePresenter(
    this._view,
    this._context, {
    this.onAddNote,
    this.noteUDA,
    this.isVisible,
    this.isReadOnly,
    this.isLocation,
    this.isMandatory,
    this.validationCondition,
    this.validationMessage,
    this.isValidationMSGWarning,
    this.isValid,
    this.formType,
    this.objectRecId,
  }) {
    NoteUDARepository = new Injector().addNoteRepository;
    deleteNoteRepository = new Injector().deleteNoteRepository;
    mentionNoteEmpInfoRepository =
        new Injector().mentionNoteEmpInfoViewRepository;
    noteItemsList = noteUDA.notesList ?? [];
  }

  bool isVisibleWidget() {
    return isVisible == true && noteUDA.location != true;
  }

  bool isDataLoading() {
    return isMentionedUserDataLoading;
  }

  void addNoteCreate(savedNote note) {
    addNewNoteListItem(note);
    Navigator.of(_context).pop();
  }

  void addNoteMonitor(savedNote noteBody) {
    NoteUDARepository.addNote(_context, noteUDA.udaTableName, objectRecId,
            noteUDA.recId, noteBody)
        .then((value) => this.onAddNoteSuccesssfully(value, noteBody))
        .catchError((onError) => this.onAddNoteError(onError));
  }

  @override
  void onAddNoteSuccesssfully(String response, savedNote note) {
    addNewNoteListItem(note);
    Navigator.of(_context).pop();
    log(LogType.DEBUG, 'Note added successfully');
  }

  void addNewNoteListItem(savedNote note) {
    noteItemsList.add(note);
    onAddNote(noteItemsList.length, noteItemsList);
    _view.changeState();
  }

  @override
  void onAddNoteError(ErrorResponse errorResponse) {}

  onDeleteIconTapped(int index) {}

  void deleteNoteMonitor(String content, int index) {
    deleteNoteRepository
        .deleteNote(_context, noteUDA.udaTableName, objectRecId)
        .then((value) => this.onDeleteNoteSuccess(value, content, index))
        .catchError((onError) => this.onDeleteNoteError(onError));
  }

  void deleteNoteCreate(String content, index) {
    deleteNoteListItem(content, index);
  }

  @override
  void onDeleteNoteSuccess(String response, String content, int index) {
    deleteNoteListItem(content, index);
  }

  void deleteNoteListItem(String content, index) {
    noteItemsList.removeAt(index);
//      noteItemsList.removeWhere((item) => item.recId == index);
    onAddNote(noteItemsList.length, noteItemsList);
    _view.changeState();
  }

  @override
  void onDeleteNoteError(ErrorResponse errorResponse) {}

  getMentionedUserData(int empId) {
    isMentionedUserDataLoading = true;
    _view.changeState();
    mentionNoteEmpInfoRepository
        .getMentionNoteEmpInfo(_context, empId)
        .then((c) => this.onLoadMentionNoteEmpInfoComplete(c))
        .catchError((onError) => this.onLoadMentionNoteEmpInfoError(onError));
  }

  @override
  void onLoadMentionNoteEmpInfoComplete(MentionedUserInfo userInfo) {
    isMentionedUserDataLoading = false;
    mentionedUser = userInfo;
    _view.onMentionedUserDataLoaded(userInfo);
    _view.changeState();
  }

  @override
  void onLoadMentionNoteEmpInfoError(ErrorResponse errorResponse) {
    isMentionedUserDataLoading = false;
    _view.changeState();
  }

  Future<void> saveNoteButtonAction(String description) async {
    // LoginUser userData = await GetUserDataFromSecure.getUserData();
    final _random = new Random();

    final note = savedNote(
        description: description,
        userName: "User",
        dateTime: DateTime.now().millisecondsSinceEpoch,
        objectid: objectRecId,
        taskName: noteUDA.udaName,
        cardColor:
            noteCardColorList[_random.nextInt(noteCardColorList.length)]);
    (formType == FormType.monitor) ? addNoteMonitor(note) : addNoteCreate(note);
  }
}

abstract class NoteUDAView {
  void changeState();
  void onMentionedUserDataLoaded(MentionedUserInfo userInfo);
}

abstract class NoteUDAContract {
  void onDeleteNoteSuccess(String response, String content, int index);
  void onDeleteNoteError(ErrorResponse errorResponse);
  void onAddNoteSuccesssfully(String response, savedNote note);
  void onAddNoteError(ErrorResponse errorResponse);
  void onLoadMentionNoteEmpInfoComplete(MentionedUserInfo noteModelApi);
  void onLoadMentionNoteEmpInfoError(ErrorResponse errorResponse);
}
