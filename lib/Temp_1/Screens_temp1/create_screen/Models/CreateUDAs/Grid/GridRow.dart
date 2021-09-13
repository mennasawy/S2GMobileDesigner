import 'dart:convert';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridCols.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/Grid/EditGridUDAPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/GridUDA/addGridScreen.dart';
import 'package:templets/Utilities/const.dart';
import 'package:templets/Utilities/utility_methods.dart';

class GridRowData {
  int typeId;
  int objectId;
  int udaId;
  int recid;
  int rowIndex;
  AddGridMode gridRowDataMode;
  List<GridCols> columnsList;

  GridRowData({
    this.typeId,
    this.objectId,
    this.udaId,
    this.recid,
    this.columnsList,
    this.gridRowDataMode,
    this.rowIndex,
  });

  factory GridRowData.fromRawJson(String str) =>
      GridRowData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GridRowData.fromJson(Map<String, dynamic> json) {
    //map json columns data to list of GridCols object
    List<GridCols> columnsList = [];
    json.forEach((key, value) {
      if (key != "object_id" &&
          key != "recid" &&
          key != "type_id" &&
          key != "uda_id") {
        // columnValue.udaCaption = key;
        log(LogType.DEBUG, "Grid rec key === $key");
        // columnValue.udaValue = value.toString();
        log(LogType.DEBUG, "Grid rec value ==== $value");
        (!key.contains("attach_"))
            ? columnsList
                .add(GridCols(name: key, value: value, gridAttachmentID: value))
            : columnsList.add(GridCols(name: key, value: value));
      } else if (key == "recid" && isNotEmptyList(columnsList))
        columnsList.last.recId = value;
    });

    //handle formlist data
    List<GridCols> toRemoveCols = [];
    columnsList.forEach((column) {
      columnsList.forEach((columnValue) {
        if (columnValue.name == column.name + "_val") {
          column.udaFormValueString = columnValue.value;
          toRemoveCols.add(columnValue);
        }
        if (columnValue.name == column.name + "_FLVal")
          toRemoveCols.add(columnValue);
      });
    });
    columnsList.removeWhere((column) => toRemoveCols.contains(column));

    return GridRowData(
      typeId: json["type_id"],
      objectId: json["object_id"],
      udaId: json["uda_id"],
      recid: json["recid"],
      columnsList: columnsList,
    );
  }

  handleFormListData() {
    List<GridCols> toRemoveCols = [];
    columnsList.forEach((column) {
      columnsList.forEach((columnValue) {
        if (columnValue.name == column.name + "_val") {
          column.udaFormValueString = columnValue.value;
          toRemoveCols.add(columnValue);
        }
        if (columnValue.name == column.name + "_FLVal")
          toRemoveCols.add(columnValue);
      });
    });
    columnsList.removeWhere((column) => toRemoveCols.contains(column));
  }

  Map<String, dynamic> toJson() {
    var map = new Map<String, dynamic>();
    List<GridCols> gridColumns = [];
    columnsList.forEach((column) {
      gridColumns.add(column);
    });
    for (var i = 0; i < gridColumns.length; i++) {
      if (!isEmptyText(gridColumns[i].udaFormValueString)) {
        GridCols item1 = GridCols(
            name: gridColumns[i].name + "_FLVal",
            value: gridColumns[i].value +
                "@@/" +
                gridColumns[i].udaFormValueString);
        GridCols item2 = GridCols(
            name: gridColumns[i].name + "_val",
            value: gridColumns[i].udaFormValueString);
        gridColumns[i].value = gridColumns[i].udaFormValueString;
        gridColumns.insert(i + 1, item1);
        gridColumns.insert(i + 2, item2);
      }
    }
    // map["type_id"] = typeId;
    map["recid"] = recid;
    map["object_id"] = objectId;
    map["uda_id"] = udaId;
    if (gridColumns != null)
      gridColumns.forEach((column) => map[column.name] = column.value);
    return map;
  }
}

parseGridRowData(String body) {
  final parsedData = json.decode(body);
  return parsedData
      .map<GridRowData>((json) => GridRowData.fromJson(json))
      .toList();
}

String postToJsonEditGridRequest(GridRowData data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

abstract class DictionaryModuleGridRepository {
  Future<List<GridRowData>> getDictionaryModuleData(
      context, num udaID, String udaName);
}

abstract class EditGridUDARepository {
  Future<List<GridRowData>> editGridUDA(context, gridName, gridBody);
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}
