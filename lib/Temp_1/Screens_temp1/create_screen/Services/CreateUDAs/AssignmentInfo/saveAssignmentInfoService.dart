import 'dart:convert';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/AssignmentInfo/editAssignmentInfo.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/AssignmentInfo/saveAssignmentInfoBody.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/AssignmentInfo/save_editAssaigmentInfoResponse.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/ServiceUrls.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/api_client.dart';
import 'package:templets/Utilities/const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AssignmentInfoSaveService implements IAssignmentInfoSaveEditRepository {
  //Test Service
  @override
  Future<AssignmentInfoSaveEditResponse> saveAssignmentInfo(
      BuildContext context,
      AssignmentInfoSaveBody assignmentInfoSaveBody) async {
    final sessionToken = GetTokenFromSecure.getSessionToken();
    String url = ServiceUrls(context).saveAssignmentInfo;
    return await postCallService(url, RequestType.SAVEASSIGNMENTINFOUDA,
        json.encode(assignmentInfoSaveBody), sessionToken, http.Client());

    // response = await http.post(url,
    //     body: json.encode(assignmentInfoSaveBody), headers: httpHeader);
    // if (response.statusCode == 200) {
    //   if(!response.body.contains('restException')){
    //     AssignmentInfoSaveEditResponse parsedResponse =
    //     parseAssignmentInfo(response.body);
    //     return parsedResponse;        }
    //   else{
    //     RestExceptionResponse exceptionResponse = parseRestExceptionResponse(response.body);
    //     throw ErrorResponse(message: exceptionResponse.restException.errorMessage,code: exceptionResponse.restException.errorCode);
    //   }
    // }
    // throw ErrorResponse();
  }

  //Test Service
  @override
  Future<AssignmentInfoSaveEditResponse> editAssignmentInfo(
      BuildContext context,
      AssignmentInfoEditBody assignmentInfoEditBody) async {
    final sessionToken = GetTokenFromSecure.getSessionToken();
    String url = ServiceUrls(context).saveAssignmentInfo;
    return await postCallService(url, RequestType.EDITASSIGNMENTINFOUDA,
        json.encode(assignmentInfoEditBody), sessionToken, http.Client());
    //   response = await http.post(url,
    //       body: json.encode(assignmentInfoEditBody), headers: httpHeader);
    //   if (response.statusCode == 200) {
    //     if (!response.body.contains('restException')) {
    //       AssignmentInfoSaveEditResponse parsedResponse =
    //           parseAssignmentInfo(response.body);
    //       return parsedResponse;
    //     } else {
    //       RestExceptionResponse exceptionResponse =
    //           parseRestExceptionResponse(response.body);
    //       throw ErrorResponse(
    //           message: exceptionResponse.restException.errorMessage,
    //           code: exceptionResponse.restException.errorCode);
    //     }
    //   }
    //   throw ErrorResponse();
  }
}
