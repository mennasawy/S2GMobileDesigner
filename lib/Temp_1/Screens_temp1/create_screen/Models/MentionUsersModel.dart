// To parse this JSON data, do
//
//     final noteModel = noteModelFromJson(jsonString);

import 'dart:convert';

List<MentionUserModel> mentionUserModelFromJson(String str) =>
    List<MentionUserModel>.from(
        json.decode(str).map((x) => MentionUserModel.fromJson(x)));

String mentionUserModelToJson(List<MentionUserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MentionUserModel {
  String name;
  String email;
  String password;
  String userName;
  String nameFirst;
  String nameLast;
  String mobilePhone;
  int statusId;
  int loginType;
  int empId;
  String corporateId;
  int deptId;
  String locationName;
  int parentId;
  String statusName;
  double hourCost;

  ///
  int workinghours;
  String gender;
  String workingDays;
  String startWorkingHour;
  int expireDate;
  bool isRegistering;
  String preferedLanguage;
  int contractTypeId;
  String image;
  dynamic skills;

  MentionUserModel({
    this.name,
    this.email,
    this.password,
    this.userName,
    this.nameFirst,
    this.nameLast,
    this.mobilePhone,
    this.statusId,
    this.loginType,
    this.empId,
    this.corporateId,
    this.deptId,
    this.locationName,
    this.parentId,
    this.statusName,
    this.hourCost,
    this.workinghours,
    this.gender,
    this.workingDays,
    this.startWorkingHour,
    this.expireDate,
    this.isRegistering,
    this.preferedLanguage,
    this.contractTypeId,
    this.image,
    this.skills,
  });

  factory MentionUserModel.fromJson(Map<String, dynamic> json) =>
      MentionUserModel(
        name: json["Name"],
        email: json["Email"],
        password: json["Password"],
        userName: json["User_Name"],
        nameFirst: json["Name_First"],
        nameLast: json["Name_Last"],
        mobilePhone: json["Mobile_Phone"],
        statusId: json["Status_ID"],
        loginType: json["loginType"],
        empId: json["Emp_ID"],
        corporateId: json["CORPORATE_ID"],
        deptId: json["DeptID"],
        locationName: json["locationName"],
        parentId: json["PARENT_ID"],
        statusName: json["statusName"],
        hourCost: json["HourCost"],
        workinghours: json["workinghours"],
        gender: json["gender"],
        workingDays: json["WorkingDays"],
        startWorkingHour: json["startWorkingHour"],
        expireDate: json["Expire_Date"],
        isRegistering: json["isRegistering"],
        preferedLanguage: json["Prefered_Language"],
        contractTypeId: json["ContractTypeID"],
        image: json["image"],
        skills: json["Skills"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Email": email,
        "Password": password,
        "User_Name": userName,
        "Name_First": nameFirst,
        "Name_Last": nameLast,
        "Mobile_Phone": mobilePhone,
        "Status_ID": statusId,
        "loginType": loginType,
        "Emp_ID": empId,
        "CORPORATE_ID": corporateId,
        "DeptID": deptId,
        "locationName": locationName,
        "PARENT_ID": parentId,
        "statusName": statusName,
        "HourCost": hourCost,
        "workinghours": workinghours,
        "gender": gender,
        "WorkingDays": workingDays,
        "startWorkingHour": startWorkingHour,
        "Expire_Date": expireDate,
        "isRegistering": isRegistering,
        "Prefered_Language": preferedLanguage,
        "ContractTypeID": contractTypeId,
        "image": image,
        "Skills": skills,
      };
}

abstract class MentionRepository {
  Future<List<MentionUserModel>> getUsers(context, letter);
  // Future assignMembersToTask(context, ToDoListTasks task);
  // Future<MentionedUserInfo> getMemberByImage(context, ToDoListTasks task);
  // Future removeMemberFromTask(context, ToDoListTasks task);
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);
  String toString() {
    if (_message == null) return "Exception";
    return "Exception:$_message";
  }
}

List<MentionUserModel> parseUsers(String body) {
  final parsed = json.decode(body);
  return parsed
      .map<MentionUserModel>((json) => MentionUserModel.fromJson(json))
      .toList();
}
