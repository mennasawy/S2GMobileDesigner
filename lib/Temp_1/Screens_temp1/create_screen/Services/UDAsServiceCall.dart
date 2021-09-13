import 'dart:async';
import 'dart:convert';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridCols.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/SubPanelUda.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/ServiceUrls.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/api_client.dart';
import 'package:templets/Utilities/const.dart';

class UDAsServiceCall implements UDAsRepository {
  UDAsObject obj = new UDAsObject();

  @override
  Future<UDAsObject> getUDAsWithValues(context, typeRecId) async {
    String language = await GetLanguageFromSharedPref.getAppLanguage();
    String url =
        ServiceUrls(context).typeUdaUrl + typeRecId.toString() + '/false/true';
    final sessionToken = GetTokenFromSecure.getSessionToken();
    return await getCallService(url, RequestType.GETCREATEUDAS, sessionToken);
  }

  List<UDAsWithValues> parseUDAs(String body) {
    final parsed = json.decode(body);
    return parsed
        .map<UDAsWithValues>((json) => UDAsWithValues.fromJson(json))
        .toList();
  }

  List<GridCols> parseGridCols(String body) {
    final parsed = json.decode(body).cast<Map<String, dynamic>>();
    log(LogType.DEBUG, 'Parsed grid columns ====== $parsed');
    return parsed.map<GridCols>((json) => GridCols.fromJson(json)).toList();
  }

  @override
  Future<List<SubPanelUda>> getPanelsOfSelectedBusinessType(
      context, typeRecId) async {
    String language = await GetLanguageFromSharedPref.getAppLanguage();
    String url = ServiceUrls(context).udaSubPanel +
        '$typeRecId' +
        '/true' +
        '/' +
        language;
    log(LogType.DEBUG, 'Get panels URL ====== $url');
    final sessionToken = GetTokenFromSecure.getSessionToken();
    return await getCallService(url, RequestType.GETCREATEPANELS, sessionToken);
  }

  List<SubPanelUda> parsePanels(String body) {
    final parsed = json.decode(body).cast<Map<String, dynamic>>();
    return parsed
        .map<SubPanelUda>((json) => SubPanelUda.fromJson(json))
        .toList();
  }

  //Test Service
  @override
  Future<UDAsWithValues> getUDAObject(context, int udaID) async {
    // TODO: implement getUDAObject
    String url = ServiceUrls(context).udaObject;
    final sessionToken = GetTokenFromSecure.getSessionToken();
    return await getCallService(
        url + '$udaID', RequestType.GETUDAOBJECT, sessionToken);
  }
}
