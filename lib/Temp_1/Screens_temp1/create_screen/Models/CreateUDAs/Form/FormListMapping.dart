import 'dart:convert';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridRow.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:flutter/material.dart';

class FormListMappingRequest {
  int selectedRowRecId;
  List<FormListMappingDTO> formListMappingDTOList;
  List<UDAsWithValues> targetUDAList;

  FormListMappingRequest(
      {this.selectedRowRecId, this.formListMappingDTOList, this.targetUDAList});

  FormListMappingRequest.fromJson(Map<String, dynamic> json) {
    selectedRowRecId = json['selectedRowRecId'];
    formListMappingDTOList = (json['formListMappingDTOList'] != null)
        ? json['formListMappingDTOList']
            .map<FormListMappingDTO>(
                (json) => FormListMappingDTO.fromJson(json))
            .toList()
        : null;
    if (json['targetUDAList'] != null) {
      targetUDAList = new List<UDAsWithValues>();
      json['targetUDAList'].forEach((v) {
        targetUDAList.add(new UDAsWithValues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toMap() {
    var data = new Map<String, dynamic>();
    data['selectedRowRecId'] = this.selectedRowRecId;
    data['formListMappingDTOList'] = (this.formListMappingDTOList != null)
        ? convertFormListMappingToJson()
        : null;
    data['targetUDAList'] =
        (this.targetUDAList != null) ? convertUDAsToJson() : null;
    return data;
  }

  convertFormListMappingToJson() {
    var formListMapping = [];
    this
        .formListMappingDTOList
        .forEach((formList) => {formListMapping.add(formList.toJson())});
    return formListMapping;
  }

  convertUDAsToJson() {
    var udas = [];
    this.targetUDAList.forEach((uda) => {udas.add(uda.toJson())});
    return udas;
  }
}

class FormListMappingDTO {
  int recId;
  int formListUdaId;
  int sourceFormId;
  int targetFormId;
  int sourceId;
  String sourceName;
  int targetId;
  String targetName;
  bool deleted;
  bool isSourceGrid;
  int sourceGridId;
  bool isTargetGrid;
  int targetGridId;

  FormListMappingDTO({
    this.recId,
    this.formListUdaId,
    this.sourceFormId,
    this.targetFormId,
    this.sourceId,
    this.sourceName,
    this.targetId,
    this.targetName,
    this.deleted,
    this.isSourceGrid,
    // this.sourceGridId,
    this.isTargetGrid,
    // this.targetGridId
  });

  FormListMappingDTO.fromJson(Map<String, dynamic> json) {
    recId = json['recId'];
    formListUdaId = json['formListUdaId'];
    sourceFormId = json['sourceFormId'];
    targetFormId = json['targetFormId'];
    sourceId = json['sourceId'];
    sourceName = json['sourceName'];
    targetId = json['targetId'];
    targetName = json['targetName'];
    deleted = json['deleted'];
    isSourceGrid = json['isSourceGrid'];
    sourceGridId = json['sourceGridId'];
    isTargetGrid = json['isTargetGrid'];
    targetGridId = json['targetGridId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recId'] = this.recId;
    data['formListUdaId'] = this.formListUdaId;
    data['sourceFormId'] = this.sourceFormId;
    data['targetFormId'] = this.targetFormId;
    data['sourceId'] = this.sourceId;
    data['sourceName'] = this.sourceName;
    data['targetId'] = this.targetId;
    data['targetName'] = this.targetName;
    data['deleted'] = this.deleted;
    data['isSourceGrid'] = this.isSourceGrid;
    data['sourceGridId'] = this.sourceGridId;
    data['isTargetGrid'] = this.isTargetGrid;
    data['targetGridId'] = this.targetGridId;
    return data;
  }
}

class FormListMappingResponse {
  int udaId;
  String udaName;
  String udaValue;
  List<GridRowData> targetRowData;
  bool grid;

  FormListMappingResponse(
      {this.udaId, this.udaName, this.udaValue, this.targetRowData, this.grid});

  FormListMappingResponse.fromJson(Map<String, dynamic> json) {
    udaId = json['udaId'];
    udaName = json['udaName'];
    udaValue = json['udaValue'];
    if (json['targetRowData'] != null) {
      targetRowData = new List<GridRowData>();
      json['targetRowData'].forEach((v) {
        targetRowData.add(new GridRowData.fromJson(v));
      });
    }
    grid = json['grid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['udaId'] = this.udaId;
    data['udaName'] = this.udaName;
    data['udaValue'] = this.udaValue;
    if (this.targetRowData != null) {
      data['targetRowData'] =
          this.targetRowData.map((v) => v.toJson()).toList();
    }
    data['grid'] = this.grid;
    return data;
  }
}

parseFormListMappingResponse(String body) {
  List<FormListMappingResponse> mappedUDAs = [];
  final List parsed = json.decode(body);
  if (isNotEmptyList(parsed))
    parsed.forEach((formUDAValue) =>
        {mappedUDAs.add(FormListMappingResponse.fromJson(formUDAValue))});
  return mappedUDAs;
}

abstract class FormUDAMappingRepository {
  Future<List<FormListMappingResponse>> mapUDAsOnFormSelection(
      BuildContext context, FormListMappingRequest formListMappingRequestBody);
}
