import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/MentionUsersModel.dart';
import 'package:templets/Utilities/StorageUtils/noteUda_provider.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/dependency_injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

abstract class NoteCreationContract {
  void onLoadMentionListComplete(List<MentionUserModel> items);
  void onLoadNoteMentionListError();
}

class NoteCreationPresenter implements NoteCreationContract {
  NoteCreationView _view;

  final BuildContext context;
  final Function addIconAction;

  MentionRepository noteRepository;

  TextEditingController contentController = TextEditingController();
  bool userMentionIsLoading = false;
  bool onAddingNoteLoading = false;
  List<MentionUserModel> listUsers = [];
  List<MentionUserModel> listMentionedUsers = [];
  MentionUserModel selectedUser = MentionUserModel();
  String noteDescription;

  NoteCreationPresenter(
    this._view, {
    this.context,
    this.addIconAction,
    this.contentController,
  }) {
    noteRepository = new Injector().mentionRepository;
  }

  bool isDataLoaded() {
    return !onAddingNoteLoading || userMentionIsLoading;
  }

  onNoteTextSubmitted(String value) {
    noteDescription = value;
  }

  onNoteTextValueChanged(String value) {
    userMentionIsLoading = true;
    if (value.contains('@')) {
      String letter = value.split('@')[1];
      loadUsers(letter);
    }
    _view.changeState();
  }

  void loadUsers(String letter) {
    noteRepository
        .getUsers(context, letter) ////
        .then((c) => this.onLoadMentionListComplete(c))
        .catchError((onError) => this.onLoadNoteMentionListError());
  }

  @override
  void onLoadMentionListComplete(List<MentionUserModel> items) {
    userMentionIsLoading = false;
    listUsers = items;
    _view.changeState();
  }

  @override
  void onLoadNoteMentionListError() {
    userMentionIsLoading = false;
    listUsers = [];
    _view.changeState();
  }

  HandleSaveButton() {
    if (!onAddingNoteLoading) {
      if (!isEmptyText(contentController.text)) {
        addIconAction(noteDescriptionBody(contentController.text));
        onAddingNoteLoading = true;
        contentController.text = '';
        _view.changeState();
      } else
        ShowAlertMessage(
          "Please enter note data",
          context,
        );
    }
  }

  String noteDescriptionBody(String description) {
    MentionUserModel noteDetails =
        Provider.of<NoteUdaProvider>(context, listen: false).noteDetailModel;
    List<MentionUserModel> noteDetailsList =
        Provider.of<NoteUdaProvider>(context, listen: false).noteDetailsList;
    String noteContentAfterReplace;
    if (noteDetails != null) {
      for (int j = 0; j < noteDetailsList.length; j++) {
        if (description.contains('${noteDetailsList[j].name}')) {
          noteContentAfterReplace = description.replaceAll(
              '${noteDetailsList[j].name}',
              replaceMentionWithId(noteDetailsList[j].name,
                  noteDetailsList[j].empId.toString()));
          description = noteContentAfterReplace;
        }
      }
    }
    return '<p>$description</p>';
  }

  String replaceMentionWithId(String mentionedName, String id) {
    return '<strong class=strong $id >$mentionedName</strong>';
  }

  onMentionedUserSelected(int index) {
    userMentionIsLoading = false;
    selectedUser = listUsers[index];
    Provider.of<NoteUdaProvider>(context, listen: false).noteDetailModel =
        selectedUser;
    listMentionedUsers.add(selectedUser);
    contentController.text = contentController.text.split('@')[0];
    contentController.text += selectedUser.name;
    noteDescription = contentController.text;
    listUsers = [];
    _view.changeState();
  }
}

abstract class NoteCreationView {
  void changeState();
}
