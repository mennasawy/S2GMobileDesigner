import 'dart:convert';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridRow.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Utilities/utility_methods.dart';

class FormUDAValuesRequest {
  int selectedTypeId;
  String selectedFieldsNames;
  int formListUdaId;
  int gridId;
  String selectedValueId;
  GridRowData gridRowData;
  GenericObject genericObject;

  FormUDAValuesRequest(
      {this.selectedTypeId,
      this.selectedFieldsNames,
      this.formListUdaId,
      this.gridId,
      this.genericObject,
      this.gridRowData});

  FormUDAValuesRequest.fromJson(Map<String, dynamic> json) {
    selectedTypeId = json['selectedTypeId'];
    selectedFieldsNames = json['selectedFieldsNames'];
    formListUdaId = json['formListUdaId'];
    gridId = json['gridId'];
    selectedValueId = json['selectedValueId'];
    gridRowData = json['gridRowData'];
    genericObject = json['genericObject'] != null
        ? new GenericObject.fromJson(json['genericObject'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['selectedTypeId'] = this.selectedTypeId;
    data['selectedFieldsNames'] = this.selectedFieldsNames;
    data['formListUdaId'] = this.formListUdaId;
    data['gridId'] = this.gridId;
    data['selectedValueId'] = this.selectedValueId;
    data['gridRowData'] = this.gridRowData;
    if (this.genericObject != null) {
      data['genericObject'] = this.genericObject.toJson();
    }
    return data;
  }
}

class FormUDAValues {
  final int recID;
  String objTitle;

  FormUDAValues({this.recID, this.objTitle});

  factory FormUDAValues.fromJson(Map<String, dynamic> json) {
    return FormUDAValues(recID: json["recid"], objTitle: json["obj_title"]);
  }

  toJson() {
    Map<String, dynamic> json = new Map<String, dynamic>();
    json["recid"] = recID;
    json["obj_title"] = objTitle;
    return json;
  }
}

class FormlistPickedObject {
  final String selectedUDAsValues;
  final int selectedObjectRecID;

  FormlistPickedObject({this.selectedUDAsValues, this.selectedObjectRecID});
}

parseFormUDA(String body) {
  List<FormUDAValues> formUDA = [];
  final List parsed = json.decode(body);
  if (isNotEmptyList(parsed))
    parsed.forEach(
        (formUDAValue) => {formUDA.add(FormUDAValues.fromJson(formUDAValue))});
  return formUDA;
}

abstract class FormUDARepository {
  Future<List<FormUDAValues>> getFormUDAValues(
      context, FormUDAValuesRequest formUDARequestBody);
}
