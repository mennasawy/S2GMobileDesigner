import 'dart:convert';

//// To parse this JSON data, do
////
////     final assignmentInfoModel = assignmentInfoModelFromJson(jsonString);
//
//import 'dart:convert';
//
//List<AssignmentInfoModel> assignmentInfoModelFromJson(String str) => List<AssignmentInfoModel>.from(json.decode(str).map((x) => AssignmentInfoModel.fromJson(x)));
//
//String assignmentInfoModelToJson(List<AssignmentInfoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
//class AssignmentInfoModel {
//  AssignmentInfoModel({
//    this.name,
//    this.id,
//    this.type,
//    this.parentId,
//    this.organizations,
//    this.groups,
//  });
//
//  String name;
//  int id;
//  int type;
//  int parentId;
//  List<AssignmentInfoModel> organizations;
//  List<Group> groups;
//
//  factory AssignmentInfoModel.fromJson(Map<String, dynamic> json) => AssignmentInfoModel(
//    name: json["name"],
//    id: json["id"],
//    type: json["type"],
//    parentId: json["parentId"],
//    organizations: json["organizations"] == null ? null : List<AssignmentInfoModel>.from(json["organizations"].map((x) => AssignmentInfoModel.fromJson(x))),
//    groups: json["groups"] == null ? null : List<Group>.from(json["groups"].map((x) => Group.fromJson(x))),
//  );
//
//  Map<String, dynamic> toJson() => {
//    "name": name,
//    "id": id,
//    "type": type,
//    "parentId": parentId,
//    "organizations": organizations == null ? null : List<dynamic>.from(organizations.map((x) => x.toJson())),
//    "groups": groups == null ? null : List<dynamic>.from(groups.map((x) => x.toJson())),
//  };
//}
//
//class Group {
//  Group({
//    this.name,
//    this.email,
//    this.groupId,
//    this.type,
//    this.parentGroupId,
//    this.groupParentGroupId,
//    this.groupEmail,
//    this.groupGroupId,
//    this.groupName,
//  });
//
//  String name;
//  String email;
//  int groupId;
//  int type;
//  int parentGroupId;
//  int groupParentGroupId;
//  String groupEmail;
//  int groupGroupId;
//  String groupName;
//
//  factory Group.fromJson(Map<String, dynamic> json) => Group(
//    name: json["Name"]==null?null:json["Name"],
//    email: json["Email"]==null?null:json["Email"],
//    groupId: json["Group_ID"]==0?0:json["Group_ID"],
//    type: json["type"]==0?0:json["type"],
//    parentGroupId: json["PARENT_GROUP_ID"]==0?0:json["PARENT_GROUP_ID"],
//    groupParentGroupId: json["parent_GROUP_ID"]==0?0:json["parent_GROUP_ID"],
//    groupEmail: json["email"]==null?null:json["email"],
//    groupGroupId: json["group_ID"]==0?0:json["group_ID"],
//    groupName: json["name"]==null?null:json["name"],
//  );
//
//  Map<String, dynamic> toJson() => {
//    "Name": name,
//    "Email": email,
//    "Group_ID": groupId,
//    "type": type,
//    "PARENT_GROUP_ID": parentGroupId,
//    "parent_GROUP_ID": groupParentGroupId,
//    "email": groupEmail,
//    "group_ID": groupGroupId,
//    "name": groupName,
//  };
//}
//abstract class AssignmentInfoRepositry {
//  Future<List<AssignmentInfoModel>>getAssignmentInfoLists(context);
//}
//class FetchDataException  implements Exception{
//  final _message ;
//
//  FetchDataException([this._message]);
//  String toString(){
//    if(_message == null ) return "Exception";
//    return "Exception:$_message";
//  }
//}


class AssignmentInfoModel {
  String name;
  int id;
  int type;
  int parentId;
  List<Organizations> organizations;

  AssignmentInfoModel(
      {this.name, this.id, this.type, this.parentId, this.organizations});

  AssignmentInfoModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    type = json['type'];
    parentId = json['parentId'];
    if (json['organizations'] != null) {
      organizations = new List<Organizations>();
      json['organizations'].forEach((v) {
        organizations.add(new Organizations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['type'] = this.type;
    data['parentId'] = this.parentId;
    if (this.organizations != null) {
      data['organizations'] =
          this.organizations.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Organizations {
  String name;
  int id;
  int type;
  int parentId;
  List<Groups> groups;

  Organizations({this.name, this.id, this.type, this.parentId, this.groups});

  Organizations.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    type = json['type'];
    parentId = json['parentId'];
    if (json['groups'] != null) {
      groups = new List<Groups>();
      json['groups'].forEach((v) {
        groups.add(new Groups.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['type'] = this.type;
    data['parentId'] = this.parentId;
    if (this.groups != null) {
      data['groups'] = this.groups.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Groups {
  String name;
  String email;
  int groupID;
  int type;
  int pARENTGROUPID;
//  int groupID;
//  String email;
  int parentGROUPID;
//  String name;

  Groups(
      {this.name,
        this.email,
        this.groupID,
        this.type,
        this.pARENTGROUPID,
//        this.groupID,
//        this.email,
        this.parentGROUPID,
//        this.name
      });

  Groups.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    email = json['Email'];
    groupID = json['Group_ID'];
    type = json['type'];
    pARENTGROUPID = json['PARENT_GROUP_ID'];
    groupID = json['group_ID'];
    email = json['email'];
    parentGROUPID = json['parent_GROUP_ID'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Email'] = this.email;
    data['Group_ID'] = this.groupID;
    data['type'] = this.type;
    data['PARENT_GROUP_ID'] = this.pARENTGROUPID;
    data['group_ID'] = this.groupID;
    data['email'] = this.email;
    data['parent_GROUP_ID'] = this.parentGROUPID;
    data['name'] = this.name;
    return data;
  }
}

List<AssignmentInfoModel> parseAssignmentInfo(String body) {
    final parsed = json.decode(body);
    return parsed
        .map<AssignmentInfoModel>((json)=> AssignmentInfoModel.fromJson(json))
        .toList();
  }
abstract class AssignmentInfoRepositry {
  Future<List<AssignmentInfoModel>>getAssignmentInfoLists(context);
}
class FetchDataException  implements Exception{
  final _message ;

  FetchDataException([this._message]);
  String toString(){
    if(_message == null ) return "Exception";
    return "Exception:$_message";
  }
}