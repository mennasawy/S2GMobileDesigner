import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MultipleLevel/getMultiLevelResponse.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/ServiceUrls.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/api_client.dart';
import 'package:templets/Utilities/const.dart';
import 'package:flutter/material.dart';

class DeleteMultiLevelService implements DeleteMultiLevelRepository {
  //Test Service
  @override
  Future<String> deleteMultiLevel(
      BuildContext context, String udaName, int recId) async {
    final sessionToken = GetTokenFromSecure.getSessionToken();
    String url = ServiceUrls(context).deleteAttachment +
        udaName +
        '/' +
        recId.toString();
    log(LogType.DEBUG, "Delete multiple level record URL ====== $url");
    return await deleteCallService(
        url, RequestType.DELETEMULTILEVELUDAREC, sessionToken);
    // http.Response response = await http.delete(url, headers: httpHeader);
    // log(LogType.DEBUG, "Delete multiple level record response ====== ${response.body}");
    // if (response.body == "[null]")
    //   return response.statusCode.toString();
    // else {
    //   return parseError(response.body).message;
    // }
  }
}
