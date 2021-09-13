import 'dart:convert';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/AssignmentInfoUDAModel/SaveAssignmentInfoModel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Attachment/attach_RowData.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Form/FormListMapping.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/ColumnDefs.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridCols.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridRow.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MultipleLevel/MultipleLevelModel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MultipleLevel/MultipleLevelRowData.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/ValueList/RepositoryUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/ValueList/ValueList.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/SubPanelUda.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Note/savedNote.dart';
import 'package:flutter/material.dart';

class UDAsWithValues {
  var defaultValue;
  String calulatedUda;
  bool location;
  int recId;
  String udaName;
  String field;
  String udaCaption;
  String udaDescription;
  var udaFormOption;
  var associatedObjects;
  List<int> associatedTypesId;
  String valueListCondition;
  int udaType;
  String autoIDPreFix;
  int autoIDNumDigits;
  String udaPanelCaption;
  String visibleCondition;
  String normalCondition;
  int udaPanelID;
  var udaVisibility;
  dynamic udaValue;
  List multiValues;
  ValueList selectedObj;
  var formObject;
  String objectNameToShow;
  List<AttachData> attachments;
  List<savedNote> notesList;
  List showAttahcmentList;
  var type;
  var object_id;
  List fields;

  var defaultPicture;
  var profile;
  var uploaderOptions;
  List<dynamic> rowData;
  String show = 'none';
  int sizeofdiv = 12;
  int udaOrder;
  bool boolean = true;
  int visableType;
  int readonly;
  String readOnlyCondition;
  int dateTypes;
  String labelColor;
  String lableColor;
  num calculatedVisibleType;
  int sourceOperationId;
  int sourceOperationDataId;
  int bindDataId;
  String valueListConditionDB;
  String valueListConditionDBValue;
  String isMandatoryCondition;
  String validCondition;
  String validationMessage;
  int relatedValueListId;
  RepositoryUDA repositoryUDA;
  List queryData = [];
  var conditionSava = '';
  var valueId = '';
  var resValue = '';
  String ai_Comp;
  String ai_Orga;
  String ai_Group;
  String ai_Mem;
  String ai_Mem_UId;
  SaveAssignmentInfoModel assignedMemberDTO;
  bool allowManual;
  bool appearInDialog;
  bool copyTemplate;
  bool enableUdaLog;
  bool allowReAssign;
  bool privilegeIsPublic;
  int udaId;
  int subFormRowId;
  String udaTableName;
  List<GridCols> getGridCols = [];
  bool isUdaValid;
  bool isReadOnly;
  bool isVisible;
  bool isMandatory;
  bool isNormal;
  bool showValidationMessage;
  bool isDynamicValueListLoaded = false;
  List<ValueList> valueListValues = [];
  bool qrCode;
  List<ColumnDefs> columnDefs = [];
  MultipleLevelModel multipleLevelRepository;
  List<dynamic> levelRepositoryField;
  int formUdaId;
  bool eSignature;
  bool bold;
  num freeSpaceSpan;
  num hasRule;
  bool ispublic;
  bool partOne;
  bool partTwo;
  num readOnly;
  num typeId;
  String formUdaSelectedFields;
  int formAppId;
  int formTypeId;
  TextEditingController udaTextController = TextEditingController();
  List<FormListMappingDTO> formListMappingDTOList;
  String columnName;
  String tableGridName;
  num dictionaryId;
  var appearAsContent;
  var formListFilterDTO;
  String formUdaOptions;
  var htextValue;
  var hTextValues;
  bool isBold;
  bool isUdaActive;
  var processTemplate;
  var repositoriesInfo;
  var returnedRowData;
  bool showMemper;
  var subFormUDAsList;
  var SubFormUDAsList;
  var typesUdasGroups;
  String udaFormValueString;
  String AdditionalUdaTableNames;
  bool hasNoPrevilage;
  String companyValue;
  String organizationValue;
  String groupValue;
  String memberValue;
  bool isValidationCondMsgWarn;
  String autoIDSequenceName;
  dynamic autoIDSuffix;
  String richTextValue;
  String multiMediaDescription;
  int multiMediaTypeId;

  UDAsWithValues({
    this.recId,
    this.ai_Comp,
    this.ai_Group,
    this.ai_Mem,
    this.ai_Orga,
    this.ai_Mem_UId,
    this.allowManual,
    this.allowReAssign,
    this.appearInDialog,
    this.associatedObjects,
    this.associatedTypesId,
    this.autoIDNumDigits,
    this.autoIDPreFix,
    this.bindDataId,
    this.boolean,
    this.location,
    this.calculatedVisibleType,
    this.calulatedUda,
    this.conditionSava,
    this.copyTemplate,
    this.dateTypes,
    this.defaultPicture,
    this.defaultValue,
    this.enableUdaLog,
    this.field,
    this.fields,
    this.labelColor,
    this.formObject,
    this.isMandatoryCondition,
    this.multiValues,
    this.object_id,
    this.objectNameToShow,
    this.privilegeIsPublic,
    this.profile,
    this.queryData,
    this.readonly,
    this.relatedValueListId,
    this.repositoryUDA,
    this.resValue,
    this.rowData,
    this.selectedObj,
    this.show,
    this.type,
    this.udaCaption,
    this.udaId,
    this.udaName,
    this.udaOrder,
    this.udaPanelCaption,
    this.udaPanelID,
    this.udaType,
    this.udaValue,
    this.udaVisibility,
    this.showAttahcmentList,
    this.sizeofdiv,
    this.sourceOperationDataId,
    this.sourceOperationId,
    this.subFormRowId,
    this.udaFormOption,
    this.uploaderOptions,
    this.valueId,
    this.assignedMemberDTO,
    this.valueListCondition,
    this.valueListConditionDB,
    this.valueListConditionDBValue,
    this.visableType,
    this.visibleCondition,
    this.udaTableName,
    this.readOnlyCondition,
    this.notesList,
    this.validCondition,
    this.normalCondition,
    this.validationMessage,
    this.udaDescription,
    this.qrCode,
    this.columnDefs,
    this.attachments,
    this.multipleLevelRepository,
    this.levelRepositoryField,
    this.formUdaId,
    this.eSignature,
    this.formAppId,
    this.formTypeId,
    this.formUdaSelectedFields,
    this.formListMappingDTOList,
    this.bold,
    this.freeSpaceSpan,
    this.hasRule,
    this.ispublic,
    this.partOne,
    this.partTwo,
    this.readOnly,
    this.typeId,
    this.udaTextController,
    this.columnName,
    this.tableGridName,
    this.dictionaryId,
    this.appearAsContent,
    this.formListFilterDTO,
    this.formUdaOptions,
    this.htextValue,
    this.hTextValues,
    this.isBold,
    this.isUdaActive,
    this.processTemplate,
    this.repositoriesInfo,
    this.returnedRowData,
    this.showMemper,
    this.subFormUDAsList,
    this.SubFormUDAsList,
    this.lableColor,
    this.typesUdasGroups,
    this.udaFormValueString,
    this.AdditionalUdaTableNames,
    this.hasNoPrevilage,
    this.companyValue,
    this.organizationValue,
    this.groupValue,
    this.memberValue,
    this.isValidationCondMsgWarn,
    this.autoIDSequenceName,
    this.autoIDSuffix,
    this.richTextValue,
    this.multiMediaDescription,
    this.multiMediaTypeId,
  });

  factory UDAsWithValues.fromJson(Map<String, dynamic> json) {
    getRowData(int udaType, json) {
      switch (udaType) {
        case 9:
          return json
              .map<GridRowData>((json) => GridRowData.fromJson(json))
              .toList();
          break;
        case 20:
          return json
              .map<MultipleLevelRowData>(
                  (json) => MultipleLevelRowData.fromJson(json))
              .toList();
          break;
        default:
          return null;
      }
      // (udaType == 9)
      //     ? json['rowData']
      //         .map<GridRowData>((json) => GridRowData.fromJson(json))
      //         .toList()
      //     : json['rowData']
      //         .map<ProcessTemplateTask>(
      //             (json) => ProcessTemplateTask.fromJson(json))
      //         .toList();
    }

    return UDAsWithValues(
      recId: json["recId"],
      udaCaption: json["udaCaption"],
      udaId: json["udaId"],
      udaName: json["udaName"],
      udaOrder: json["udaOrder"],
      udaPanelCaption: json["udaPanelCaption"],
      udaPanelID: json["udaPanelID"],
      udaType: json["udaType"],
      visableType: json["visableType"],
      dateTypes: json["dateTypes"],
      labelColor: json["LableColor"],
      repositoryUDA: (json["repositoryUDA"] != null)
          ? RepositoryUDA.fromJson(json["repositoryUDA"])
          : null,
      udaValue: json["udaValue"],
      sourceOperationId: json["sourceOperationId"],
      ai_Comp: json["ai_Comp"], /////
      ai_Orga: json["ai_Orga"],
      ai_Group: json["ai_Group"],
      ai_Mem: json["ai_Mem"],
      ai_Mem_UId: json["ai_Mem_UId"],
      rowData: (json['rowData'] != null)
          ? getRowData(json["udaType"], json['rowData'])
          : null,
      assignedMemberDTO: json['assignedMemberDTO'] != null
          ? new SaveAssignmentInfoModel.fromJson(json['assignedMemberDTO'])
          : null,
      udaTableName: json["udaTableName"],
      location: json["location"],
      udaVisibility: json["udaVisibility"],
      readOnlyCondition: json["readOnlyCondition"],
      isMandatoryCondition: json["isMandatoryCondition"],
      visibleCondition: json["visibleCondition"],
      normalCondition: json["normalCondition"],
      validCondition: json["valiedCondition"],
      validationMessage: json["addedMessage"],
      calulatedUda: json["calulatedUda"],
      allowManual: json["allowManual"],
      enableUdaLog: json["enableUdaLog"],
      copyTemplate: json["copyTemplate"],
      autoIDNumDigits: json["autoIDNumDigits"],
      autoIDPreFix: json["autoIDPreFix"],
      readonly: json["readonly"],
      formUdaId: json["formUdaId"],
      valueListConditionDB: json["valueListConditionDB"],
      allowReAssign: json["allowReAssign"],
      bold: json["bold"],
      calculatedVisibleType: json["calculatedVisibleType"],
      freeSpaceSpan: json["freeSpaceSpan"],
      hasRule: json["hasRule"],
      ispublic: json["ispublic"],
      object_id: json["object_id"],
      partOne: json["partOne"],
      partTwo: json["partTwo"],
      privilegeIsPublic: json["privilegeIsPublic"],
      readOnly: json["readOnly"],
      subFormRowId: json["subFormRowId"],
      typeId: json["typeId"],
      eSignature: json["eSignature"],
      formAppId: json['formAppId'],
      formTypeId: json['formTypeId'],
      formUdaSelectedFields: json['formUdaSelectedFields'],
      columnName: json['columnName'],
      tableGridName: json['tableGridName'],
      dictionaryId: json['dictionaryId'],
      appearAsContent: json['appearAsContent'],
      associatedObjects: json['associatedObjects'],
      associatedTypesId: json['associatedTypesId'],
      bindDataId: json['bindDataId'],
      formListFilterDTO: json['formListFilterDTO'],
      formObject: json['formObject'], //Object
      formUdaOptions: json['formUdaOptions'],
      htextValue: json['htextValue'],
      hTextValues: json['hTextValues'],
      isBold: json['isBold'],
      isUdaActive: json['IsUdaActive'],
      multiValues: json['multiValues'],
      processTemplate: json['processTemplate'],
      relatedValueListId: json['relatedValueListId'],
      repositoriesInfo: json['repositoriesInfo'],
      returnedRowData: json['returnedRowData'],
      showMemper: json['showMemper'],
      sizeofdiv: json['sizeofdiv'],
      sourceOperationDataId: json['sourceOperationDataId'],
      subFormUDAsList: json['subFormUDAsList'],
      SubFormUDAsList: json['SubFormUDAsList'],
      lableColor: json['lableColor'],
      typesUdasGroups: json['typesUdasGroups'],
      udaFormOption: json['udaFormOption'],
      udaFormValueString: json['udaFormValueString'],
      valueListCondition: json['valueListCondition'],
      hasNoPrevilage: json['hasNoPrevilage'],
      companyValue: json['companyValue'],
      organizationValue: json['organizationValue'],
      groupValue: json['groupValue'],
      memberValue: json['memberValue'],
      isValidationCondMsgWarn: json['isValidationCondMsgWarn'],
      autoIDSequenceName: json['autoIDSequenceName'],
      autoIDSuffix: json['autoIDSuffix'],
      multiMediaDescription: json['multiMediaDescription'],
      multiMediaTypeId: json['multiMediaTypeId'],
      formListMappingDTOList: (json['formListMappingDTOList'] != null)
          ? json['formListMappingDTOList']
              .map<FormListMappingDTO>(
                  (json) => FormListMappingDTO.fromJson(json))
              .toList()
          : null,
      notesList: (json['notesList'] != null)
          ? json['notesList']
              .map<savedNote>((json) => savedNote.fromJson(json))
              .toList()
          : null,
      attachments: (json['attachemnts'] != null)
          ? json['attachemnts']
              .map<AttachData>((json) => AttachData.fromJson(json))
              .toList()
          : null,
      defaultValue: json["defaultValue"],
      selectedObj: (json["selectedObj"] != null)
          ? ValueList.fromJson(json["selectedObj"])
          : null,
      udaDescription: json['udaDescription'],
      qrCode: json['qrCode'],
      columnDefs: (json["columnDefs"] != null)
          ? json["columnDefs"]
              .map<ColumnDefs>((json) => ColumnDefs.fromJson(json))
              .toList()
          : null,
      multipleLevelRepository: (json['multipleLevelRepository'] != null)
          ? MultipleLevelModel.fromJson(json["multipleLevelRepository"])
          : null,
      AdditionalUdaTableNames: json["AdditionalUdaTableNames"],
    );
  }

  toJson() {
    var map = new Map<String, dynamic>();
    map["recId"] = recId;
    map["udaCaption"] = udaCaption;
    map["udaId"] = udaId;
    map["udaName"] = udaName;
    map["udaOrder"] = udaOrder;
    map["udaPanelCaption"] = udaPanelCaption;
    map["udaPanelID"] = udaPanelID;
    map["udaType"] = udaType;
    map["visableType"] = visableType;
    map["dateTypes"] = dateTypes;
    map["repositoryUDA"] =
        (repositoryUDA != null) ? repositoryUDA.toJson() : null;
    map["udaValue"] = udaValue;
    map["sourceOperationId"] = sourceOperationId;
    map["rowData"] = (rowData != null) ? convertRowDataToJson() : [];
    map["udaTableName"] = udaTableName;
    map["notesList"] = (notesList != null) ? convertNotesList() : null;
    map["attachemnts"] =
        (attachments != null) ? convertAttachmentsList() : null;
    map["LableColor"] = labelColor;
    map["autoIDPreFix"] = autoIDPreFix;
    map["autoIDNumDigits"] = autoIDNumDigits;
    map["defaultValue"] = defaultValue;
    map["location"] = location;
    map["selectedObj"] = (selectedObj != null) ? selectedObj.toJson() : null;
    map["fields"] = (fields != null) ? convertFieldsToJson() : [];
    map["columnDefs"] = (columnDefs != null) ? convertColumnDefsToJson() : null;
    map["assignedMemberDTO"] = assignedMemberDTO;
    map["levelRepositoryFields"] =
        (levelRepositoryField != null) ? convertLevelRepositoryToJson() : [];
    map["ai_Comp"] = ai_Comp;
    map["ai_Orga"] = ai_Orga;
    map["ai_Group"] = ai_Group;
    map["ai_Mem"] = ai_Mem;
    map["ai_Mem_UId"] = ai_Mem_UId;
    map["formUdaId"] = formUdaId;
    map["valueListConditionDB"] = valueListConditionDB;
    map["eSignature"] = eSignature;
    map["addedMessage"] = validationMessage;
    map["allowManual"] = allowManual;
    map["allowReAssign"] = allowReAssign;
    map["bold"] = bold;
    map["calculatedVisibleType"] = calculatedVisibleType;
    map["copyTemplate"] = copyTemplate;
    map["enableUdaLog"] = enableUdaLog;
    map["freeSpaceSpan"] = freeSpaceSpan;
    map["hasRule"] = hasRule;
    map["isMandatoryCondition"] = isMandatoryCondition;
    map["ispublic"] = ispublic;
    map["object_id"] = object_id;
    map["partOne"] = partOne;
    map["partTwo"] = partTwo;
    map["privilegeIsPublic"] = privilegeIsPublic;
    map["readOnly"] = readOnly;
    map["subFormRowId"] = subFormRowId;
    map["typeId"] = typeId;
    map["udaVisibility"] = udaVisibility;

    map["formAppId"] = formAppId;
    map["formUdaSelectedFields"] = formUdaSelectedFields;
    map["formTypeId"] = formTypeId;
    map["columnName"] = columnName;
    map["tableGridName"] = tableGridName;
    map["dictionaryId"] = dictionaryId;
    map["appearAsContent"] = appearAsContent;
    map["associatedObjects"] = associatedObjects;
    map["associatedTypesId"] = associatedTypesId;
    map["bindDataId"] = bindDataId;
    map["calulatedUda"] = calulatedUda;
    map["formListFilterDTO"] = formListFilterDTO;
    map["formObject"] = formObject;
    map["htextValue"] = htextValue;
    map["hTextValues"] = hTextValues;
    map["isBold"] = isBold;
    map["IsUdaActive"] = isUdaActive;
    map["multiValues"] = multiValues;
    map["normalCondition"] = normalCondition;
    map["processTemplate"] = processTemplate;
    map["qrCode"] = qrCode;
    map["readOnlyCondition"] = readOnlyCondition;
    map["relatedValueListId"] = relatedValueListId;
    map["repositoriesInfo"] = repositoriesInfo;
    map["returnedRowData"] = returnedRowData;
    map["showMemper"] = showMemper;
    map["sizeofdiv"] = sizeofdiv;
    map["sourceOperationDataId"] = sourceOperationDataId;
    map["subFormUDAsList"] = subFormUDAsList;
    map["SubFormUDAsList"] = SubFormUDAsList;
    map["lableColor"] = lableColor;
    map["typesUdasGroups"] = typesUdasGroups;
    map["udaFormOption"] = udaFormOption;
    map["udaFormValueString"] = udaFormValueString;
    map["valiedCondition"] = validCondition;
    map["valueListCondition"] = valueListCondition;
    map["visibleCondition"] = visibleCondition;
    map["formUdaOptions"] = formUdaOptions;
    map["hasNoPrevilage"] = hasNoPrevilage;
    map["companyValue"] = companyValue;
    map["organizationValue"] = organizationValue;
    map["groupValue"] = groupValue;
    map["memberValue"] = memberValue;
    map["isValidationCondMsgWarn"] = isValidationCondMsgWarn;
    map["autoIDSequenceName"] = autoIDSequenceName;
    map["autoIDSuffix"] = autoIDSuffix;
    map['multiMediaDescription'] = multiMediaDescription;
    map['multiMediaTypeId'] = multiMediaTypeId;
    if (this.assignedMemberDTO != null) {
      map['assignedMemberDTO'] = this.assignedMemberDTO.toJson();
    }
    map["multipleLevelRepository"] = (multipleLevelRepository != null)
        ? multipleLevelRepository.toJson()
        : null;
    map["formListMappingDTOList"] = (formListMappingDTOList != null)
        ? convertFormListMappingToJson()
        : null;
    map["AdditionalUdaTableNames"] = AdditionalUdaTableNames;
    return map;
  }

  convertRowDataToJson() {
    var row_data = [];
    rowData.forEach((data) => {row_data.add(data.toJson())});
    return row_data;
  }

  convertNotesList() {
    var notes_List = [];
    notesList.forEach((note) => {notes_List.add(note.toJson())});
    return notes_List;
  }

  convertAttachmentsList() {
    var attachments_List = [];
    attachments
        .forEach((attachment) => {attachments_List.add(attachment.toJson())});
    return attachments_List;
  }

  convertFieldsToJson() {
    var fieldsData = [];
    fields.forEach((field) => {fieldsData.add(field.toJson())});
    return fieldsData;
  }

  convertColumnDefsToJson() {
    var columnDefsData = [];
    columnDefs.forEach((columnDef) => {columnDefsData.add(columnDef.toJson())});
    return columnDefsData;
  }

  convertLevelRepositoryToJson() {
    var levelRepositoryFields = [];
    levelRepositoryField.forEach(
        (levelRepo) => {levelRepositoryFields.add(levelRepo.toJson())});
    return levelRepositoryFields;
  }

  convertFormListMappingToJson() {
    var formListMapping = [];
    this
        .formListMappingDTOList
        .forEach((formList) => {formListMapping.add(formList.toJson())});
    return formListMapping;
  }
}

abstract class UDAsRepository {
  Future<UDAsObject> getUDAsWithValues(context, int typeRecId);
  Future<List<SubPanelUda>> getPanelsOfSelectedBusinessType(
      context, int typeRecId);
  Future<UDAsWithValues> getUDAObject(context, int udaID);
}

List<UDAsWithValues> parseUDAs(String body) {
  final parsed = json.decode(body);
  return parsed
      .map<UDAsWithValues>((json) => UDAsWithValues.fromJson(json))
      .toList();
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}

class UDAsObject {
  List<UDAsWithValues> udas;
  List<GridCols> cols;
//  UDAsObject(this.cols,this.udasOfSelectedType);
}

parseUDAObject(String body) {
  final parsed = json.decode(body);
  return UDAsWithValues.fromJson(parsed);
}
