import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/AssignmentInfoUDAModel/AssignmentInfoModel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/ServiceUrls.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/api_client.dart';
import 'package:templets/Utilities/const.dart';
import 'package:http/http.dart' as http;

class AssignmentInfoService extends AssignmentInfoRepositry {
  //Test Service
  @override
  Future<List<AssignmentInfoModel>> getAssignmentInfoLists(context) async {
    final sessionToken = GetTokenFromSecure.getSessionToken();
    String url = ServiceUrls(context).assignmentInfo;
    log(LogType.DEBUG, '$url URL Assignment Info');
    return await postCallService(url, RequestType.GETASSIGNMENTINFOUDALISTS,
        null, sessionToken, http.Client());
    // final response = await http.post(url, headers: headers);

    // if (response.statusCode != 200 || response.body == null) {
    //   throw new ErrorResponse(
    //       message: "error ..");
    // } else {
    //   if(!response.body.contains('restException')){
    //     assignmentInfoMainList = parseAssignmentInfo(response.body);      }
    //   else{
    //     RestExceptionResponse exceptionResponse = parseRestExceptionResponse(response.body);
    //     throw ErrorResponse(message: exceptionResponse.restException.errorMessage,code: exceptionResponse.restException.errorCode);
    //   }

    // }
    // log(LogType.DEBUG, 'Assignment Info Body${response.body}');
    // return assignmentInfoMainList;
  }
}
