import 'dart:convert';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/Rules.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/ServiceUrls.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/api_client.dart';

import 'package:templets/Utilities/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class LoadingRulesServiceCall implements LoadingRulesRepository {
  @override
  Future<GenericObject> getOnLoadingRules(String action, String rowID,
      BuildContext context, RulesGenericObject genericObject) async {
    // TODO: implement getOnLoadingRules
    String url = ServiceUrls(context).loadingRules + action + "/" + rowID;
    var requestBody = json.encode(genericObject.toJson());
    final sessionToken = GetTokenFromSecure.getSessionToken();
    return await postCallService(url, RequestType.ONLOADINGUDASRULES,
        requestBody, sessionToken, http.Client());
  }
}
