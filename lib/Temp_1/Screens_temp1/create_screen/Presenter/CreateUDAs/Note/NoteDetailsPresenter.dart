import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Note/MentionNoteEmpInfo.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/ErrorResponse/error_data.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Note/savedNote.dart';
import 'package:templets/dependency_injection.dart';
import 'package:flutter/cupertino.dart';

class NoteDetailsPresenter {
  final savedNote noteItemDetails;
  MentionedUserInfo mentionedUser;
  bool isMentionedUserDataLoading = false;

  MentionNoteEmpInfoRepository mentionNoteEmpInfoRepository;
  NoteDetailsView _view;
  BuildContext _context;

  NoteDetailsPresenter(this.noteItemDetails, this._view, this._context) {
    mentionNoteEmpInfoRepository =
        new Injector().mentionNoteEmpInfoViewRepository;
  }

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
}

abstract class NoteDetailsView {
  void changeState();
  void onMentionedUserDataLoaded(MentionedUserInfo userInfo);
}
