import 'package:flutter/cupertino.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/MentionUsersModel.dart';

class NoteUdaProvider extends ChangeNotifier {
  MentionUserModel _noteModel;
  String _selectedMentionedUser;
  List<MentionUserModel> _noteDetailsList = [];

  MentionUserModel get noteDetailModel => _noteModel;

  set noteDetailModel(MentionUserModel value) {
    _noteModel = value;
    _noteDetailsList.add(value);
  }

  String get mentionedUser => _selectedMentionedUser;

  set mentionedUser(String value) {
    _selectedMentionedUser = value;
  }

  List<MentionUserModel> get noteDetailsList => _noteDetailsList;
//
//  set noteDetailsList(List<NoteModel> value) {
//    _noteDetailsList = value;
//  }

}
