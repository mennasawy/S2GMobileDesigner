import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridRow.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/ServiceUrls.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/api_client.dart';

import 'package:templets/Utilities/const.dart';
import 'package:provider/provider.dart';

class DictionaryModuleGridService implements DictionaryModuleGridRepository {
  @override
  Future<List<GridRowData>> getDictionaryModuleData(
      context, num udaID, String udaName) async {
    // TODO: implement getDictionaryModuleData
    final sessionToken = GetTokenFromSecure.getSessionToken();
    String language = await GetLanguageFromSharedPref.getAppLanguage();
    String url = ServiceUrls(context).dictionaryModule +
        udaID.toString() +
        "/" +
        udaName +
        "/" +
        language;
    return await getCallService(
        url, RequestType.GETDICTIONARYMODULE, sessionToken);
  }
}
