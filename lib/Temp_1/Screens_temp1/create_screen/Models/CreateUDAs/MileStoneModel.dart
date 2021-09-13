// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

// List<MilestoneObject> milestoneListFromJson(String str) => List<MilestoneObject>.from(
//     json.decode(str).map((x) => MilestoneObject.fromJson(x)));
List<MilestoneObject> milestoneListFromJson(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<MilestoneObject>((json) => MilestoneObject.fromJson(json))
      .toList();
}
String milestoneListToJson(List<MilestoneObject> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MilestoneObject {
  MilestoneObject({
    this.name,
    this.seq,
    this.fkcolor,
    this.statusname,
    this.assignMillstone,
    this.planname,
    this.statusId,
    this.description,
  });

  String name;
  String seq;
  String fkcolor;
  String statusname;
  String assignMillstone;
  String planname;
  int statusId;
  String description;

  factory MilestoneObject.fromJson(Map<String, dynamic> json) =>
      MilestoneObject(
        name: json["name"],
        seq: json["seq"],
        fkcolor: json["fkcolor"],
        statusname: json["statusname"],
        assignMillstone: json["assign_millstone"],
        planname: json["planname"],
        statusId: json["status_id"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "seq": seq,
        "fkcolor": fkcolor,
        "statusname": statusname,
        "assign_millstone": assignMillstone,
        "planname": planname,
        "status_id": statusId,
        "description": description,
      };

}
