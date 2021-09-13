import 'dart:convert';

import 'package:http/http.dart' as http;

import 'objects.dart';

class Types {
  num recId;
  String typeName;
  List typesUda;
  Objects objects;
  num sLAProfileId;
  num im_show_customer_info;
  num im_show_user_info;
  num im_show_loginuser_info;
  num im_show_asisgn_info;
  num im_show_fault_info;
  num im_show_rootcuause_info;
  num im_show_more_info;
//  Status status;
  String dashboardOption;
  List<num> groupValue;
  List<num> groupValueHelper;
  String sumField;
  bool isHeaderHidden;
  bool isShowdashboard;
  bool isCount;
  bool isSum;
  bool ShowTaskStatusInMonitor;
  String dashboardCondition;
  num DisbaleStatus;
//  Types parentType;
  bool enableLog;
  bool isDeleted;
  bool linkToTaskView;
  bool InheritRule;
  bool InheritPlanTemplate;
  bool CopyAllowLog;
  bool inheritUDAs;

  Types({
    this.objects,
    this.typeName,
    this.typesUda,
    this.recId,
    this.sLAProfileId,
    this.im_show_customer_info,
    this.im_show_user_info,
    this.im_show_asisgn_info,
    this.im_show_fault_info,
    this.im_show_rootcuause_info,
//    this.status,
    this.dashboardOption,
    this.groupValueHelper,
    this.sumField,
    this.isHeaderHidden,
    this.isShowdashboard,
    this.isCount,
    this.isSum,
    this.dashboardCondition,
    this.DisbaleStatus,
    this.im_show_more_info,
    this.im_show_loginuser_info,
    this.ShowTaskStatusInMonitor,
//    this.parentType,
    this.enableLog,
    this.linkToTaskView,
    this.InheritRule,
    this.InheritPlanTemplate,
    this.CopyAllowLog,
    this.inheritUDAs,
  });

  factory Types.fromJson(Map<String, dynamic> json) {
    return Types(
      recId: json["recId"],
      typeName: json["typeName"],
      typesUda: json["typesUda"],
      objects: Objects.fromJson(json['objects']),
      sLAProfileId: json["sLAProfileId"],
      im_show_customer_info: json["im_show_customer_info"],
      im_show_user_info: json["im_show_user_info"],
      im_show_loginuser_info: json["im_show_loginuser_info"],
      im_show_asisgn_info: json["im_show_asisgn_info"],
      im_show_fault_info: json["im_show_fault_info"],
      im_show_rootcuause_info: json["im_show_rootcuause_info"],
      im_show_more_info: json["im_show_more_info"],
//      status: json["status"],
      dashboardOption: json["dashboardOption"],
//      groupValue: json["groupValue"],
      groupValueHelper: json["groupValueHelper"],
      sumField: json["sumField"],
      isHeaderHidden: json["isHeaderHidden"],
      isShowdashboard: json["isShowdashboard"],
      isCount: json["isCount"],
      isSum: json["isSum"],
      dashboardCondition: json["dashboardCondition"],
      DisbaleStatus: json["DisbaleStatus"],
      ShowTaskStatusInMonitor: json["ShowTaskStatusInMonitor"],
//      parentType: json["parentType"],
      enableLog: json["enableLog"],
//      isDeleted: json["isDeleted"],
      linkToTaskView: json["linkToTaskView"],
      InheritRule: json["InheritRule"],
      InheritPlanTemplate: json["InheritPlanTemplate"],
      CopyAllowLog: json["CopyAllowLog"],
      inheritUDAs: json["inheritUDAs"],
    );
  }

  toJson() {
    var map = new Map<String, dynamic>();
    map["typeName"] = typeName;
    map["recId"] = recId;
    map["typeName"] = typeName;
    map["typesUda"] = typesUda;
    map["objects"] = objects;
    map["sLAProfileId"] = sLAProfileId;
    map["im_show_customer_info"] = im_show_customer_info;
    map["im_show_user_info"] = im_show_user_info;
    map["im_show_loginuser_info"] = im_show_loginuser_info;
    map["im_show_asisgn_info"] = im_show_asisgn_info;
    map["im_show_fault_info"] = im_show_fault_info;
    map["im_show_rootcuause_info"] = im_show_rootcuause_info;
    map["im_show_more_info"] = im_show_more_info;
//    map["status"] = status;
    map["dashboardOption"] = dashboardOption;
//    map["groupValue"] = groupValue;
    map["groupValueHelper"] = groupValueHelper;
    map["sumField"] = sumField;
    map["isHeaderHidden"] = isHeaderHidden;
    map["isShowdashboard"] = isShowdashboard;
    map["isCount"] = isCount;
    map["isSum"] = isSum;
    map["dashboardCondition"] = dashboardCondition;
    map["DisbaleStatus"] = DisbaleStatus;
    map["ShowTaskStatusInMonitor"] = ShowTaskStatusInMonitor;
//    map["parentType"] = parentType;
    map["enableLog"] = enableLog;
//    map["isDeleted"] = isDeleted;
    map["linkToTaskView"] = linkToTaskView;
    map["InheritRule"] = InheritRule;
    map["InheritPlanTemplate"] = InheritPlanTemplate;
    map["CopyAllowLog"] = CopyAllowLog;
    map["inheritUDAs"] = inheritUDAs;

    return map;
  }
}

abstract class ModuleTypesRepository {
  Future<List<Types>> getModuleTypes(
      String moduleId, context, http.Client client, int typeMode);
}

List<Types> parseTypes(String body) {
  final parsed = json.decode(body).cast<Map<String, dynamic>>();
  return parsed.map<Types>((json) => Types.fromJson(json)).toList();
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}
