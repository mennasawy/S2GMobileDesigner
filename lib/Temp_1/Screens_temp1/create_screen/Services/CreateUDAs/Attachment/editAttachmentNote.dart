import 'dart:convert';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/ServiceUrls.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/api_client.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Attachment/attach_RowData.dart';
import 'package:templets/Utilities/const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditAttachmentService implements IEditAttachmentNoteRepository {
  //Test Service
  @override
  Future<String> editAttachmentNote(BuildContext context, AttachData attachData,
      int index, String noteTableName, String attachmentId) async {
    final sessionToken = GetTokenFromSecure.getSessionToken();
    String url = ServiceUrls(context).editAttachmentNote + "/" + noteTableName;
    log(LogType.DEBUG, "deleteeeee$url");
    log(LogType.DEBUG, "$attachmentId");
    log(LogType.DEBUG, url);
    return await postCallService(url, RequestType.EDITATTACHMENTUDANOTE,
        json.encode(attachData), sessionToken, http.Client());
//       http.Response response = await http.post(url,
//           headers: httpHeader, body:json.encode(attachData));
//           log(LogType.DEBUG, response.statusCode);
//           log(LogType.DEBUG, 'Response ***********');
//           log(LogType.DEBUG, response.body);
//           log(LogType.DEBUG, "......");
//        if(response.statusCode==200){
//          if(!response.body.contains('restException')){
// //           if (response.body == attachData.recid.toString())
// //             return response.statusCode.toString();
//          return "updated success";
//          } else{
//            RestExceptionResponse exceptionResponse = parseRestExceptionResponse(response.body);
//            throw ErrorResponse(message: exceptionResponse.restException.errorMessage,code: exceptionResponse.restException.errorCode);
//          }}
//       else {
//         return parseError(response.body).message;
//       }
  }
}
