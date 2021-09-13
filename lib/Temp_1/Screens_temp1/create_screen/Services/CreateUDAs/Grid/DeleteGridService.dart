import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/DeleteGridModel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/ServiceUrls.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/api_client.dart';

import 'package:templets/Utilities/const.dart';
import 'package:provider/provider.dart';

class DeleteGridService implements GridRecoredRepositry {
  @override
  Future<int> deleteRecored(context, String udaName, int recoredId) async {
    final sessionToken = GetTokenFromSecure.getSessionToken();
    log(LogType.DEBUG,
        'Delete grid record URL ======= ${ServiceUrls(context).deleteOneGridRecord + udaName + '/' + recoredId.toString()}');
    return await deleteCallService(
      ServiceUrls(context).deleteOneGridRecord +
          udaName +
          '/' +
          recoredId.toString(),
      RequestType.DELETEGRIDRECORD,
      sessionToken,
    );
  }
}
