// To parse this JSON data, do
//
//     final assignmentInfoEditBody = assignmentInfoEditBodyFromJson(jsonString);

import 'dart:convert';

class AssignmentInfoEditBody {
    AssignmentInfoEditBody({
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
        this.typeObjectId,
    });

    String createdBy;
    String createdById;
    String createdDate;
    String name;
    int recId;
    int statusId;
    String genericObjectId;
    String statusName;
    int typeId;
    int parentTypeId;
    int templateId;
    String tableName;
    String typeName;
    List<UdasValue> udasValues;
    String updatedBy;
    String updatedbyById;
    String updatedDate;
    String statusLastChangeDate;
    dynamic groups;
    int groupId;
    dynamic slaObjects;
    dynamic ruleMessage;
    bool ruleFaild;
    bool isDeleted;
    bool preventSave;
    int rowIndex;
    dynamic addingError;
    Type type;
    dynamic needToBeModified;
    dynamic customError;
    String typeObjectId;

    factory AssignmentInfoEditBody.fromRawJson(String str) => AssignmentInfoEditBody.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AssignmentInfoEditBody.fromJson(Map<String, dynamic> json) => AssignmentInfoEditBody(
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
        udasValues: List<UdasValue>.from(json["udasValues"].map((x) => UdasValue.fromJson(x))),
        updatedBy: json["updatedBy"],
        updatedbyById: json["updatedbyById"],
        updatedDate: json["updatedDate"],
        statusLastChangeDate: json["statusLastChangeDate"],
        groups: json["groups"],
        groupId: json["groupId"],
        slaObjects: json["slaObjects"],
        ruleMessage: json["ruleMessage"],
        ruleFaild: json["ruleFaild"],
        isDeleted: json["isDeleted"],
        preventSave: json["preventSave"],
        rowIndex: json["rowIndex"],
        addingError: json["addingError"],
        type: Type.fromJson(json["type"]),
        needToBeModified: json["needToBeModified"],
        customError: json["customError"],
        typeObjectId: json["typeObjectId"],
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
        "slaObjects": slaObjects,
        "ruleMessage": ruleMessage,
        "ruleFaild": ruleFaild,
        "isDeleted": isDeleted,
        "preventSave": preventSave,
        "rowIndex": rowIndex,
        "addingError": addingError,
        "type": type.toJson(),
        "needToBeModified": needToBeModified,
        "customError": customError,
        "typeObjectId": typeObjectId,
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
        this.udaVisibility,
        this.columnDefs,
        this.isUdaActive,
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
    List<LevelRepositoryField> levelRepositoryFields;
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
    int calculatedVisibleType;
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
    bool udaVisibility;
    List<ColumnDef> columnDefs;
    bool isUdaActive;

    factory UdasValue.fromRawJson(String str) => UdasValue.fromJson(json.decode(str));

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
        levelRepositoryFields: List<LevelRepositoryField>.from(json["levelRepositoryFields"].map((x) => LevelRepositoryField.fromJson(x))),
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
        assignedMemberDto: json["assignedMemberDTO"] == null ? null : AssignedMemberDto.fromJson(json["assignedMemberDTO"]),
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
        typesUdasGroups: List<dynamic>.from(json["typesUdasGroups"].map((x) => x)),
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
        udaVisibility: json["udaVisibility"],
        columnDefs: json["columnDefs"] == null ? null : List<ColumnDef>.from(json["columnDefs"].map((x) => ColumnDef.fromJson(x))),
        isUdaActive: json["IsUdaActive"],
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
        "levelRepositoryFields": List<dynamic>.from(levelRepositoryFields.map((x) => x.toJson())),
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
        "assignedMemberDTO": assignedMemberDto == null ? null : assignedMemberDto.toJson(),
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
        "udaVisibility": udaVisibility,
        "columnDefs": columnDefs == null ? null : List<dynamic>.from(columnDefs.map((x) => x.toJson())),
        "IsUdaActive": isUdaActive,
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
        this.assignName,
    });

    String assignMemberUserName;
    String assignMemberPhone;
    String assignMemberEmail;
    dynamic assignMemManagerName;
    dynamic assignMemManagerUserName;
    dynamic assignMemManagerPhone;
    dynamic assignMemMangEmail;
    String assignMemFirstName;
    String assignMemLastName;
    String assignName;

    factory AssignedMemberDto.fromRawJson(String str) => AssignedMemberDto.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AssignedMemberDto.fromJson(Map<String, dynamic> json) => AssignedMemberDto(
        assignMemberUserName: json["assignMemberUserName"],
        assignMemberPhone: json["assignMemberPhone"],
        assignMemberEmail: json["assignMemberEmail"],
        assignMemManagerName: json["assignMemManagerName"],
        assignMemManagerUserName: json["assignMemManagerUserName"],
        assignMemManagerPhone: json["assignMemManagerPhone"],
        assignMemMangEmail: json["assignMemMangEmail"],
        assignMemFirstName: json["assignMemFirstName"],
        assignMemLastName: json["assignMemLastName"],
        assignName: json["assignName"],
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
        "assignName": assignName,
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

class FormObject {
    FormObject();

    factory FormObject.fromRawJson(String str) => FormObject.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FormObject.fromJson(Map<String, dynamic> json) => FormObject(
    );

    Map<String, dynamic> toJson() => {
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
