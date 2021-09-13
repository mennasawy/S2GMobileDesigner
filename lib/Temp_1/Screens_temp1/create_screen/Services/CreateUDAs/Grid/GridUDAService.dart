import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridCols.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/ServiceUrls.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/api_client.dart';
import 'package:templets/Utilities/const.dart';
import 'dart:async';

class GridUDAService implements GridUDARepository {
  //Test Service
  @override
  Future<List<GridCols>> getGridColumns(context, int udaRecId) async {
    // TODO: implement getGridColumns
    final sessionToken = GetTokenFromSecure.getSessionToken();
    String url = ServiceUrls(context).udaGrid + udaRecId.toString();
    log(LogType.DEBUG, 'Get grid columns URL ======= $url');
    return await getCallService(
        url, RequestType.GETGRIDUDACOLUMNS, sessionToken);
    // final response = await http.get(url, headers: headers);
    // if (response.statusCode != 200 || response.body == null) {
    //   throw new FetchDataException(
    //       "An error ocurred : [Status Code : $response.statusCode]");
    // } else {
    //   if(!response.body.contains('restException')){
    //     var columns = [];
    //     String body = utf8.decode(response.bodyBytes);
    //     columns = parseGridCols(body);
    //     return columns;
    //   } else {
    //     RestExceptionResponse exceptionResponse = parseRestExceptionResponse(response.body);
    //     throw ErrorResponse(message: exceptionResponse.restException.errorMessage,code: exceptionResponse.restException.errorCode);
    //   }
    // }
  }

  // List<GridCols> parseGridCols(String body) {
  //   final parsed = json.decode(body).cast<Map<String, dynamic>>();
  //   log(LogType.DEBUG, 'Parsed grid columns ======= $parsed');
  //   return parsed.map<GridCols>((json) => GridCols.fromJson(json)).toList();
  // }
}
