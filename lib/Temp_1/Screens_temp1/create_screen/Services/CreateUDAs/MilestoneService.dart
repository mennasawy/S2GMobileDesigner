import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/ServiceUrls.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/api_client.dart';
import 'package:templets/Utilities/const.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MileStoneModel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';

class MileStoneServiceCall {
  Future<List<MilestoneObject>> getMileStone(
      BuildContext context,
      String additionalUDATableNames,
      String recordRecId,
      FormModes mode) async {
    String sessionToken = GetTokenFromSecure.getSessionToken();
    String url
        // if (FormModes.editMode != mode) {
        = ServiceUrls(context).getMileStone +
            additionalUDATableNames +
            '/$recordRecId';

    // else {
    //   url = ServiceUrls(context).getTODOMileStone +
    //       additionalUDATableNames +
    //       '/$recordRecId';
    // }
    return await getCallService(url, RequestType.GETMILESTONE, sessionToken);
  }

  // getTODOMilestoneData(BuildContext context, String additionalUDATableNames,
  //     String recordRecId, FormModes mode) async {
  //   String sessionToken = GetTokenFromSecure.getSessionToken();
  //   String url = ServiceUrls(context).getTODOMileStone +
  //       additionalUDATableNames +
  //       '/$recordRecId';

  //   return await getCallService(url, RequestType.GETMILESTONE, sessionToken);
  // }
}
