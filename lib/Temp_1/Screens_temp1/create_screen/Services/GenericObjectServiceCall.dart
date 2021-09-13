import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/ServiceUrls.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/api_client.dart';

import 'package:templets/Utilities/const.dart';

class GenericObjectServiceCall implements GenericObjectRepository {
  GenericObject object;
  @override
  Future<GenericObject> postGenericObject(
      context, genericObject, modifyall) async {
    var data = json.encode(genericObject.toJson());
    String url = ServiceUrls(context).genericObjectUrl;
    final sessionToken = GetTokenFromSecure.getSessionToken();
    return await postCallService(
        url, RequestType.POSTGENERICOBJECT, data, sessionToken, http.Client());
  }

  @override
  Future<GenericObject> getSavedGenericObjectWithId(
      context, objectId, savedObjectId) async {
    String url =
        ServiceUrls(context).genericObjectUrlOP + '$objectId/$savedObjectId';
    final sessionToken = GetTokenFromSecure.getSessionToken();
    return await getCallService(
        url, RequestType.GETGENERICOBJECT, sessionToken);
  }
}
