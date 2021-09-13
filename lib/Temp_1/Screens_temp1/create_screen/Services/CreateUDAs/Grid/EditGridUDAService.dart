import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridRow.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/ServiceUrls.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/api_client.dart';

import 'package:templets/Utilities/const.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class EditGridUDAServices implements EditGridUDARepository {
  @override
  Future<List<GridRowData>> editGridUDA(context, gridName, gridBody) async {
    final sessionToken = GetTokenFromSecure.getSessionToken();
    String url = ServiceUrls(context).editGridUda + gridName;
    var requestBody = postToJsonEditGridRequest(gridBody);
    return await postCallService(url, RequestType.EDITGRIDUDAREC, requestBody,
        sessionToken, http.Client());
  }
}
