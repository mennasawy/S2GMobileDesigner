import 'dart:convert';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Invokers.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/ServiceUrls.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/api_client.dart';

import 'package:templets/Utilities/const.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class InvokersServices implements InvokersRepository {
  GenericObject object;

  @override
  Future<GenericObject> getGenericObjectOnDBInvoker(
      context, genericObject, udaID) async {
    // TODO: implement getGenericObjectOnDBInvoker
    final sessionToken = GetTokenFromSecure.getSessionToken();
    var data = json.encode(genericObject.toJson());
    String url = ServiceUrls(context).dbInvoker + udaID.toString();
    return await postCallService(url, RequestType.DBINVOKERGENERICOBJECT, data,
        sessionToken, http.Client());
  }

  @override
  Future<GenericObject> getGenericObjectOnRuleInvoker(
      context, genericObject, udaID) async {
    // TODO: implement getGenericObjectOnRuleInvoker
    final sessionToken = GetTokenFromSecure.getSessionToken();
    var data = json.encode(genericObject.toJson());
    String url = ServiceUrls(context).ruleInvoker + udaID.toString();
    return await postCallService(url, RequestType.RULEINVOKERGENERICOBJECT,
        data, sessionToken, http.Client());
  }

  @override
  Future<GenericObject> getGenericObjectOnSOAPInvoker(
      context, genericObject, udaID) async {
    // TODO: implement getGenericObjectOnSOAPInvoker
    final sessionToken = GetTokenFromSecure.getSessionToken();
    var data = json.encode(genericObject.toJson());
    String url = ServiceUrls(context).soapInvoker + udaID.toString();
    return await postCallService(url, RequestType.SOAPINVOKERGENERICOBJECT,
        data, sessionToken, http.Client());
  }
}
