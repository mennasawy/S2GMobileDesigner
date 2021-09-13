// To parse this JSON data, do
//
//     final assignmentInfoSaveBody = assignmentInfoSaveBodyFromJson(jsonString);

import 'dart:convert';

class AssignmentInfoSaveBody {
  AssignmentInfoSaveBody({
    this.tableName,
    this.udasValues,
    this.name,
    this.recId,
    this.type,
    this.typeId,
    this.statusName,
    this.statusId,
    this.typeObjectId,
    this.genericObjectId,
  });

  String tableName;
  List<UdasValue> udasValues;
  String name;
  int recId;
  Type type;
  int typeId;
  String statusName;
  int statusId;
  int typeObjectId;
  String genericObjectId;

  factory AssignmentInfoSaveBody.fromRawJson(String str) => AssignmentInfoSaveBody.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AssignmentInfoSaveBody.fromJson(Map<String, dynamic> json) => AssignmentInfoSaveBody(
    tableName: json["table_Name"],
    udasValues: List<UdasValue>.from(json["udasValues"].map((x) => UdasValue.fromJson(x))),
    name: json["name"],
    recId: json["recId"],
    type: Type.fromJson(json["type"]),
    typeId: json["typeId"],
    statusName: json["statusName"],
    statusId: json["statusId"],
    typeObjectId: json["typeObjectId"],
    genericObjectId: json["GenericObjectId"],
  );

  Map<String, dynamic> toJson() => {
    "table_Name": tableName,
    "udasValues": List<dynamic>.from(udasValues.map((x) => x.toJson())),
    "name": name,
    "recId": recId,
    "type": type.toJson(),
    "typeId": typeId,
    "statusName": statusName,
    "statusId": statusId,
    "typeObjectId": typeObjectId,
    "GenericObjectId": genericObjectId,
  };
}

class Type {
  Type({
    this.recId,
  });

  int recId;

  factory Type.fromRawJson(String str) => Type.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Type.fromJson(Map<String, dynamic> json) => Type(
    recId: json["recId"],
  );

  Map<String, dynamic> toJson() => {
    "recId": recId,
  };
}

class UdasValue {
  UdasValue({
    this.id,
    this.udaTableExists,
    this.recId,
    this.udaTableName,
    this.udaFormOption,
    this.visibleCondition,
    this.normalCondition,
    this.readOnlyCondition,
    this.valiedCondition,
    this.addedMessage,
    this.defaultValue,
    this.isMandatoryCondition,
    this.udaCaption,
    this.udaName,
    this.udaType,
    this.udaPanelCaption,
    this.udaPanelId,
    this.multipleLevelRepository,
    this.objectId,
    this.udaOrder,
    this.ispublic,
    this.appearInMonitor,
    this.appearInForm,
    this.sourceOperationId,
    this.sourceOperationDataId,
    this.bindDataId,
    this.relatedValueListId,
    this.valueListConditionDb,
    this.visableType,
    this.sizeofdiv,
    this.repositoriesInfo,
    this.multiValues,
    this.associatedTypesId,
    this.dateTypes,
    this.repositoryUda,
    this.calulatedUda,
    this.isAssignmentInfo,
    this.allowManual,
    this.appearInDialog,
    this.copyTemplate,
    this.processTemplate,
    this.autoIdPreFix,
    this.autoIdNumDigits,
    this.enableUdaLog,
    this.allowReAssign,
    this.privilegeIsPublic,
    this.showMemper,
    this.udaId,
    this.parentUdaName,
    this.subFormUdAsList,
    this.appearInSearch,
    this.editableValueList,
    this.acceptHtml,
    this.udaDescription,
    this.qrCode,
    this.isDeleted,
    this.udaVisibility,
    this.calculatedVisibleType,
    this.rowData,
    this.isUdaActive,
    this.columnDefs,
    this.levelRepositoryFields,
    this.aiComp,
    this.aiOrga,
    this.aiGroup,
    this.aiMem,
    this.assignedMemberDto,
  });

  String id;
  bool udaTableExists;
  int recId;
  String udaTableName;
  dynamic udaFormOption;
  dynamic visibleCondition;
  dynamic normalCondition;
  dynamic readOnlyCondition;
  dynamic valiedCondition;
  dynamic addedMessage;
  dynamic defaultValue;
  dynamic isMandatoryCondition;
  String udaCaption;
  String udaName;
  int udaType;
  String udaPanelCaption;
  int udaPanelId;
  MultipleRepository multipleLevelRepository;
  int objectId;
  int udaOrder;
  bool ispublic;
  bool appearInMonitor;
  bool appearInForm;
  dynamic sourceOperationId;
  dynamic sourceOperationDataId;
  dynamic bindDataId;
  dynamic relatedValueListId;
  dynamic valueListConditionDb;
  int visableType;
  int sizeofdiv;
  dynamic repositoriesInfo;
  List<dynamic> multiValues;
  dynamic associatedTypesId;
  int dateTypes;
  dynamic repositoryUda;
  dynamic calulatedUda;
  dynamic isAssignmentInfo;
  bool allowManual;
  dynamic appearInDialog;
  bool copyTemplate;
  dynamic processTemplate;
  dynamic autoIdPreFix;
  dynamic autoIdNumDigits;
  bool enableUdaLog;
  bool allowReAssign;
  bool privilegeIsPublic;
  bool showMemper;
  int udaId;
  dynamic parentUdaName;
  dynamic subFormUdAsList;
  bool appearInSearch;
  dynamic editableValueList;
  dynamic acceptHtml;
  dynamic udaDescription;
  bool qrCode;
  bool isDeleted;
  bool udaVisibility;
  int calculatedVisibleType;
  List<dynamic> rowData;
  bool isUdaActive;
  List<ColumnDef> columnDefs;
  List<LevelRepositoryField> levelRepositoryFields;
  String aiComp;
  String aiOrga;
  String aiGroup;
  String aiMem;
  AssignedMemberDto assignedMemberDto;

  factory UdasValue.fromRawJson(String str) => UdasValue.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UdasValue.fromJson(Map<String, dynamic> json) => UdasValue(
    id: json["@id"],
    udaTableExists: json["udaTableExists"],
    recId: json["recId"],
    udaTableName: json["udaTableName"],
    udaFormOption: json["udaFormOption"],
    visibleCondition: json["visibleCondition"],
    normalCondition: json["normalCondition"],
    readOnlyCondition: json["readOnlyCondition"],
    valiedCondition: json["valiedCondition"],
    addedMessage: json["addedMessage"],
    defaultValue: json["defaultValue"],
    isMandatoryCondition: json["isMandatoryCondition"],
    udaCaption: json["udaCaption"],
    udaName: json["udaName"],
    udaType: json["udaType"],
    udaPanelCaption: json["udaPanelCaption"],
    udaPanelId: json["udaPanelID"],
    multipleLevelRepository: json["multipleLevelRepository"] == null ? null : MultipleRepository.fromJson(json["multipleLevelRepository"]),
    objectId: json["object_id"],
    udaOrder: json["udaOrder"],
    ispublic: json["ispublic"],
    appearInMonitor: json["AppearInMonitor"],
    appearInForm: json["AppearInForm"],
    sourceOperationId: json["sourceOperationId"],
    sourceOperationDataId: json["sourceOperationDataId"],
    bindDataId: json["bindDataId"],
    relatedValueListId: json["relatedValueListId"],
    valueListConditionDb: json["valueListConditionDB"],
    visableType: json["visableType"],
    sizeofdiv: json["sizeofdiv"],
    repositoriesInfo: json["repositoriesInfo"],
    multiValues: List<dynamic>.from(json["multiValues"].map((x) => x)),
    associatedTypesId: json["associatedTypesId"],
    dateTypes: json["dateTypes"],
    repositoryUda: json["repositoryUDA"],
    calulatedUda: json["calulatedUda"],
    isAssignmentInfo: json["isAssignmentInfo"],
    allowManual: json["allowManual"],
    appearInDialog: json["appearInDialog"],
    copyTemplate: json["copyTemplate"],
    processTemplate: json["processTemplate"],
    autoIdPreFix: json["autoIDPreFix"],
    autoIdNumDigits: json["autoIDNumDigits"],
    enableUdaLog: json["enableUdaLog"],
    allowReAssign: json["allowReAssign"],
    privilegeIsPublic: json["privilegeIsPublic"],
    showMemper: json["showMemper"],
    udaId: json["udaId"],
    parentUdaName: json["parentUdaName"],
    subFormUdAsList: json["SubFormUDAsList"],
    appearInSearch: json["appearInSearch"],
    editableValueList: json["editableValueList"],
    acceptHtml: json["acceptHtml"],
    udaDescription: json["udaDescription"],
    qrCode: json["qrCode"],
    isDeleted: json["isDeleted"],
    udaVisibility: json["udaVisibility"],
    calculatedVisibleType: json["calculatedVisibleType"],
    rowData: json["rowData"] == null ? null : List<dynamic>.from(json["rowData"].map((x) => x)),
    isUdaActive: json["IsUdaActive"],
    columnDefs: json["columnDefs"] == null ? null : List<ColumnDef>.from(json["columnDefs"].map((x) => ColumnDef.fromJson(x))),
    levelRepositoryFields: json["levelRepositoryFields"] == null ? null : List<LevelRepositoryField>.from(json["levelRepositoryFields"].map((x) => LevelRepositoryField.fromJson(x))),
    aiComp: json["ai_Comp"] == null ? null : json["ai_Comp"],
    aiOrga: json["ai_Orga"] == null ? null : json["ai_Orga"],
    aiGroup: json["ai_Group"] == null ? null : json["ai_Group"],
    aiMem: json["ai_Mem"] == null ? null : json["ai_Mem"],
    assignedMemberDto: json["assignedMemberDTO"] == null ? null : AssignedMemberDto.fromJson(json["assignedMemberDTO"]),
  );

  Map<String, dynamic> toJson() => {
    "@id": id,
    "udaTableExists": udaTableExists,
    "recId": recId,
    "udaTableName": udaTableName,
    "udaFormOption": udaFormOption,
    "visibleCondition": visibleCondition,
    "normalCondition": normalCondition,
    "readOnlyCondition": readOnlyCondition,
    "valiedCondition": valiedCondition,
    "addedMessage": addedMessage,
    "defaultValue": defaultValue,
    "isMandatoryCondition": isMandatoryCondition,
    "udaCaption": udaCaption,
    "udaName": udaName,
    "udaType": udaType,
    "udaPanelCaption": udaPanelCaption,
    "udaPanelID": udaPanelId,
    "multipleLevelRepository": multipleLevelRepository == null ? null : multipleLevelRepository.toJson(),
    "object_id": objectId,
    "udaOrder": udaOrder,
    "ispublic": ispublic,
    "AppearInMonitor": appearInMonitor,
    "AppearInForm": appearInForm,
    "sourceOperationId": sourceOperationId,
    "sourceOperationDataId": sourceOperationDataId,
    "bindDataId": bindDataId,
    "relatedValueListId": relatedValueListId,
    "valueListConditionDB": valueListConditionDb,
    "visableType": visableType,
    "sizeofdiv": sizeofdiv,
    "repositoriesInfo": repositoriesInfo,
    "multiValues": List<dynamic>.from(multiValues.map((x) => x)),
    "associatedTypesId": associatedTypesId,
    "dateTypes": dateTypes,
    "repositoryUDA": repositoryUda,
    "calulatedUda": calulatedUda,
    "isAssignmentInfo": isAssignmentInfo,
    "allowManual": allowManual,
    "appearInDialog": appearInDialog,
    "copyTemplate": copyTemplate,
    "processTemplate": processTemplate,
    "autoIDPreFix": autoIdPreFix,
    "autoIDNumDigits": autoIdNumDigits,
    "enableUdaLog": enableUdaLog,
    "allowReAssign": allowReAssign,
    "privilegeIsPublic": privilegeIsPublic,
    "showMemper": showMemper,
    "udaId": udaId,
    "parentUdaName": parentUdaName,
    "SubFormUDAsList": subFormUdAsList,
    "appearInSearch": appearInSearch,
    "editableValueList": editableValueList,
    "acceptHtml": acceptHtml,
    "udaDescription": udaDescription,
    "qrCode": qrCode,
    "isDeleted": isDeleted,
    "udaVisibility": udaVisibility,
    "calculatedVisibleType": calculatedVisibleType,
    "rowData": rowData == null ? null : List<dynamic>.from(rowData.map((x) => x)),
    "IsUdaActive": isUdaActive,
    "columnDefs": columnDefs == null ? null : List<dynamic>.from(columnDefs.map((x) => x.toJson())),
    "levelRepositoryFields": levelRepositoryFields == null ? null : List<dynamic>.from(levelRepositoryFields.map((x) => x.toJson())),
    "ai_Comp": aiComp == null ? null : aiComp,
    "ai_Orga": aiOrga == null ? null : aiOrga,
    "ai_Group": aiGroup == null ? null : aiGroup,
    "ai_Mem": aiMem == null ? null : aiMem,
    "assignedMemberDTO": assignedMemberDto == null ? null : assignedMemberDto.toJson(),
  };
}

class AssignedMemberDto {
  AssignedMemberDto({
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

  factory AssignedMemberDto.fromRawJson(String str) => AssignedMemberDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AssignedMemberDto.fromJson(Map<String, dynamic> json) => AssignedMemberDto(
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

class ColumnDef {
  ColumnDef({
    this.headerName,
    this.field,
    this.width,
  });

  String headerName;
  String field;
  int width;

  factory ColumnDef.fromRawJson(String str) => ColumnDef.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ColumnDef.fromJson(Map<String, dynamic> json) => ColumnDef(
    headerName: json["headerName"],
    field: json["field"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "headerName": headerName,
    "field": field,
    "width": width,
  };
}

class LevelRepositoryField {
  LevelRepositoryField({
    this.caption,
    this.name,
    this.width,
    this.seq,
    this.type,
    this.recId,
    this.calculatedField,
    this.repository,
    this.columnAccessibility,
    this.multipleRepository,
    this.hidden,
    this.objectId,
    this.formOption,
    this.field,
    this.systemField,
    this.process,
  });

  String caption;
  String name;
  int width;
  int seq;
  int type;
  int recId;
  dynamic calculatedField;
  dynamic repository;
  int columnAccessibility;
  MultipleRepository multipleRepository;
  bool hidden;
  dynamic objectId;
  dynamic formOption;
  dynamic field;
  dynamic systemField;
  dynamic process;

  factory LevelRepositoryField.fromRawJson(String str) => LevelRepositoryField.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LevelRepositoryField.fromJson(Map<String, dynamic> json) => LevelRepositoryField(
    caption: json["caption"],
    name: json["name"],
    width: json["width"],
    seq: json["seq"],
    type: json["type"],
    recId: json["recId"] == null ? null : json["recId"],
    calculatedField: json["calculatedField"],
    repository: json["repository"],
    columnAccessibility: json["columnAccessibility"] == null ? null : json["columnAccessibility"],
    multipleRepository: json["multipleRepository"] == null ? null : MultipleRepository.fromJson(json["multipleRepository"]),
    hidden: json["hidden"] == null ? null : json["hidden"],
    objectId: json["object_id"],
    formOption: json["formOption"],
    field: json["field"],
    systemField: json["systemField"],
    process: json["process"],
  );

  Map<String, dynamic> toJson() => {
    "caption": caption,
    "name": name,
    "width": width,
    "seq": seq,
    "type": type,
    "recId": recId == null ? null : recId,
    "calculatedField": calculatedField,
    "repository": repository,
    "columnAccessibility": columnAccessibility == null ? null : columnAccessibility,
    "multipleRepository": multipleRepository == null ? null : multipleRepository.toJson(),
    "hidden": hidden == null ? null : hidden,
    "object_id": objectId,
    "formOption": formOption,
    "field": field,
    "systemField": systemField,
    "process": process,
  };
}

class MultipleRepository {
  MultipleRepository({
    this.recId,
    this.repositoryName,
    this.repositoryTableName,
    this.privilegeTableName,
    this.numberOfLevels,
    this.allowPrice,
    this.allowCopyPlan,
    this.appId,
    this.objectId,
    this.typeId,
    this.planUdaId,
    this.tiresNames,
  });

  int recId;
  String repositoryName;
  String repositoryTableName;
  String privilegeTableName;
  int numberOfLevels;
  bool allowPrice;
  bool allowCopyPlan;
  dynamic appId;
  dynamic objectId;
  dynamic typeId;
  dynamic planUdaId;
  String tiresNames;

  factory MultipleRepository.fromRawJson(String str) => MultipleRepository.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MultipleRepository.fromJson(Map<String, dynamic> json) => MultipleRepository(
    recId: json["recId"],
    repositoryName: json["repositoryName"],
    repositoryTableName: json["repositoryTableName"],
    privilegeTableName: json["privilegeTableName"],
    numberOfLevels: json["numberOfLevels"],
    allowPrice: json["allowPrice"],
    allowCopyPlan: json["allowCopyPlan"],
    appId: json["AppId"],
    objectId: json["objectId"],
    typeId: json["typeId"],
    planUdaId: json["planUdaId"],
    tiresNames: json["tiresNames"],
  );

  Map<String, dynamic> toJson() => {
    "recId": recId,
    "repositoryName": repositoryName,
    "repositoryTableName": repositoryTableName,
    "privilegeTableName": privilegeTableName,
    "numberOfLevels": numberOfLevels,
    "allowPrice": allowPrice,
    "allowCopyPlan": allowCopyPlan,
    "AppId": appId,
    "objectId": objectId,
    "typeId": typeId,
    "planUdaId": planUdaId,
    "tiresNames": tiresNames,
  };
}
