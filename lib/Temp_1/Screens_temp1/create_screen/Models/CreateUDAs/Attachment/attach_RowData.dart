import 'dart:io';
import 'package:flutter/cupertino.dart';

class AttachData {
  int recid;
  String attachmentName;
  String attachmentNote;
  int objectid;
  String attachmentUrl;
  int udaID;
  dynamic size;
  String uploadedby;
  int uploadedbyid;
  dynamic date;
  var attachmenttype;
  bool ispublic;
  int subFormRowId;
  List<dynamic> groups;

  TextEditingController noteController= TextEditingController();

  AttachData(
      {this.recid,
      this.attachmentName,
      this.attachmentNote,
      this.objectid,
      this.attachmentUrl,
      this.udaID,
      this.size,
      this.uploadedby,
      this.uploadedbyid,
      this.date,
      this.attachmenttype,
      this.ispublic,
      this.subFormRowId,
      this.groups}){
    noteController.text= attachmentNote??"";
  }

  factory AttachData.fromJson(Map<String, dynamic> json) {
    var rowData = AttachData(
      recid: json['recid'],
      attachmentName: json['attachmentName'],
      objectid: json['objectid'],
      attachmentNote: json['attachmentNote'],
      attachmentUrl: json['attachmentUrl'],
      udaID: json['udaID'],
      size: json['size'],
      uploadedby: json['uploadedby'],
      uploadedbyid: json['uploadedbyid'],
      date: json['date'],
      attachmenttype: json['attachmenttype'],
      ispublic: json['ispublic'],
      subFormRowId: json['subFormRowId'],
//      groups: List<dynamic>.from(json["groups"].map((x) => x)),
    );

    return rowData;
  }

  toJson() {
    var map = new Map<String, dynamic>();
    map["recid"] = recid;
    map["attachmentName"] = attachmentName;
    map["objectid"] = objectid;
    map["udaID"] = udaID;
    map["size"] = size;
    map["attachmentUrl"] = attachmentUrl;
    map["uploadedby"] = uploadedby;
    map["uploadedbyid"] = uploadedbyid;
    map["date"] = date;
    map["attachmentNote"] = attachmentNote;
    map["attachmenttype"] = attachmenttype;
    map["ispublic"] = ispublic;
    map["subFormRowId"] = subFormRowId;
//    map["groups"]= List<dynamic>.from(groups.map((x) => x));
    return map;
//    return json.encode(map);
  }
}

abstract class AttachUploadRepositry {
  Future<dynamic> fileUploadMultipart(
      {List<File> files,
      BuildContext context,
      attachmentName,
      additionalUdaTableNames,
      attachmentID,
      Function onUploadedFiles,
      int objectID});
  Future<String> fileDownload(
      BuildContext context, attachmentObjectID, attachmentUDAId,String attachmentName);
}

abstract class IEditAttachmentNoteRepository {
  Future<String> editAttachmentNote(BuildContext context, AttachData attachData,
      int index, String note, String attachmentId);
}

abstract class IDeleteAttachmentRepository {
  Future<String> deleteAttachment(
      BuildContext context, String attachmentName, String attachmentID);
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception:$_message";
  }
}
