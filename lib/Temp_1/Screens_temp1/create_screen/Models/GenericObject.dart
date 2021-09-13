import 'dart:convert';

import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/Types.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';

class GenericObject {
  num recId;
  String name;
  num typeId;
  var typeID;
  List<UDAsWithValues> udasValues;
  num statusId;
  Types types;
  num parentTypeId;
  String statusName;
  String typeName;
  var createdBy;
  var createdById;
  var updatedBy;
  var updatedbyById;
  var createdDate;
  var updatedDate;
  var slaObjects;
  String typeObjectId;
  String table_Name = '';
  num rowIndex;
  String addingError;
  num templateId;
  num GenericObjectId;
  // added
  num groupId;
  var groups;
  bool preventSave;
  bool ruleFaild;
  String ruleMessage;
  String statusLastChangeDate;
  Types type;
  //Transient
  var needToBeModified = [];
  String customError;
  num objectRecId;
  GenericObject(
      {this.recId,
      this.name,
      this.addingError,
      this.createdBy,
      this.createdById,
      this.createdDate,
      this.customError,
      this.GenericObjectId,
      this.needToBeModified,
      this.parentTypeId,
      this.rowIndex,
      this.slaObjects,
      this.statusId,
      this.statusName,
      this.table_Name,
      this.templateId,
      this.typeId,
      this.typeID,
      this.typeName,
      this.typeObjectId,
      this.types,
      this.udasValues,
      this.updatedBy,
      this.updatedbyById,
      this.updatedDate,
      this.groupId,
      this.groups,
      this.preventSave,
      this.ruleFaild,
      this.ruleMessage,
      this.statusLastChangeDate,
      this.type,
      this.objectRecId});
  factory GenericObject.fromJson(json) {
    var x = GenericObject(
      addingError: json['addingError'],
      name: json['name'],
      GenericObjectId: json['GenericObjectId'],
      createdBy: json['createdBy'],
      createdById: json['createdById'],
      createdDate: json['createdDate'],
      customError: json['customError'],
      groupId: json['groupId'],
      groups: json['groups'],
      needToBeModified: json['needToBeModified'],
      parentTypeId: json['parentTypeId'],
      preventSave: json['preventSave'],
      recId: json["recId"],
      rowIndex: json['rowIndex'],
      ruleFaild: json['ruleFaild'],
      ruleMessage: json['ruleMessage'],
      slaObjects: json['slaObjects'],
      statusId: json['statusId'],
      statusLastChangeDate: json['statusLastChangeDate'],
      statusName: json['statusName'],
      table_Name: json['table_Name'],
      templateId: json['templateId'],
      type: (json['type'] != null) ? Types.fromJson(json['type']) : null,
      typeId: json['typeId'],
      typeID: json['typeID'],
      typeName: json['typeName'],
      udasValues: (json['udasValues'] != null)
          ? json['udasValues']
              .map<UDAsWithValues>((json) => UDAsWithValues.fromJson(json))
              .toList()
          : null,
      updatedBy: json['updatedBy'],
      updatedDate: json['updatedDate'],
      updatedbyById: json['updatedbyById'],
      typeObjectId: json["typeObjectId"],
      objectRecId: json["objectRecId"],
    );
    return x;
  }

  toJson() {
    var map = new Map<String, dynamic>();
    map["name"] = name;
    map["needToBeModified"] = needToBeModified;
    map["statusId"] = statusId;
    map["statusName"] = statusName;
    map["typeName"] = typeName;
    map["type"] = type?.toJson();
    map["typeId"] = typeId;
    map["typeID"] = typeID;
    map["typeObjectId"] = typeObjectId;
    map["recId"] = recId;
    map["udasValues"] = convertUDAsToJson();
    map["typeObjectId"] = typeObjectId;
    map["GenericObjectId"] = GenericObjectId;
    map["createdBy"] = createdBy;
    map["createdById"] = createdById;
    map["createdDate"] = createdDate;
    map["objectRecId"] = objectRecId;

    return (map);
  }

  convertUDAsToJson() {
    var udas = [];
    if (udasValues != null)
      udasValues.forEach((uda) => {udas.add(uda.toJson())});
    return udas;
  }
}

GenericObject parseGenericObject(String body) {
  final parsed = json.decode(body);
  return GenericObject.fromJson(parsed);
}

abstract class GenericObjectRepository {
  Future<GenericObject> postGenericObject(
      context, GenericObject genericObject, bool modifyall);
  Future<GenericObject> getSavedGenericObjectWithId(
      context, objectId, savedObjectId);
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}
