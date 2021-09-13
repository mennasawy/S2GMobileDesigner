import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Sharedpref {
  SharedPreferences _sharedPreferences;

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    var savedData = prefs.getString(key);
    return savedData == null ? null : json.decode(savedData);
  }

  delete(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
