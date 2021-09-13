import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveTokenToSecure {
  static saveTokenAndPin(String token) async {
    final storage = FlutterSecureStorage();
    await storage.write(key: 'Token', value: token);
  }
}

class GetTokenFromSecure {
  static String getSessionToken() => "1631441049614-1-8171583987701131108";
}

class SaveEmployeeIDToSecure {
  static saveEmployeeId(String empId) async {
    final storage = FlutterSecureStorage();
    await storage.write(key: 'empId', value: empId);
  }
}

class GetEmployeeIDFromSecure {
  static Future<String> getEmployeeID() async {
    final storage = FlutterSecureStorage();
    return await storage.read(key: 'empId');
  }
}

// class SaveUserDataToSecure {
//   static saveUserData(LoginUser userData) async {
//     String encodedUserData = encodeUserData(userData);
//     final storage = FlutterSecureStorage();
//     await storage.write(key: 'userData', value: encodedUserData);
//   }

//   static String encodeUserData(LoginUser userData) {
//     return json.encode(userData.toJson());
//   }
// }

// class GetUserDataFromSecure {
//   String _sessionToken;
//   String _userID;
//   List<UserGroup> _userGroups;

//   get sessionToken => _sessionToken;
//   get userID => _userID;
//   get userGroups => _userGroups;

//   set sessionToken(String token) {
//     this.sessionToken = token;
//   }

//   set userID(String id) {
//     this.userID = id;
//   }

//   set userGroups(List<UserGroup> groups) {
//     this.userGroups = groups;
//   }

//   static Future<LoginUser> getUserData() async {
//     final storage = FlutterSecureStorage();
//     String encodedUserData = await storage.read(key: 'userData');
//     LoginUser userData = LoginUser.fromJson(json.decode(encodedUserData));
//     return userData;
//   }
// }

class GetLanguageFromSharedPref {
  static Future<String> getAppLanguage() async {
    var prefs = await SharedPreferences.getInstance();
    String language = prefs.getString('language_code') ?? "en";
    return language;
  }
}

class SaveSelectedScreenIndexToSecure {
  static saveModuleIndex(int modIndex) async {
    final storage = FlutterSecureStorage();
    await storage.write(key: 'moduleIndex', value: modIndex.toString());
  }

  static saveScreenIndex(int screenIndex) async {
    final storage = FlutterSecureStorage();
    await storage.write(key: 'screenIndex', value: screenIndex.toString());
  }
}

class GetSelectedScreenIndexFromSecure {
  static Future<int> getModuleIndex() async {
    final storage = FlutterSecureStorage();
    return int.tryParse(await storage.read(key: 'moduleIndex')) ?? 0;
  }

  static Future<int> getScreenIndex() async {
    final storage = FlutterSecureStorage();
    return int.tryParse(await storage.read(key: 'screenIndex')) ?? 0;
  }
}

class RemoveSelectedScreenIndexToSecure {
  static removeModuleIndex(int modIndex) async {
    final storage = FlutterSecureStorage();
    await storage.delete(key: 'moduleIndex');
  }

  static removeScreenIndex(int screenIndex) async {
    final storage = FlutterSecureStorage();
    await storage.delete(key: 'screenIndex');
  }
}

enum LogType {
  VERBOSE,
  DEBUG,
  INFO,
  WARNING,
  ERROR,
  TERRIBLE_FALIURE,
}
void logD(Object o) {
  assert(() {
    print(o);
    return true;
  }());
}

void log(LogType type, dynamic message) {
  var logger = Logger(
      printer: PrefixPrinter(PrettyPrinter(
    colors: true,
    lineLength: 500,
  ))); // Use the PrettyPrinter to format and print log);
  switch (type) {
    case LogType.VERBOSE:
      logger.v("$message");
      break;
    case LogType.DEBUG:
      logger.d("$message");
      break;
    case LogType.INFO:
      Logger(filter: null, printer: PrettyPrinter(colors: true)).i(message);
//      logger.i("$message");
      break;
    case LogType.WARNING:
      logger.w("$message");
      break;
    case LogType.ERROR:
      logger.e("$message");
      break;
    case LogType.TERRIBLE_FALIURE:
      logger.wtf("$message");
      break;
  }
}
