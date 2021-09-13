import 'dart:convert';

import 'Types.dart';

class Status {
  num typesRecId;
  num recId;
  String name;
  bool common;
  bool isDefault;
  bool isDeleted;
  bool isType;
  var objects;
  Types types;
  num weight;
  String color;
  num sLA_Percentage;
  Status(
      {this.typesRecId,
      this.recId,
      this.name,
      this.objects,
      this.color,
      this.isDeleted,
      this.common,
      this.isDefault,
      this.isType,
      this.sLA_Percentage,
      this.types,
      this.weight});

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
        recId: json["recId"],
        name: json["name"],
        common: json["isCommon"],
        objects: json["objects"],
        isDefault: json["isDefault"],
      isType: json["isType"],
      weight: json["weight"],
      color: json["color"],
      sLA_Percentage: json["sLA_Percentage"],
      isDeleted: json["isDeleted"],
    );}
}
List<Status> parseStatus(String body) {
  final parsed = json.decode(body).cast<Map<String, dynamic>>();
  return parsed.map<Status>((json) => Status.fromJson(json)).toList();
}