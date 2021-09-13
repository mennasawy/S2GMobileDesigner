import 'dart:convert';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MultipleLevel/MultipleLevelRowData.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MultipleLevel/multiLevelResponseLevelModel.dart';
import 'package:flutter/material.dart';

class MultiLevelResponse {
  int recId;
  String repositoryName;
  String repositoryTableName;
  String privilegeTableName;
  int numberOfLevels;
  bool allowPrice;
  bool allowCopyPlan;
  var appId;
  var objectId;
  var typeId;
  var planUdaId;
  String tiresNames;
  String value; //used in edit mode in UI to get values

  MultiLevelResponse(
      {this.recId,
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
      this.tiresNames});

  MultiLevelResponse.fromJson(Map<String, dynamic> json) {
    recId = json['recId'];
    repositoryName = json['repositoryName'];
    repositoryTableName = json['repositoryTableName'];
    privilegeTableName = json['privilegeTableName'];
    numberOfLevels = json['numberOfLevels'];
    allowPrice = json['allowPrice'];
    allowCopyPlan = json['allowCopyPlan'];
    appId = json['AppId'];
    objectId = json['objectId'];
    typeId = json['typeId'];
    planUdaId = json['planUdaId'];
    tiresNames = json['tiresNames'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recId'] = this.recId;
    data['repositoryName'] = this.repositoryName;
    data['repositoryTableName'] = this.repositoryTableName;
    data['privilegeTableName'] = this.privilegeTableName;
    data['numberOfLevels'] = this.numberOfLevels;
    data['allowPrice'] = this.allowPrice;
    data['allowCopyPlan'] = this.allowCopyPlan;
    data['AppId'] = this.appId;
    data['objectId'] = this.objectId;
    data['typeId'] = this.typeId;
    data['planUdaId'] = this.planUdaId;
    data['tiresNames'] = this.tiresNames;
    return data;
  }
}

MultiLevelResponse parseMultiLevelResponse(String body) {
  final parsed = json.decode(body);
  return MultiLevelResponse.fromJson(parsed);
}

abstract class IMultiLevelGetRepository {
  Future<MultiLevelResponse> getLevels(BuildContext context, String repoId);

  Future<List<LevelDataModel>> getFirstLevel(
      BuildContext context, String repoId);

  Future<List<LevelDataModel>> getLevelById(
      BuildContext context, String repoId, String id);

  Future<String> addEditMultiLevelRec(BuildContext context,
      MultipleLevelRowData multiLevelAddEditRequest, String udaName);
}

abstract class DeleteMultiLevelRepository {
  Future<String> deleteMultiLevel(
      BuildContext context, String udaName, int recId);
}
