import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/MentionUsersModel.dart';
import 'package:templets/Utilities/const.dart';
import 'ServiceUrls.dart';
import 'api_client.dart';

class MentionService extends MentionRepository {
  @override
  Future<List<MentionUserModel>> getUsers(context, letter) async {
    String url = ServiceUrls(context).getMentionUsers + letter;
    String sessionToken = GetTokenFromSecure.getSessionToken();
    return await getCallService(
        url, RequestType.GETMENTIONEDUSER, sessionToken);
  }
}
