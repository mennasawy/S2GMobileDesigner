import 'package:flutter/material.dart';

class EditAttechmentNoteRequest {
  String attachmentName;
  String attachmentNote;
  String attachmentUrl;
  int attachmenttype;
  int date;
 // List<Null> groups;
  bool ispublic;
  int objectid;
  int recid;
  int size;
  int subFormRowId;
  int udaID;
  String uploadedby;
  int uploadedbyid;

  EditAttechmentNoteRequest(
      {this.attachmentName,
      this.attachmentNote,
      this.attachmentUrl,
      this.attachmenttype,
      this.date,
     // this.groups,
      this.ispublic,
      this.objectid,
      this.recid,
      this.size,
      this.subFormRowId,
      this.udaID,
      this.uploadedby,
      this.uploadedbyid});

  EditAttechmentNoteRequest.fromJson(Map<String, dynamic> json) {
    attachmentName = json['attachmentName'];
    attachmentNote = json['attachmentNote'];
    attachmentUrl = json['attachmentUrl'];
    attachmenttype = json['attachmenttype'];
    date = json['date'];
    // if (json['groups'] != null) {
    //   groups = new List<Null>();
    //   json['groups'].forEach((v) {
    //     groups.add(new Null.fromJson(v));
    //   });
    // }
    ispublic = json['ispublic'];
    objectid = json['objectid'];
    recid = json['recid'];
    size = json['size'];
    subFormRowId = json['subFormRowId'];
    udaID = json['udaID'];
    uploadedby = json['uploadedby'];
    uploadedbyid = json['uploadedbyid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attachmentName'] = this.attachmentName;
    data['attachmentNote'] = this.attachmentNote;
    data['attachmentUrl'] = this.attachmentUrl;
    data['attachmenttype'] = this.attachmenttype;
    data['date'] = this.date;
    // if (this.groups != null) {
    //   data['groups'] = this.groups.map((v) => v.toJson()).toList();
    // }
    data['ispublic'] = this.ispublic;
    data['objectid'] = this.objectid;
    data['recid'] = this.recid;
    data['size'] = this.size;
    data['subFormRowId'] = this.subFormRowId;
    data['udaID'] = this.udaID;
    data['uploadedby'] = this.uploadedby;
    data['uploadedbyid'] = this.uploadedbyid;
    return data;
  }
}

abstract class IEditAttachmentNoteRepository {
  Future<String> editAttachmentNote(BuildContext context,
      EditAttechmentNoteRequest editAttechmentNoteRequest);
}
