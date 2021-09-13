import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Note/MentionNoteEmpInfo.dart';
import 'package:templets/dependency_injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class MentionNoteEmpInfoViewContract {
  void onLoadMentionNoteEmpInfoComplete(MentionedUserInfo noteModelApi);
  void onLoadMentionNoteEmpInfoError();
}

class MentionNoteEmpInfoViewPresenter {
  MentionNoteEmpInfoViewContract mentionNoteEmpInfoViewContract;
  final int empId;
  final BuildContext context;
  MentionNoteEmpInfoRepository mentionNoteEmpInfoRepository;

  MentionNoteEmpInfoViewPresenter(
      {this.mentionNoteEmpInfoViewContract, this.empId, this.context}) {
    mentionNoteEmpInfoRepository =
        new Injector().mentionNoteEmpInfoViewRepository;
  }
}
