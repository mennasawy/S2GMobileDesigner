// To parse this JSON data, do
//
//     final setUserData = setUserDataFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:templets/Utilities/const.dart';

class SetUserDataRequest {
  Employe emp;
  SetUserDataRequest({
    this.emp,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emp'] = this.emp;
    return data;
  }

  String postSetUserProfileModel(SetUserDataRequest data) {
    final dyn = data.toJson();
    log(LogType.DEBUG, "postSetUserProfileModel === ${json.encode(dyn)}");
    return json.encode(dyn);
  }
}

class Employe {
  Employe({
    this.name,
    this.email,
    this.password,
    this.userName,
    this.corporateId,
    this.contractTypeId,
    this.deptId,
    this.empId,
    this.expireDate,
    this.hourCost,
    this.mobilePhone,
    this.nameFirst,
    this.nameLast,
    this.parentId,
    this.preferedLanguage,
    this.statusId,
    this.workingDays,
    this.gender,
    this.helperImage,
    this.helperPassword,
    this.image,
    this.isRegistering,
    this.locationName,
    this.loginType,
    this.startWorkingHelper,
    this.startWorkingHour,
    this.statusName,
    this.treeNode,
    this.workinghours,
    this.skills,
  });

  String name;
  String email;
  String password;
  String userName;
  String corporateId;
  int contractTypeId;
  int deptId;
  int empId;
  int expireDate;
  double hourCost;
  String mobilePhone;
  String nameFirst;
  String nameLast;
  int parentId;
  String preferedLanguage;
  int statusId;
  String workingDays;
  String gender;
  String helperImage;
  String helperPassword;
  String image;
  bool isRegistering;
  String locationName;
  int loginType;
  String startWorkingHelper;
  String startWorkingHour;
  String statusName;
  dynamic treeNode;
  int workinghours;
  dynamic skills;

  Map<String, dynamic> toJson() {
    var map = new Map<String, dynamic>();
    map["Name"] = name;
    map["Email"] = email;
    map["Password"] = password;
    map["user_Name"] = userName;
    map["CORPORATE_ID"] = corporateId;
    map["ContractTypeID"] = contractTypeId;
    map["DeptID"] = deptId;
    map["Emp_ID"] = empId;
    map["Expire_Date"] = expireDate;
    map["HourCost"] = hourCost;
    map["Mobile_Phone"] = mobilePhone;
    map["Name_First"] = nameFirst;
    map["Name_Last"] = nameLast;
    map["PARENT_ID"] = parentId;
    map["Prefered_Language"] = preferedLanguage;
    map["Status_ID"] = statusId;
    map["WorkingDays"] = workingDays;
    map["gender"] = gender;
    map["helperImage"] = helperImage;
    map["helperPassword"] = helperPassword;
    map["image"] = image;
    map["isRegistering"] = isRegistering;
    map["locationName"] = locationName;
    map["loginType"] = loginType;
    map["startWorkingHelper"] = startWorkingHelper;
    map["startWorkingHour"] = startWorkingHour;
    map["statusName"] = statusName;
    map["treeNode"] = treeNode;
    map["workinghours"] = workinghours;
    map["Skills"] = skills;
    return map;
  }
}

//abstract class SetProfileRepo{
//  Future<void> saveUserData(BuildContext context,SetUserDataRequest user , http.Client client);
//}

class SaveProfileRestExceptionResponse {
  SaveProfileRestExceptionResponse({
    this.restException,
    this.massege,
    this.returnValue,
  });

  dynamic restException;
  String massege;
  String returnValue;

  factory SaveProfileRestExceptionResponse.fromRawJson(String str) =>
      SaveProfileRestExceptionResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SaveProfileRestExceptionResponse.fromJson(
          Map<String, dynamic> json) =>
      SaveProfileRestExceptionResponse(
        restException: json["restException"],
        massege: json["massege"],
        returnValue: json["returnValue"],
      );

  Map<String, dynamic> toJson() => {
        "restException": restException,
        "massege": massege,
        "returnValue": returnValue,
      };
}

SaveProfileRestExceptionResponse parseProfileRestExceptionResponse(
    String body) {
  final parsed = json.decode(body);
  return SaveProfileRestExceptionResponse.fromJson(parsed);
}
