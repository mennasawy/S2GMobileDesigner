import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/ValueList/ValueList.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/ServiceUrls.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/api_client.dart';

import 'package:templets/Utilities/const.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';

class ValueListServices
    implements DynamicValueListRepository, DictionaryValueListRepository {
  List<ValueList> valueList = new List<ValueList>();

  @override
  Future<List<ValueList>> getDynamicValueList(context, queryInfo, udaID) async {
    final sessionToken = GetTokenFromSecure.getSessionToken();
    String url = ServiceUrls(context).dynamicValueList + udaID.toString();
    var body = jsonEncode(queryInfo.toJson());
    return await postCallService(url, RequestType.GETVALUELISTUDAVALUES, body,
        sessionToken, http.Client());
  }

  @override
  Future<List<ValueList>> getDictionaryValueList(
      context, String columnName, String tableGridName) async {
    // TODO: implement getDictionaryValueList
    final sessionToken = GetTokenFromSecure.getSessionToken();
    String url = ServiceUrls(context).dictionaryValueList +
        columnName +
        "/" +
        tableGridName;
    return await getCallService(
        url, RequestType.GETDICTIONARYVALUELISTVALUES, sessionToken);
  }
}
