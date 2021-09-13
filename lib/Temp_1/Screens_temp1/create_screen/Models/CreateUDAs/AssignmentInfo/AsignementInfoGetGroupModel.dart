import 'dart:convert';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/AssignmentInfo/AssignementInfoGetGroupBodyModel.dart';

class AssignmentInfoGetGroupInfoModel {
  int groupID;
  bool isMember;
  int userID;
  String memberUserName;
  var managerUserName;
  String memberEmail;
  var mANAGEREMAIL;
  String nAMEFIRST;
  String nAMELAST;
  String memberPhoneNumber;
  var managerPhoneNumber;
  String name;
  var managerName;
  String employeeName;
  String email;

  var managerEMAIL;
  String nameFIRST;
  String nameLAST;

  AssignmentInfoGetGroupInfoModel({
    this.groupID,
    this.isMember,
    this.userID,
    this.memberUserName,
    this.managerUserName,
    this.memberEmail,
    this.mANAGEREMAIL,
    this.nAMEFIRST,
    this.nAMELAST,
    this.memberPhoneNumber,
    this.managerPhoneNumber,
    this.name,
    this.managerName,
    this.employeeName,
    this.email,
    this.managerEMAIL,
    this.nameFIRST,
    this.nameLAST,
  });

  AssignmentInfoGetGroupInfoModel.fromJson(Map<String, dynamic> json) {
    groupID = json['GroupID'];
    isMember = json['IsMember'];
    userID = json['UserID'];
    memberUserName = json['MemberUserName'];
    managerUserName = json['ManagerUserName'];
    memberEmail = json['MemberEmail'];
    mANAGEREMAIL = json['MANAGER_EMAIL'];
    nAMEFIRST = json['NAME_FIRST'];
    nAMELAST = json['NAME_LAST'];
    memberPhoneNumber = json['MemberPhoneNumber'];
    managerPhoneNumber = json['ManagerPhoneNumber'];
    name = json['name'];
    managerName = json['ManagerName'];
    employeeName = json['EmployeeName'];
    email = json['email'];
    userID = json['userID'];
    groupID = json['groupID'];
    employeeName = json['employeeName'];
    managerEMAIL = json['manager_EMAIL'];
    nameFIRST = json['name_FIRST'];
    nameLAST = json['name_LAST'];
    memberPhoneNumber = json['memberPhoneNumber'];
    managerUserName = json['managerUserName'];
    memberEmail = json['memberEmail'];
    managerPhoneNumber = json['managerPhoneNumber'];
    managerName = json['managerName'];
    isMember = json['isMember'];
    memberUserName = json['memberUserName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['GroupID'] = this.groupID;
    data['IsMember'] = this.isMember;
    data['UserID'] = this.userID;
    data['MemberUserName'] = this.memberUserName;
    data['ManagerUserName'] = this.managerUserName;
    data['MemberEmail'] = this.memberEmail;
    data['MANAGER_EMAIL'] = this.mANAGEREMAIL;
    data['NAME_FIRST'] = this.nAMEFIRST;
    data['NAME_LAST'] = this.nAMELAST;
    data['MemberPhoneNumber'] = this.memberPhoneNumber;
    data['ManagerPhoneNumber'] = this.managerPhoneNumber;
    data['name'] = this.name;
    data['ManagerName'] = this.managerName;
    data['EmployeeName'] = this.employeeName;
    data['email'] = this.email;
    data['userID'] = this.userID;
    data['groupID'] = this.groupID;
    data['employeeName'] = this.employeeName;
    data['manager_EMAIL'] = this.managerEMAIL;
    data['name_FIRST'] = this.nameFIRST;
    data['name_LAST'] = this.nameLAST;
    data['memberPhoneNumber'] = this.memberPhoneNumber;
    data['managerUserName'] = this.managerUserName;
    data['memberEmail'] = this.memberEmail;
    data['managerPhoneNumber'] = this.managerPhoneNumber;
    data['managerName'] = this.managerName;
    data['isMember'] = this.isMember;
    data['memberUserName'] = this.memberUserName;
    return data;
  }
}

List<AssignmentInfoGetGroupInfoModel> parseGetGroupInfo(String body) {
  final parsed = json.decode(body);
  return parsed
      .map<AssignmentInfoGetGroupInfoModel>(
          (json) => AssignmentInfoGetGroupInfoModel.fromJson(json))
      .toList();
}

abstract class AssignmentInfoGetGropRepositry {
  Future<List<AssignmentInfoGetGroupInfoModel>> getGroupInfo(
      context, AssignmentInfoGetGroupInfoBody assignmentInfoGetGroupInfoBody);
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);
  String toString() {
    if (_message == null) return "Exception";
    return "Exception:$_message";
  }
}
