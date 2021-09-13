import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class savedNote {
  int recId = 0;
  dynamic dateTime;
  var userImage = " ";
  String description = "";
  var noteType;
  var objectid = 0;
  String taskName = "";
  String userName = "";
  var descriptionType;
  Color cardColor;
  savedNote(
      {this.recId,
      this.dateTime,
      this.description,
      this.taskName,
      this.userImage,
      this.userName,
      this.noteType,
      this.objectid,
      this.descriptionType,
      this.cardColor});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['descriptionType'] = this.descriptionType;
    data['objectid'] = this.objectid;
    data['recId'] = this.recId;
    data['noteType'] = this.noteType;
    data['dateTime'] = this.dateTime;
    data['description'] = this.description;
    data['taskName'] = this.taskName;
    data['userImage'] = this.userImage;
    data['userName'] = this.userName;
    return data;
  }

  factory savedNote.fromJson(Map<String, dynamic> json) {
    return savedNote(
        descriptionType: json["descriptionType"],
        objectid: json["objectid"],
        noteType: json["noteType"],
        dateTime: json["dateTime"],
        recId: json["recId"],
        description: json["description"],
        taskName: json["taskName"],
        userImage: json["userImage"],
        userName: json["userName"]);
  }
}

String postToJsonMobileSubmitRequest(savedNote data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

abstract class NoteRepository {
  Future<String> addNote(BuildContext context, String noteName, int objectRecId,
      int noteId, savedNote noteBody);
}

abstract class DeleteNoteRepository {
  Future<String> deleteNote(
      BuildContext context, String noteTableName, int objectRecId);
}

class FetchDataException implements Exception {
  final _message;
  FetchDataException([this._message]);
  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}
