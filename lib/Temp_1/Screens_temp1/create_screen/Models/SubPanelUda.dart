import 'dart:convert';

import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';

class SubPanelUda {
  num recId;
  var subPanelTypeObject; // transit for cmb then it change to panel type name (Tab, Field List  , Accord)
  String subPanelType; // sub panel type name
  String subPanelName;
  num subPanelId; // supposed to be subPanelTypeID
  bool isPanelSelected;
  bool isParent;
  String parentPanel;
  num parentPanelId;
  //for UDA definition filter
  num udaObjectId;
  num udaTypeId;
  num panelOrder;
  // for subForm uda panels
  num panelUdaId;
  List<UDAsWithValues> udas = [];
  //for sub panels
  List<SubPanelUda> subPanels = [];
  SubPanelUda(
      {this.recId,
      this.isParent,
      this.panelOrder,
      this.panelUdaId,
      this.parentPanel,
      this.parentPanelId,
      this.subPanelId,
      this.isPanelSelected,
      this.subPanelName,
      this.subPanelType,
      this.subPanelTypeObject,
      this.udaObjectId,
      this.udaTypeId,
      this.udas});

  factory SubPanelUda.fromJson(Map<String, dynamic> json) {
    return SubPanelUda(
      recId: json["recId"],
      isParent: json["IsParent"],
      panelOrder: json["panelOrder"],
      panelUdaId: json["panelUdaId"],
      parentPanel: json["parentPanel"],
      parentPanelId: json["parentPanelId"],
      subPanelId: json["subPanelId"],
      subPanelName: json["subPanelName"],
      subPanelType: json["subPanelType"],
      subPanelTypeObject: json["subPanelTypeObject"],
      udaObjectId: json["udaObjectId"],
      udaTypeId: json["udaTypeId"],
    );
  }
}

List<SubPanelUda> parsePanels(String body) {
  final parsed = json.decode(body).cast<Map<String, dynamic>>();
  return parsed.map<SubPanelUda>((json) => SubPanelUda.fromJson(json)).toList();
}
