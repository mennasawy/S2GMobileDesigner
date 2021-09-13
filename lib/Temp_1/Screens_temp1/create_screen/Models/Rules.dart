import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';

RulesGenericObject rulesGenericObjectFromJson(String str) =>
    RulesGenericObject.fromJson(json.decode(str));

String rulesGenericObjectToJson(RulesGenericObject data) =>
    json.encode(data.toJson());

class RulesGenericObject {
  RulesGenericObject({
    this.object,
    this.ruleType,
    this.isNew,
    this.objectTypeRecId,
    this.objectRecId,
  });

  GenericObject object;
  String ruleType;
  bool isNew;
  int objectTypeRecId;
  int objectRecId;

  factory RulesGenericObject.fromJson(Map<String, dynamic> json) =>
      RulesGenericObject(
        object: GenericObject.fromJson(json["object"]),
        ruleType: json["ruleType"],
        isNew: json["isNew"],
        objectTypeRecId: json["objectTypeRecId"],
        objectRecId: json["objectRecId"],
      );

  Map<String, dynamic> toJson() => {
        "object": object.toJson(),
        "ruleType": ruleType,
        "isNew": isNew,
        "objectTypeRecId": objectTypeRecId,
        "objectRecId": objectRecId,
      };
}

abstract class LoadingRulesRepository {
  Future<GenericObject> getOnLoadingRules(String action, String rowID,
      BuildContext context, RulesGenericObject genericObject);
}
