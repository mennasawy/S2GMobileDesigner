import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/ErrorResponse/error_data.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Note/savedNote.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/CreateUDAs/Note/AddNoteService.dart';
import 'package:templets/dependency_injection.dart';
import 'package:flutter/cupertino.dart';

abstract class NoteUDAViewInterface {
  void onAddNoteSuccesssfully(String response, savedNote note);
  void onAddNoteError(ErrorResponse errorResponse);
  void onDeleteNoteSuccess(String response, String content, int index);
  void onDeleteNoteError(ErrorResponse errorResponse);
}

class NoteUDAPresenter {
  final NoteUDAViewInterface view;
  NoteUDAServices NoteUDARepository;
  DeleteNoteServices deleteNoteRepository;

  NoteUDAPresenter({this.view}) {
    NoteUDARepository = new Injector().addNoteRepository;
    deleteNoteRepository = new Injector().deleteNoteRepository;
  }

  void AddNewNote(BuildContext context, String noteName, int objectRecId,
      int noteId, savedNote noteBody) {
    NoteUDARepository.addNote(context, noteName, objectRecId, noteId, noteBody)
        .then((value) => view.onAddNoteSuccesssfully(value, noteBody))
        .catchError((onError) => view.onAddNoteError(onError));
  }

  void DeleteNote(BuildContext context, String noteTableName, int objectRecId,
      String content, int index) {
    deleteNoteRepository
        .deleteNote(context, noteTableName, objectRecId)
        .then((value) => view.onDeleteNoteSuccess(value, content, index))
        .catchError((onError) => view.onDeleteNoteError(onError));
  }
}
