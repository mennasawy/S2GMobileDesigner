import 'dart:convert';

import 'package:templets/Utilities/const.dart';
import 'package:flutter/cupertino.dart';

class DeleteGridRecordModelRequest {
  int recoredID;
  DeleteGridRecordModelRequest({this.recoredID});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusID'] = this.recoredID;
    return data;
  }

  String postDeleteGridRecored(DeleteGridRecordModelRequest data) {
    final dyn = data.toJson();
    log(LogType.DEBUG,
        "Grid delete rec reuest body ====== ${json.encode(dyn)}");
    return json.encode(dyn);
  }
}

class DeleteGridRecordModelSucssesResponse {
  bool success;
  String errorCode;
  String errorMessage;
  String developerMessage;

  DeleteGridRecordModelSucssesResponse({this.success});

  DeleteGridRecordModelSucssesResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    developerMessage = json['developerMessage'];
  }
}

DeleteGridRecordModelSucssesResponse sucssessResponseAddStickyNote(
    String data) {
  final dyn = json.decode(data);
  log(LogType.DEBUG,
      "Grid rec deleted ${DeleteGridRecordModelSucssesResponse.fromJson(dyn)}");
  return DeleteGridRecordModelSucssesResponse.fromJson(dyn);
}

abstract class GridRecoredRepositry {
  Future<int> deleteRecored(context, String udaName, int recoredId);
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);
  String toString() {
    if (_message == null) return "Exception";
    return "Exception:$_message";
  }
}
