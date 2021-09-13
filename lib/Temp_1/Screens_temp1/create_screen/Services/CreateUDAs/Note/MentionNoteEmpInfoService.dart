import 'dart:convert';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Note/MentionNoteEmpInfo.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/ServiceUrls.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/api_client.dart';

import 'package:templets/Utilities/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class MentionNoteEmpInfo extends MentionNoteEmpInfoRepository {
  //Refactor service
  Future<MentionedUserInfo> getMentionNoteEmpInfo(context, empId) async {
    final sessionToken = GetTokenFromSecure.getSessionToken();
    String url = ServiceUrls(context).getMentionedEmployee;
    final Map<String, dynamic> _data = {"empId": empId, "getLogo": false};
    final body = json.encode(_data);
    return await postCallService(url, RequestType.GETMENTIONEDUSERLISTDATA,
        body, sessionToken, http.Client());
  }

  MentionedUserInfo parseNoteModelApi(String body) {
    final parsed = (jsonDecode(body));
    return MentionedUserInfo.fromJson(parsed);
  }
}

//  @override
//  Future<MentionNoteEmpInfo>getMentionNoteEmpInfo(context, empId) {
//    // TODO: implement getEmpInfo
//    return null;
//  }
