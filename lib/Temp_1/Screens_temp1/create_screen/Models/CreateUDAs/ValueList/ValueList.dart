import 'dart:convert';

import 'package:templets/Utilities/const.dart';

class ValueList {
  final int recId;
  final String name;
  bool isDefault;
  final bool isDeleted;
  final String valueListCondition;

  ValueList({
    this.recId,
    this.name,
    this.isDefault,
    this.isDeleted,
    this.valueListCondition,
  });

  factory ValueList.fromJson(Map<String, dynamic> json) {
    return ValueList(
        recId: json["recId"],
        name: json["name"],
        isDefault: json["isDefault"],
        isDeleted: json["isDeleted"],
        valueListCondition: json["valueListCondition"]);
  }

  toJson() {
    Map<String, dynamic> json = new Map<String, dynamic>();
    json["recId"] = recId;
    json["name"] = name;
    json["isDefault"] = isDefault;
    json["isDeleted"] = isDeleted;
    json["valueListCondition"] = valueListCondition;
    return json;
  }
}

class DictionaryValueList {
  DictionaryValueList({this.name});
  String name;

  factory DictionaryValueList.fromJson(Map<String, dynamic> json) =>
      DictionaryValueList(name: json["name"]);

  toJson() {
    Map<String, dynamic> json = new Map<String, dynamic>();
    json["name"] = name;
    return json;
  }
}

abstract class DynamicValueListRepository {
  Future<List<ValueList>> getDynamicValueList(context, queryInfo, udaID);
}

abstract class DictionaryValueListRepository {
  Future<List<ValueList>> getDictionaryValueList(
      context, String columnName, String tableGridName);
}

List<ValueList> parseValueList(String body) {
  final parsed = json.decode(body).cast<Map<String, dynamic>>();
  log(LogType.DEBUG, "Value list parsed body ===== $parsed");
  return parsed.map<ValueList>((json) => ValueList.fromJson(json)).toList();
}
