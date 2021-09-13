import 'dart:convert';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MultipleLevel/MultipleLevelRowData.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MultipleLevel/getMultiLevelResponse.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MultipleLevel/multiLevelResponseLevelModel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/ServiceUrls.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/api_client.dart';
import 'package:templets/Utilities/const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MultiLevelService implements IMultiLevelGetRepository {
  //Test Service
  @override
  Future<MultiLevelResponse> getLevels(
      BuildContext context, String repoId) async {
    final sessionToken = GetTokenFromSecure.getSessionToken();
    String url = ServiceUrls(context).getMuliLevelsData + repoId;
    return await getCallService(
        url, RequestType.GETMULTILEVELUDALEVELS, sessionToken);
    // response = await http.get(url, headers: httpHeader);
    // log(LogType.DEBUG, "Multiple level get levels response ==== ${response.body}");
    // if (response.statusCode == 200) {
    //   if (!response.body.contains('restException'))
    //     return parseMultiLevelResponse(response.body);
    //   else {
    //     RestExceptionResponse exceptionResponse =
    //         parseRestExceptionResponse(response.body);
    //     throw ErrorResponse(
    //         message: exceptionResponse.restException.errorMessage,
    //         code: exceptionResponse.restException.errorCode);
    //   }
    // }
  }

  //Test Service
  @override
  Future<List<LevelDataModel>> getFirstLevel(
      BuildContext context, String repoId) async {
    final sessionToken = GetTokenFromSecure.getSessionToken();
    String url = ServiceUrls(context).getFirstLevelMultiLevel + repoId;
    return await getCallService(
        url, RequestType.GETMULTILEVELUDAFIRSTLEVEL, sessionToken);
    // response = await http.get(url, headers: httpHeader);
    // log(LogType.DEBUG,
    //     "Multiple level get first level response ==== ${response.body}");
    // if (response.statusCode == 200) {
    //   if (!response.body.contains('restException'))
    //     return parseLevelsResponse(response.body);
    //   else {
    //     RestExceptionResponse exceptionResponse =
    //         parseRestExceptionResponse(response.body);
    //     throw ErrorResponse(
    //         message: exceptionResponse.restException.errorMessage,
    //         code: exceptionResponse.restException.errorCode);
    //   }
    // }
  }

  // List<LevelDataModel> parseLevelsResponse(String body) {
  //   final parsed = json.decode(body);
  //   return parsed
  //       .map<LevelDataModel>((json) => LevelDataModel.fromJson(json))
  //       .toList();
  // }

  //Test Service
  @override
  Future<List<LevelDataModel>> getLevelById(
      BuildContext context, String repoId, String id) async {
    final sessionToken = GetTokenFromSecure.getSessionToken();
    String url = ServiceUrls(context).getAnyLevelMultiLevel + repoId + '/' + id;
    log(LogType.DEBUG, "Multiple level get level with ID $id response ====");
    return await getCallService(
        url, RequestType.GETMULTILEVELUDALEVELBYID, sessionToken);
    // response = await http.get(url, headers: httpHeader);
    // log(LogType.DEBUG,
    //     "Multiple level get level with ID $id response ==== ${response.body}");
    // if (response.statusCode == 200) {
    //   if (!response.body.contains('restException'))
    //     return parseLevelsResponse(response.body);
    //   else {
    //     RestExceptionResponse exceptionResponse =
    //         parseRestExceptionResponse(response.body);
    //     throw ErrorResponse(
    //         message: exceptionResponse.restException.errorMessage,
    //         code: exceptionResponse.restException.errorCode);
    //   }
    // }
  }

  //Test Service
  @override
  Future<String> addEditMultiLevelRec(BuildContext context,
      MultipleLevelRowData multiLevelAddEditRequest, String udaName) async {
    final sessionToken = GetTokenFromSecure.getSessionToken();
    String url = ServiceUrls(context).addEditMultiLevelRec + "/" + udaName;
    return await postCallService(url, RequestType.ADDEDITMULTILEVELUDAREC,
        json.encode(multiLevelAddEditRequest), sessionToken, http.Client());
    // response = await http.post(url,
    //     body: json.encode(multiLevelAddEditRequest), headers: httpHeader);
    // log(LogType.DEBUG,
    //     "Multiple level edit record response ==== ${response.body}");
    // if (response.statusCode == 200 && _isNumeric(response.body))
    //   return 'success';
    // else
    //   throw ErrorResponse();
  }
}
