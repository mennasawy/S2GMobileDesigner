// To parse this JSON data, do
//
//     final assignmentInfoSave = assignmentInfoSaveFromJson(jsonString);

import 'dart:convert';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/AssignmentInfo/editAssignmentInfo.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/AssignmentInfo/saveAssignmentInfoBody.dart';
import 'package:flutter/material.dart';

class AssignmentInfoSaveEditResponse {
  AssignmentInfoSaveEditResponse({
    this.createdBy,
    this.createdById,
    this.createdDate,
    this.name,
    this.recId,
    this.statusId,
    this.genericObjectId,
    this.statusName,
    this.typeId,
    this.parentTypeId,
    this.templateId,
    this.tableName,
    this.typeName,
    this.udasValues,
    this.updatedBy,
    this.updatedbyById,
    this.updatedDate,
    this.statusLastChangeDate,
    this.groups,
    this.groupId,
    this.slaObjects,
    this.ruleMessage,
    this.ruleFaild,
    this.isDeleted,
    this.preventSave,
    this.rowIndex,
    this.addingError,
    this.type,
    this.needToBeModified,
    this.customError,
  });

  String createdBy;
  String createdById;
  String createdDate;
  String name;
  int recId;
  int statusId;
  int genericObjectId;
  String statusName;
  int typeId;
  int parentTypeId;
  int templateId;
  String tableName;
  dynamic typeName;
  List<UdasValue> udasValues;
  dynamic updatedBy;
  dynamic updatedbyById;
  dynamic updatedDate;
  String statusLastChangeDate;
  dynamic groups;
  int groupId;
  List<dynamic> slaObjects;
  dynamic ruleMessage;
  bool ruleFaild;
  bool isDeleted;
  bool preventSave;
  int rowIndex;
  dynamic addingError;
  Type type;
  dynamic needToBeModified;
  dynamic customError;

  factory AssignmentInfoSaveEditResponse.fromRawJson(String str) =>
      AssignmentInfoSaveEditResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AssignmentInfoSaveEditResponse.fromJson(Map<String, dynamic> json) =>
      AssignmentInfoSaveEditResponse(
        createdBy: json["createdBy"],
        createdById: json["createdById"],
        createdDate: json["createdDate"],
        name: json["name"],
        recId: json["recId"],
        statusId: json["statusId"],
        genericObjectId: json["GenericObjectId"],
        statusName: json["statusName"],
        typeId: json["typeId"],
        parentTypeId: json["parentTypeId"],
        templateId: json["templateId"],
        tableName: json["table_Name"],
        typeName: json["typeName"],
        udasValues: List<UdasValue>.from(
            json["udasValues"].map((x) => UdasValue.fromJson(x))),
        updatedBy: json["updatedBy"],
        updatedbyById: json["updatedbyById"],
        updatedDate: json["updatedDate"],
        statusLastChangeDate: json["statusLastChangeDate"],
        groups: json["groups"],
        groupId: json["groupId"],
        slaObjects: List<dynamic>.from(json["slaObjects"].map((x) => x)),
        ruleMessage: json["ruleMessage"],
        ruleFaild: json["ruleFaild"],
        isDeleted: json["isDeleted"],
        preventSave: json["preventSave"],
        rowIndex: json["rowIndex"],
        addingError: json["addingError"],
        type: Type.fromJson(json["type"]),
        needToBeModified: json["needToBeModified"],
        customError: json["customError"],
      );

  Map<String, dynamic> toJson() => {
        "createdBy": createdBy,
        "createdById": createdById,
        "createdDate": createdDate,
        "name": name,
        "recId": recId,
        "statusId": statusId,
        "GenericObjectId": genericObjectId,
        "statusName": statusName,
        "typeId": typeId,
        "parentTypeId": parentTypeId,
        "templateId": templateId,
        "table_Name": tableName,
        "typeName": typeName,
        "udasValues": List<dynamic>.from(udasValues.map((x) => x.toJson())),
        "updatedBy": updatedBy,
        "updatedbyById": updatedbyById,
        "updatedDate": updatedDate,
        "statusLastChangeDate": statusLastChangeDate,
        "groups": groups,
        "groupId": groupId,
        "slaObjects": List<dynamic>.from(slaObjects.map((x) => x)),
        "ruleMessage": ruleMessage,
        "ruleFaild": ruleFaild,
        "isDeleted": isDeleted,
        "preventSave": preventSave,
        "rowIndex": rowIndex,
        "addingError": addingError,
        "type": type.toJson(),
        "needToBeModified": needToBeModified,
        "customError": customError,
      };
}

AssignmentInfoSaveEditResponse parseAssignmentInfo(String body) {
  return AssignmentInfoSaveEditResponse.fromRawJson(body);
}

class Type {
  Type({
    this.recId,
    this.typeName,
    this.objects,
    this.sLaProfileId,
    this.imShowCustomerInfo,
    this.imShowUserInfo,
    this.imShowLoginuserInfo,
    this.imShowAsisgnInfo,
    this.imShowFaultInfo,
    this.imShowRootcuauseInfo,
    this.imShowMoreInfo,
    this.status,
    this.emailConfiguration,
    this.isHeaderHidden,
    this.groupValue,
    this.groupValueHelper,
    this.disbaleStatus,
    this.parentType,
    this.inheritUdAs,
    this.enableLog,
    this.isDeleted,
    this.linkToTaskView,
    this.restrictedSecurity,
    this.addException,
    this.selectedRestrictedOption,
    this.shortCutOnDashboard,
    this.shortCutCaption,
    this.inheritRule,
    this.inheritPlanTemplate,
    this.copyAllowLog,
    this.copyMonitor,
    this.copyCreate,
    this.copyModify,
  });

  int recId;
  String typeName;
  Objects objects;
  dynamic sLaProfileId;
  int imShowCustomerInfo;
  int imShowUserInfo;
  int imShowLoginuserInfo;
  int imShowAsisgnInfo;
  int imShowFaultInfo;
  int imShowRootcuauseInfo;
  int imShowMoreInfo;
  dynamic status;
  dynamic emailConfiguration;
  bool isHeaderHidden;
  dynamic groupValue;
  dynamic groupValueHelper;
  int disbaleStatus;
  dynamic parentType;
  bool inheritUdAs;
  bool enableLog;
  bool isDeleted;
  bool linkToTaskView;
  bool restrictedSecurity;
  bool addException;
  int selectedRestrictedOption;
  bool shortCutOnDashboard;
  dynamic shortCutCaption;
  bool inheritRule;
  bool inheritPlanTemplate;
  dynamic copyAllowLog;
  dynamic copyMonitor;
  dynamic copyCreate;
  dynamic copyModify;

  factory Type.fromRawJson(String str) => Type.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        recId: json["recId"],
        typeName: json["typeName"],
        objects: Objects.fromJson(json["objects"]),
        sLaProfileId: json["sLAProfileId"],
        imShowCustomerInfo: json["im_show_customer_info"],
        imShowUserInfo: json["im_show_user_info"],
        imShowLoginuserInfo: json["im_show_loginuser_info"],
        imShowAsisgnInfo: json["im_show_asisgn_info"],
        imShowFaultInfo: json["im_show_fault_info"],
        imShowRootcuauseInfo: json["im_show_rootcuause_info"],
        imShowMoreInfo: json["im_show_more_info"],
        status: json["status"],
        emailConfiguration: json["emailConfiguration"],
        isHeaderHidden: json["isHeaderHidden"],
        groupValue: json["groupValue"],
        groupValueHelper: json["groupValueHelper"],
        disbaleStatus: json["DisbaleStatus"],
        parentType: json["parentType"],
        inheritUdAs: json["inheritUDAs"],
        enableLog: json["enableLog"],
        isDeleted: json["isDeleted"],
        linkToTaskView: json["linkToTaskView"],
        restrictedSecurity: json["restrictedSecurity"],
        addException: json["addException"],
        selectedRestrictedOption: json["selectedRestrictedOption"],
        shortCutOnDashboard: json["shortCutOnDashboard"],
        shortCutCaption: json["shortCutCaption"],
        inheritRule: json["InheritRule"],
        inheritPlanTemplate: json["InheritPlanTemplate"],
        copyAllowLog: json["CopyAllowLog"],
        copyMonitor: json["CopyMonitor"],
        copyCreate: json["CopyCreate"],
        copyModify: json["CopyModify"],
      );

  Map<String, dynamic> toJson() => {
        "recId": recId,
        "typeName": typeName,
        "objects": objects.toJson(),
        "sLAProfileId": sLaProfileId,
        "im_show_customer_info": imShowCustomerInfo,
        "im_show_user_info": imShowUserInfo,
        "im_show_loginuser_info": imShowLoginuserInfo,
        "im_show_asisgn_info": imShowAsisgnInfo,
        "im_show_fault_info": imShowFaultInfo,
        "im_show_rootcuause_info": imShowRootcuauseInfo,
        "im_show_more_info": imShowMoreInfo,
        "status": status,
        "emailConfiguration": emailConfiguration,
        "isHeaderHidden": isHeaderHidden,
        "groupValue": groupValue,
        "groupValueHelper": groupValueHelper,
        "DisbaleStatus": disbaleStatus,
        "parentType": parentType,
        "inheritUDAs": inheritUdAs,
        "enableLog": enableLog,
        "isDeleted": isDeleted,
        "linkToTaskView": linkToTaskView,
        "restrictedSecurity": restrictedSecurity,
        "addException": addException,
        "selectedRestrictedOption": selectedRestrictedOption,
        "shortCutOnDashboard": shortCutOnDashboard,
        "shortCutCaption": shortCutCaption,
        "InheritRule": inheritRule,
        "InheritPlanTemplate": inheritPlanTemplate,
        "CopyAllowLog": copyAllowLog,
        "CopyMonitor": copyMonitor,
        "CopyCreate": copyCreate,
        "CopyModify": copyModify,
      };
}

class Objects {
  Objects({
    this.recId,
    this.objectName,
    this.udaTableName,
    this.tableName,
    this.deleted,
    this.showDashboard,
    this.deletedBy,
    this.deletedAt,
    this.deletedPermenantly,
    this.deletedPermenantlyBy,
    this.deletedPermenantlyAt,
    this.hideHeader,
    this.rtlFlag,
    this.showTypes,
    this.objectRecId,
  });

  int recId;
  String objectName;
  String udaTableName;
  String tableName;
  dynamic deleted;
  bool showDashboard;
  dynamic deletedBy;
  dynamic deletedAt;
  dynamic deletedPermenantly;
  dynamic deletedPermenantlyBy;
  dynamic deletedPermenantlyAt;
  bool hideHeader;
  dynamic rtlFlag;
  dynamic showTypes;
  int objectRecId;

  factory Objects.fromRawJson(String str) => Objects.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Objects.fromJson(Map<String, dynamic> json) => Objects(
        recId: json["recId"],
        objectName: json["objectName"],
        udaTableName: json["udaTableName"],
        tableName: json["tableName"],
        deleted: json["deleted"],
        showDashboard: json["showDashboard"],
        deletedBy: json["deletedBy"],
        deletedAt: json["deletedAt"],
        deletedPermenantly: json["deletedPermenantly"],
        deletedPermenantlyBy: json["deletedPermenantlyBy"],
        deletedPermenantlyAt: json["deletedPermenantlyAt"],
        hideHeader: json["hideHeader"],
        rtlFlag: json["rtlFlag"],
        showTypes: json["showTypes"],
        objectRecId: json["objectRecId"],
      );

  Map<String, dynamic> toJson() => {
        "recId": recId,
        "objectName": objectName,
        "udaTableName": udaTableName,
        "tableName": tableName,
        "deleted": deleted,
        "showDashboard": showDashboard,
        "deletedBy": deletedBy,
        "deletedAt": deletedAt,
        "deletedPermenantly": deletedPermenantly,
        "deletedPermenantlyBy": deletedPermenantlyBy,
        "deletedPermenantlyAt": deletedPermenantlyAt,
        "hideHeader": hideHeader,
        "rtlFlag": rtlFlag,
        "showTypes": showTypes,
        "objectRecId": objectRecId,
      };
}

class UdasValue {
  UdasValue({
    this.recId,
    this.udaName,
    this.udaType,
    this.udaFormOption,
    this.visibleCondition,
    this.normalCondition,
    this.readOnlyCondition,
    this.isMandatoryCondition,
    this.udaPanelCaption,
    this.udaPanelId,
    this.udaValue,
    this.attachemnts,
    this.formObject,
    this.rowData,
    this.fields,
    this.levelRepositoryFields,
    this.returnedRowData,
    this.notesList,
    this.multiValues,
    this.associatedObjects,
    this.associatedTypesId,
    this.selectedObj,
    this.objectId,
    this.sizeofdiv,
    this.readOnly,
    this.udaOrder,
    this.udaCaption,
    this.dateTypes,
    this.valueListCondition,
    this.valueListConditionDb,
    this.sourceOperationId,
    this.sourceOperationDataId,
    this.bindDataId,
    this.relatedValueListId,
    this.repositoryUda,
    this.calulatedUda,
    this.aiComp,
    this.aiOrga,
    this.aiGroup,
    this.aiMem,
    this.assignedMemberDto,
    this.allowManual,
    this.copyTemplate,
    this.autoIdPreFix,
    this.autoIdNumDigits,
    this.enableUdaLog,
    this.processTemplate,
    this.udaTableName,
    this.ispublic,
    this.visableType,
    this.calculatedVisibleType,
    this.typesUdasGroups,
    this.allowReAssign,
    this.privilegeIsPublic,
    this.udaId,
    this.subFormUdAsList,
    this.subFormRowId,
    this.defaultValue,
    this.typeId,
    this.showMemper,
    this.repositoriesInfo,
    this.valiedCondition,
    this.addedMessage,
  });

  int recId;
  String udaName;
  int udaType;
  dynamic udaFormOption;
  dynamic visibleCondition;
  dynamic normalCondition;
  dynamic readOnlyCondition;
  dynamic isMandatoryCondition;
  String udaPanelCaption;
  int udaPanelId;
  dynamic udaValue;
  dynamic attachemnts;
  FormObject formObject;
  List<dynamic> rowData;
  List<dynamic> fields;
  List<dynamic> levelRepositoryFields;
  dynamic returnedRowData;
  dynamic notesList;
  dynamic multiValues;
  dynamic associatedObjects;
  dynamic associatedTypesId;
  dynamic selectedObj;
  int objectId;
  int sizeofdiv;
  int readOnly;
  int udaOrder;
  String udaCaption;
  int dateTypes;
  dynamic valueListCondition;
  dynamic valueListConditionDb;
  dynamic sourceOperationId;
  dynamic sourceOperationDataId;
  dynamic bindDataId;
  dynamic relatedValueListId;
  dynamic repositoryUda;
  dynamic calulatedUda;
  String aiComp;
  String aiOrga;
  String aiGroup;
  String aiMem;
  AssignedMemberDto assignedMemberDto;
  bool allowManual;
  bool copyTemplate;
  dynamic autoIdPreFix;
  int autoIdNumDigits;
  bool enableUdaLog;
  dynamic processTemplate;
  String udaTableName;
  bool ispublic;
  int visableType;
  dynamic calculatedVisibleType;
  List<dynamic> typesUdasGroups;
  bool allowReAssign;
  bool privilegeIsPublic;
  int udaId;
  dynamic subFormUdAsList;
  int subFormRowId;
  dynamic defaultValue;
  int typeId;
  bool showMemper;
  dynamic repositoriesInfo;
  dynamic valiedCondition;
  dynamic addedMessage;

  factory UdasValue.fromRawJson(String str) =>
      UdasValue.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UdasValue.fromJson(Map<String, dynamic> json) => UdasValue(
        recId: json["recId"],
        udaName: json["udaName"],
        udaType: json["udaType"],
        udaFormOption: json["udaFormOption"],
        visibleCondition: json["visibleCondition"],
        normalCondition: json["normalCondition"],
        readOnlyCondition: json["readOnlyCondition"],
        isMandatoryCondition: json["isMandatoryCondition"],
        udaPanelCaption: json["udaPanelCaption"],
        udaPanelId: json["udaPanelID"],
        udaValue: json["udaValue"],
        attachemnts: json["attachemnts"],
        formObject: FormObject.fromJson(json["formObject"]),
        rowData: List<dynamic>.from(json["rowData"].map((x) => x)),
        fields: List<dynamic>.from(json["fields"].map((x) => x)),
        levelRepositoryFields:
            List<dynamic>.from(json["levelRepositoryFields"].map((x) => x)),
        returnedRowData: json["returnedRowData"],
        notesList: json["notesList"],
        multiValues: json["multiValues"],
        associatedObjects: json["associatedObjects"],
        associatedTypesId: json["associatedTypesId"],
        selectedObj: json["selectedObj"],
        objectId: json["object_id"],
        sizeofdiv: json["sizeofdiv"],
        readOnly: json["readOnly"],
        udaOrder: json["udaOrder"],
        udaCaption: json["udaCaption"],
        dateTypes: json["dateTypes"],
        valueListCondition: json["valueListCondition"],
        valueListConditionDb: json["valueListConditionDB"],
        sourceOperationId: json["sourceOperationId"],
        sourceOperationDataId: json["sourceOperationDataId"],
        bindDataId: json["bindDataId"],
        relatedValueListId: json["relatedValueListId"],
        repositoryUda: json["repositoryUDA"],
        calulatedUda: json["calulatedUda"],
        aiComp: json["ai_Comp"] == null ? null : json["ai_Comp"],
        aiOrga: json["ai_Orga"] == null ? null : json["ai_Orga"],
        aiGroup: json["ai_Group"] == null ? null : json["ai_Group"],
        aiMem: json["ai_Mem"] == null ? null : json["ai_Mem"],
        assignedMemberDto: json["assignedMemberDTO"] == null
            ? null
            : AssignedMemberDto.fromJson(json["assignedMemberDTO"]),
        allowManual: json["allowManual"],
        copyTemplate: json["copyTemplate"],
        autoIdPreFix: json["autoIDPreFix"],
        autoIdNumDigits: json["autoIDNumDigits"],
        enableUdaLog: json["enableUdaLog"],
        processTemplate: json["processTemplate"],
        udaTableName: json["udaTableName"],
        ispublic: json["ispublic"],
        visableType: json["visableType"],
        calculatedVisibleType: json["calculatedVisibleType"],
        typesUdasGroups:
            List<dynamic>.from(json["typesUdasGroups"].map((x) => x)),
        allowReAssign: json["allowReAssign"],
        privilegeIsPublic: json["privilegeIsPublic"],
        udaId: json["udaId"],
        subFormUdAsList: json["SubFormUDAsList"],
        subFormRowId: json["subFormRowId"],
        defaultValue: json["defaultValue"],
        typeId: json["typeId"],
        showMemper: json["showMemper"],
        repositoriesInfo: json["repositoriesInfo"],
        valiedCondition: json["valiedCondition"],
        addedMessage: json["addedMessage"],
      );

  Map<String, dynamic> toJson() => {
        "recId": recId,
        "udaName": udaName,
        "udaType": udaType,
        "udaFormOption": udaFormOption,
        "visibleCondition": visibleCondition,
        "normalCondition": normalCondition,
        "readOnlyCondition": readOnlyCondition,
        "isMandatoryCondition": isMandatoryCondition,
        "udaPanelCaption": udaPanelCaption,
        "udaPanelID": udaPanelId,
        "udaValue": udaValue,
        "attachemnts": attachemnts,
        "formObject": formObject.toJson(),
        "rowData": List<dynamic>.from(rowData.map((x) => x)),
        "fields": List<dynamic>.from(fields.map((x) => x)),
        "levelRepositoryFields":
            List<dynamic>.from(levelRepositoryFields.map((x) => x)),
        "returnedRowData": returnedRowData,
        "notesList": notesList,
        "multiValues": multiValues,
        "associatedObjects": associatedObjects,
        "associatedTypesId": associatedTypesId,
        "selectedObj": selectedObj,
        "object_id": objectId,
        "sizeofdiv": sizeofdiv,
        "readOnly": readOnly,
        "udaOrder": udaOrder,
        "udaCaption": udaCaption,
        "dateTypes": dateTypes,
        "valueListCondition": valueListCondition,
        "valueListConditionDB": valueListConditionDb,
        "sourceOperationId": sourceOperationId,
        "sourceOperationDataId": sourceOperationDataId,
        "bindDataId": bindDataId,
        "relatedValueListId": relatedValueListId,
        "repositoryUDA": repositoryUda,
        "calulatedUda": calulatedUda,
        "ai_Comp": aiComp == null ? null : aiComp,
        "ai_Orga": aiOrga == null ? null : aiOrga,
        "ai_Group": aiGroup == null ? null : aiGroup,
        "ai_Mem": aiMem == null ? null : aiMem,
        "assignedMemberDTO":
            assignedMemberDto == null ? null : assignedMemberDto.toJson(),
        "allowManual": allowManual,
        "copyTemplate": copyTemplate,
        "autoIDPreFix": autoIdPreFix,
        "autoIDNumDigits": autoIdNumDigits,
        "enableUdaLog": enableUdaLog,
        "processTemplate": processTemplate,
        "udaTableName": udaTableName,
        "ispublic": ispublic,
        "visableType": visableType,
        "calculatedVisibleType": calculatedVisibleType,
        "typesUdasGroups": List<dynamic>.from(typesUdasGroups.map((x) => x)),
        "allowReAssign": allowReAssign,
        "privilegeIsPublic": privilegeIsPublic,
        "udaId": udaId,
        "SubFormUDAsList": subFormUdAsList,
        "subFormRowId": subFormRowId,
        "defaultValue": defaultValue,
        "typeId": typeId,
        "showMemper": showMemper,
        "repositoriesInfo": repositoriesInfo,
        "valiedCondition": valiedCondition,
        "addedMessage": addedMessage,
      };
}

class AssignedMemberDto {
  AssignedMemberDto({
    this.assignMemberUserName,
    this.assignMemberPhone,
    this.assignMemberEmail,
    this.assignMemManagerName,
    this.assignMemManagerUserName,
    this.assignMemManagerPhone,
    this.assignMemMangEmail,
    this.assignMemFirstName,
    this.assignMemLastName,
  });

  String assignMemberUserName;
  String assignMemberPhone;
  String assignMemberEmail;
  dynamic assignMemManagerName;
  dynamic assignMemManagerUserName;
  dynamic assignMemManagerPhone;
  dynamic assignMemMangEmail;
  dynamic assignMemFirstName;
  dynamic assignMemLastName;

  factory AssignedMemberDto.fromRawJson(String str) =>
      AssignedMemberDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AssignedMemberDto.fromJson(Map<String, dynamic> json) =>
      AssignedMemberDto(
        assignMemberUserName: json["assignMemberUserName"],
        assignMemberPhone: json["assignMemberPhone"],
        assignMemberEmail: json["assignMemberEmail"],
        assignMemManagerName: json["assignMemManagerName"],
        assignMemManagerUserName: json["assignMemManagerUserName"],
        assignMemManagerPhone: json["assignMemManagerPhone"],
        assignMemMangEmail: json["assignMemMangEmail"],
        assignMemFirstName: json["assignMemFirstName"],
        assignMemLastName: json["assignMemLastName"],
      );

  Map<String, dynamic> toJson() => {
        "assignMemberUserName": assignMemberUserName,
        "assignMemberPhone": assignMemberPhone,
        "assignMemberEmail": assignMemberEmail,
        "assignMemManagerName": assignMemManagerName,
        "assignMemManagerUserName": assignMemManagerUserName,
        "assignMemManagerPhone": assignMemManagerPhone,
        "assignMemMangEmail": assignMemMangEmail,
        "assignMemFirstName": assignMemFirstName,
        "assignMemLastName": assignMemLastName,
      };
}

class FormObject {
  FormObject();

  factory FormObject.fromRawJson(String str) =>
      FormObject.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FormObject.fromJson(Map<String, dynamic> json) => FormObject();

  Map<String, dynamic> toJson() => {};
}

abstract class IAssignmentInfoSaveEditRepository {
  Future<AssignmentInfoSaveEditResponse> saveAssignmentInfo(
      BuildContext context, AssignmentInfoSaveBody assignmentInfoSaveBody);

  Future<AssignmentInfoSaveEditResponse> editAssignmentInfo(
      BuildContext context, AssignmentInfoEditBody assignmentInfoEditBody);
}
