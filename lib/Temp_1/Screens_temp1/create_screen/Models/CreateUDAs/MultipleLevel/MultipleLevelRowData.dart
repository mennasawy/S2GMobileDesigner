import 'dart:convert';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridCols.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/MultiLevelUDA/AddEditMultiLevelPresenter.dart';
import 'package:templets/Utilities/const.dart';

class MultipleLevelRowData {
  int objectID;
  int objectTypeID;
  int recID;
  int repositoryID;
  int udaID;
  int rowIndex;
  AddMultiLevelMode gridRowDataMode;
  List<GridCols> columnsList;

  MultipleLevelRowData({
    this.objectID,
    this.objectTypeID,
    this.recID,
    this.repositoryID,
    this.udaID,
    this.columnsList,
    this.gridRowDataMode,
    this.rowIndex,
  });

  factory MultipleLevelRowData.fromRawJson(String str) =>
      MultipleLevelRowData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MultipleLevelRowData.fromJson(Map<String, dynamic> json) {
    List<GridCols> columnsList = [];
    json.forEach((key, value) {
      if (key != "object_id" &&
          key != "object_type_id" &&
          key != "recid" &&
          key != "repository_id" &&
          key != "uda_id" &&
          key.contains("tire")) {
        log(LogType.DEBUG, "Multiple level rec key === $key");
        log(LogType.DEBUG, "Multiple level rec value === $value");
        columnsList.add(GridCols(name: key, value: value));
      }
    });
    columnsList = columnsList.reversed.toList();
    return MultipleLevelRowData(
      objectID: json["object_id"],
      objectTypeID: json["object_type_id"],
      recID: json["recid"],
      repositoryID: json["repository_id"],
      columnsList: columnsList,
      udaID: json["uda_id"],
    );
  }

  Map<String, dynamic> toJson() {
    var map = new Map<String, dynamic>();
    map["recid"] = recID;
    map["object_id"] = objectID;
    map["uda_id"] = udaID;
    if (columnsList != null)
      for (var i = 0; i < columnsList.length; i++) {
        map["tire_" + (i + 1).toString()] = columnsList[i].value;
      }
    map["repository_id"] = repositoryID;

    return map;
  }
}

String postToJsonEditGridRequest(MultipleLevelRowData data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}
