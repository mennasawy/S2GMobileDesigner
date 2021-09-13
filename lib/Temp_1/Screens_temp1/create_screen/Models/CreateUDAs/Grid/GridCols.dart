import 'dart:convert';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Form/FormListMapping.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/ValueList/RepositoryUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/ValueList/ValueList.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Attachment/attach_RowData.dart';
import 'package:templets/Utilities/const.dart';
import 'package:flutter/material.dart';

class GridCols {
  var calculatedField;
  String caption;
  num columnVisibility;
  String field;
  String headerName;
  bool hidden;
  String name;
  var objectID;
  var process;
  num recId;
  var repositoryId;
  RepositoryUDA repositoryUDAMV;
  num seq;
  var systemField;
  num type;
  var udaFormOption;
  num width;
  var value;
  bool isDeleted;
  bool qrCode;
  var formUdaSelectedFields;
  num formTypeId;
  num formAppId;
  List<FormListMappingDTO> formListMappingDTOList;
  List<ValueList> valueListValues = [];
  var gridAttachmentID;
  String udaFormValueString;
  dynamic objectId;
  String autoIdPreFix;
  int autoIdNumDigits;
  String hideCondition;
  String readonlyCondition;
  String isMandatoryCondition;
  dynamic valueListCondition;
  dynamic eSignature;
  String columnName;
  dynamic tableGridName;
  dynamic valueListTypeId;
  num dictionaryId;
  dynamic sourceOperationId;
  dynamic sourceOperationDataId;
  dynamic bindDataId;
  List<AttachData> attachments;
  dynamic formUdaOptions;
  dynamic formListFilterDto;
  int calculatedVisibleType;
  dynamic udaValue;
  TextEditingController columnTextController;
  bool isMandatory;
  bool isReadOnly;
  String valueListConditionDB;
  int formGridId;

  GridCols({
    this.name,
    this.type,
    this.width,
    this.udaFormOption,
    this.objectID,
    this.field,
    this.calculatedField,
    this.caption,
    this.columnVisibility,
    this.headerName,
    this.hidden,
    this.process,
    this.repositoryId,
    this.repositoryUDAMV,
    this.seq,
    this.systemField,
    this.value,
    this.isDeleted,
    this.qrCode,
    this.formUdaSelectedFields,
    this.formTypeId,
    this.formAppId,
    this.formListMappingDTOList,
    this.gridAttachmentID,
    this.recId,
    this.objectId,
    this.autoIdPreFix,
    this.autoIdNumDigits,
    this.hideCondition,
    this.readonlyCondition,
    this.isMandatoryCondition,
    this.valueListCondition,
    this.eSignature,
    this.columnName,
    this.tableGridName,
    this.valueListTypeId,
    this.dictionaryId,
    this.sourceOperationId,
    this.sourceOperationDataId,
    this.bindDataId,
    this.attachments,
    this.formUdaOptions,
    this.formListFilterDto,
    this.calculatedVisibleType,
    this.udaValue,
    this.udaFormValueString,
    this.columnTextController,
    this.isMandatory,
    this.isReadOnly,
    this.valueListConditionDB,
    this.formGridId,
  });

  factory GridCols.fromJson(Map<String, dynamic> json) {
    return GridCols(
      recId: json["recId"],
      calculatedField: json["calculatedField"],
      name: json["name"],
      caption: json["caption"],
      columnVisibility: json["columnVisibility"],
      field: json["field"],
      headerName: json["headerName"],
      hidden: json["hidden"],
      objectID: json["object_id"],
      process: json["process"],
      repositoryId: json["repositoryId"],
      repositoryUDAMV: (json["repositoryUDA"] != null)
          ? RepositoryUDA.fromJson(json["repositoryUDA"])
          : null,
      seq: json["seq"],
      systemField: json["systemField"],
      type: json["type"],
      udaFormOption: json["udaFormOption"],
      width: json["width"],
      value: json["value"],
      isDeleted: json["isDeleted"],
      qrCode: json["qrCode"],
      formUdaSelectedFields: json["formUdaSelectedFields"],
      formTypeId: json["formTypeId"],
      formAppId: json["formAppId"],
      formListMappingDTOList: (json['formListMappingDTOList'] != null)
          ? json['formListMappingDTOList']
              .map<FormListMappingDTO>(
                  (json) => FormListMappingDTO.fromJson(json))
              .toList()
          : null,
      autoIdNumDigits: json["autoIDNumDigits"],
      autoIdPreFix: json["autoIDPreFix"],
      attachments: (json['attachemnts'] != null)
          ? json['attachemnts']
              .map<AttachData>((json) => AttachData.fromJson(json))
              .toList()
          : null,
      hideCondition: json["hideCondition"],
      isMandatoryCondition: json["isMandatoryCondition"],
      readonlyCondition: json["readonlyCondition"],
      dictionaryId: json["dictionaryId"],
      columnName: json["columnName"],
      tableGridName: json["tableGridName"],
      valueListConditionDB: json["valueListConditionDB"],
      formGridId: json["formGridId"],
    );
  }

  toJson() {
    Map<String, dynamic> json = new Map<String, dynamic>();
    json["recId"] = recId;
    json["calculatedField"] = calculatedField;
    json["name"] = name;
    json["caption"] = caption;
    json["columnVisibility"] = columnVisibility;
    json["field"] = field;
    json["headerName"] = headerName;
    json["hidden"] = hidden;
    json["object_id"] = objectID;
    json["process"] = process;
    json["repositoryId"] = repositoryId;
    json["repositoryUDA"] = repositoryUDAMV;
    json["seq"] = seq;
    json["systemField"] = systemField;
    json["type"] = type;
    json["udaFormOption"] = udaFormOption;
    json["width"] = width;
    json["value"] = value;
    json["isDeleted"] = isDeleted;
    json["qrCode"] = qrCode;
    json["formUdaSelectedFields"] = formUdaSelectedFields;
    json["formTypeId"] = formTypeId;
    json["formAppId"] = formAppId;
    json["formListMappingDTOList"] = (this.formListMappingDTOList != null)
        ? convertFormListMappingToJson()
        : null;
    json["autoIDNumDigits"] = autoIdNumDigits;
    json["autoIDPreFix"] = autoIdPreFix;
    json["attachemnts"] = (attachments != null) ? convertAttachmentsList() : [];
    json["hideCondition"] = hideCondition;
    json["isMandatoryCondition"] = isMandatoryCondition;
    json["readonlyCondition"] = readonlyCondition;
    json["dictionaryId"] = dictionaryId;
    json["columnName"] = columnName;
    json["tableGridName"] = tableGridName;
    json["valueListConditionDB"] = valueListConditionDB;
    json["formGridId"] = formGridId;
    return json;
  }

  convertFormListMappingToJson() {
    var formListMapping = [];
    this
        .formListMappingDTOList
        .forEach((formList) => {formListMapping.add(formList.toJson())});
    return formListMapping;
  }

  convertAttachmentsList() {
    var attachments_List = [];
    attachments
        .forEach((attachment) => {attachments_List.add(attachment.toJson())});
    return attachments_List;
  }
}

List<GridCols> parseGridCols(String body) {
  final parsed = json.decode(body).cast<Map<String, dynamic>>();
  log(LogType.DEBUG, "Grid columns ========== $parsed");
  return parsed.map<GridCols>((json) => GridCols.fromJson(json)).toList();
}

abstract class GridUDARepository {
  Future<List<GridCols>> getGridColumns(context, int udaRecId);
}
