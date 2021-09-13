import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Attachment/attach_RowData.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/ServiceUrls.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/api_client.dart';
import 'package:templets/Utilities/const.dart';
import 'package:flutter/material.dart';

class DeleteAttachmentService implements IDeleteAttachmentRepository {
  //Test Service
  @override
  Future<String> deleteAttachment(
      BuildContext context, String attachmentName, String attachmentID) async {
    final sessionToken = GetTokenFromSecure.getSessionToken();
    String url = ServiceUrls(context).deleteAttachment +
        attachmentName +
        '/' +
        attachmentID;
    log(LogType.DEBUG, "in deleteeeeeeeeeeemonitor");
    log(LogType.DEBUG, "deleteeeee$url");
    log(LogType.DEBUG, "$attachmentID");
    return await deleteCallService(
        url, RequestType.DELETEATTACHMENTUDAFILE, sessionToken);
    // http.Response response = await http.delete(url, headers: httpHeader);
    // log(LogType.DEBUG, "response ofdelete");
    //  log(LogType.DEBUG, response.body);
    //  if(response.statusCode==200) {
    //    if(!response.body.contains('restException')){
    //      if (response.body == "[null]")
    //        return response.statusCode.toString();
    //    } else{
    //      RestExceptionResponse exceptionResponse = parseRestExceptionResponse(response.body);
    //      throw ErrorResponse(message: exceptionResponse.restException.errorMessage,code: exceptionResponse.restException.errorCode);
    //    }}
    //    else {
    //      return parseError(response.body).message;
    //    }
  }
}
