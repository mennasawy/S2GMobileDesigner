import 'dart:convert';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/AssignmentInfo/AsignementInfoGetGroupModel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/AssignmentInfo/AssignementInfoGetGroupBodyModel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/ServiceUrls.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/api_client.dart';
import 'package:templets/Utilities/const.dart';
import 'package:http/http.dart' as http;

class AssignementInfoGetGroupInfoService
    extends AssignmentInfoGetGropRepositry {
  //Test Service
  @override
  Future<List<AssignmentInfoGetGroupInfoModel>> getGroupInfo(context,
      AssignmentInfoGetGroupInfoBody assignmentInfoGetGroupInfoBody) async {
    final sessionToken = GetTokenFromSecure.getSessionToken();
    String url = ServiceUrls(context).assignementInfoGetGroupInfo + '/';
    log(LogType.DEBUG, 'Assignment info UDA get group info URL ====== $url');
    log(LogType.DEBUG,
        'Assignment groupInfo request body ======== $assignmentInfoGetGroupInfoBody');
    return await postCallService(
        url,
        RequestType.GETASSIGNMENTINFOUDAGROUP,
        json.encode(assignmentInfoGetGroupInfoBody),
        sessionToken,
        http.Client());
    //   final response = await http.post(url,
    //       body: json.encode(assignmentInfoGetGroupInfoBody), headers: headers);
    //   if (response.statusCode != 200 || response.body == null) {
    //     throw new ErrorResponse(message: "error");
    //   } else {
    //     if (!response.body.contains('restException')) {
    //       GroupList = parseGetGroupInfo(response.body);
    //     } else {
    //       RestExceptionResponse exceptionResponse =
    //           parseRestExceptionResponse(response.body);
    //       throw ErrorResponse(
    //           message: exceptionResponse.restException.errorMessage,
    //           code: exceptionResponse.restException.errorCode);
    //     }
    //   }
    //   log(LogType.DEBUG,
    //       'Assignment groupInfo response body ======== ${response.body}');
    //   return GroupList;
  }
}
