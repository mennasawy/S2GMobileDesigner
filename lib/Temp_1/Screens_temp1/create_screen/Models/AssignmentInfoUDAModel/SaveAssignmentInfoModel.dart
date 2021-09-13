// To parse this JSON data, do
//
//     final saveAssignmentInfoModel = saveAssignmentInfoModelFromJson(jsonString);

import 'dart:convert';

SaveAssignmentInfoModel saveAssignmentInfoModelFromJson(String str) => SaveAssignmentInfoModel.fromJson(json.decode(str));

String saveAssignmentInfoModelToJson(SaveAssignmentInfoModel data) => json.encode(data.toJson());

class SaveAssignmentInfoModel {
  SaveAssignmentInfoModel({
    this.userID,
    this.name,
    this.assignName,
    this.assignMemberUserName,
    this.assignMemberPhone,
    this.assignMemberEmail,
    this.assignMemFirstName,
    this.assignMemLastName,
    this.assignMemManagerName,
    this.assignMemManagerUserName,
    this.assignMemManagerPhone,
    this.assignMemMangEmail,
  });
  int userID;
  String name;
  String assignName;
  String assignMemberUserName;
  String assignMemberPhone;
  String assignMemberEmail;
  String assignMemFirstName;
  String assignMemLastName;
  dynamic assignMemManagerName;
  dynamic assignMemManagerUserName;
  dynamic assignMemManagerPhone;
  dynamic assignMemMangEmail;

  factory SaveAssignmentInfoModel.fromJson(Map<String, dynamic> json) => SaveAssignmentInfoModel(
    assignName: json["assignName"],
    assignMemberUserName: json["assignMemberUserName"],
    assignMemberPhone: json["assignMemberPhone"],
    assignMemberEmail: json["assignMemberEmail"],
    assignMemFirstName: json["assignMemFirstName"],
    assignMemLastName: json["assignMemLastName"],
    assignMemManagerName: json["assignMemManagerName"],
    assignMemManagerUserName: json["assignMemManagerUserName"],
    assignMemManagerPhone: json["assignMemManagerPhone"],
    assignMemMangEmail: json["assignMemMangEmail"],
  );

  Map<String, dynamic> toJson() => {
    "assignName": assignName,
    "assignMemberUserName": assignMemberUserName,
    "assignMemberPhone": assignMemberPhone,
    "assignMemberEmail": assignMemberEmail,
    "assignMemFirstName": assignMemFirstName,
    "assignMemLastName": assignMemLastName,
    "assignMemManagerName": assignMemManagerName,
    "assignMemManagerUserName": assignMemManagerUserName,
    "assignMemManagerPhone": assignMemManagerPhone,
    "assignMemMangEmail": assignMemMangEmail,
  };
}
