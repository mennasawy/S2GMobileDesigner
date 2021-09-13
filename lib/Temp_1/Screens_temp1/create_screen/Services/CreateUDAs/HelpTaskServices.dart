import 'dart:convert';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Help.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/ServiceUrls.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/api_client.dart';
import 'package:templets/Utilities/const.dart';

class HelpTaskServices implements HelpRepository {
  @override
  Future<List<HelpUda>> getHelpTsk(context, HelpUdaId) async {
    final sessionToken = GetTokenFromSecure.getSessionToken();
    String url = ServiceUrls(context).getHelpText + HelpUdaId.toString();
    return await getCallService(url, RequestType.GETHELPUDATASK, sessionToken);
  }

  List<HelpUda> parseHelpTasks(String body) {
    final parsed = json.decode(body);
    return parsed.map<HelpUda>((json) => HelpUda.fromJson(json)).toList();
  }
}
