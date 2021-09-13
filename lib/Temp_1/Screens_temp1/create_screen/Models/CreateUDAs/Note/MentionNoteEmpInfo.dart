
import 'dart:convert';


//NoteModelApi noteModelApiFromJson(String str) => NoteModelApi.fromJson(json.decode(str));
//
//String noteModelApiToJson(NoteModelApi data) => json.encode(data.toJson());
//
//class NoteModelApi {
//  NoteModelApi({
//    this.noteModelApi,
//  });
//
//  List<NoteModelApiElement> noteModelApi;
//
//  factory NoteModelApi.fromJson(Map<String, dynamic> json) => NoteModelApi(
//    noteModelApi: List<NoteModelApiElement>.from(json["NoteModelAPI"].map((x) => NoteModelApiElement.fromJson(x))),
//  );
//
//  Map<String, dynamic> toJson() => {
//    "NoteModelAPI": List<dynamic>.from(noteModelApi.map((x) => x.toJson())),
//  };
//}

class MentionedUserInfo {
  MentionedUserInfo({
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
  dynamic locationName;
  int parentId;
  String statusName;
  double hourCost;
  int workinghours;
  dynamic gender;
  String workingDays;
  String startWorkingHour;
  int expireDate;
  bool isRegistering;
  String preferedLanguage;
  int contractTypeId;
  String image;
  dynamic skills;

  factory MentionedUserInfo.fromJson(Map<String, dynamic> json) => MentionedUserInfo(
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

MentionedUserInfo parseNoteModelApi(String body) {
    final parsed=(jsonDecode(body));
    return MentionedUserInfo.fromJson(parsed);
  }

abstract class MentionNoteEmpInfoRepository{
  Future<MentionedUserInfo>getMentionNoteEmpInfo(context , empId );
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception:$_message";
  }
}

