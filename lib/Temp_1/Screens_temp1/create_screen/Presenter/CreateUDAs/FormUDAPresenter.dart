import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Form/FormListMapping.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Form/FormUDAValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridCols.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridRow.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/const.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/dependency_injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popup_menu/popup_menu.dart';

enum FormUDAOptions { view, search, modify, create }

abstract class FormUDAContract {
  void onLoadFormUDAComplete(List<FormUDAValues> formUDAValues);
  void onLoadFormUDAError(onError);
  void onFormUDAsMappingComplete(List<FormListMappingResponse> formMappedUDAs);
  void onFormUDAsMappingError(onError);
}

abstract class FormUDAViewContract {
  updateFormUDAWidgetView();
}

class FormUDAPresenter implements FormUDAContract {
  FormUDAMappingRepository _formUDAMappingRepository;
  List<FormListMappingResponse> mappedUDAs = [];
  FormUDARepository _formUDARepository;
  FormUDAViewContract formUDAView;
  BuildContext context;

  //##########UI related parameters##########
  final int gridID;
  final int formTypeId;
  final int formListUdaId;

  final bool isReadOnly;

  final String title;
  final String gridUDAName;
  final String selectedFieldsNames;

  final dynamic uda;
  final List<GridCols> columns;
  final GenericObject genericObject;

  final Function(dynamic) onValueChange;
  final Function(List<GridCols>) setGridMappedColumns;

  final List<FormUDAOptions> udaOptions;
  final List<FormListMappingDTO> formListMappingDTOList;

  List<String> values = [];
  List<int> recIDs = [];
  bool isValuesLoaded = false;
  List<FormUDAValues> formUDAValues;
  List<MenuItem> formOptionsItems = [];
  TextEditingController controller = new TextEditingController();

  FormUDAPresenter({
    this.isReadOnly,
    this.gridID,
    this.formTypeId,
    this.formListUdaId,
    this.selectedFieldsNames,
    this.genericObject,
    this.uda,
    this.columns,
    this.udaOptions,
    this.formUDAView,
    this.context,
    this.gridUDAName,
    this.onValueChange,
    this.formListMappingDTOList,
    this.setGridMappedColumns,
    this.title,
  }) {
    _formUDARepository = new Injector().formUDARepo;
    _formUDAMappingRepository = new Injector().formUDAMappingRepo;
  }

  void loadFormUDAValues(FormUDAValuesRequest formUDARequestBody) {
    _formUDARepository
        .getFormUDAValues(context, formUDARequestBody)
        .then((c) => this.onLoadFormUDAComplete(c))
        .catchError((onError) => this.onLoadFormUDAError(onError));
  }

  void mapFormUDAs(FormListMappingRequest formMappingRequestBody) {
    _formUDAMappingRepository
        .mapUDAsOnFormSelection(context, formMappingRequestBody)
        .then((mappedUDAs) => this.onFormUDAsMappingComplete(mappedUDAs))
        .catchError((onError) => this.onFormUDAsMappingError(onError));
  }

  setMappedUDAs(List<UDAsWithValues> udas) {
    mappedUDAs.forEach((mappedUDA) {
      udas
          .firstWhere((uda) =>
              uda.recId ==
              mappedUDA.udaId /*&& uda.udaName == mappedUDA.udaName*/)
          .udaValue = mappedUDA.udaValue;
      udas
          .firstWhere((uda) =>
              uda.recId ==
              mappedUDA.udaId /*&& uda.udaName == mappedUDA.udaName*/)
          .rowData = mappedUDA.targetRowData;
    });
  }

  setMappedColumns(List<GridCols> columns) {
    mappedUDAs[0].targetRowData[0].columnsList.forEach((column) {
      columns.firstWhere((gridColumn) => gridColumn.name == column.name).value =
          column.value;
      columns
          .firstWhere((gridColumn) => gridColumn.name == column.name)
          .udaFormValueString = column.udaFormValueString;
    });
  }

  //########UI related methods########
  initializeItems() {
    udaOptions.forEach((option) {
      switch (option) {
        case FormUDAOptions.view:
          formOptionsItems.add(MenuItem(
              title: "View", image: Icon(Icons.remove_red_eye, color: WHITE)));
          break;
        case FormUDAOptions.search:
          formOptionsItems.add(MenuItem(
              title: "Search", image: Icon(Icons.search, color: WHITE)));
          break;
        case FormUDAOptions.modify:
          formOptionsItems.add(
              MenuItem(title: "Modify", image: Icon(Icons.edit, color: WHITE)));
          break;
        case FormUDAOptions.create:
          formOptionsItems.add(MenuItem(
              title: "Create", image: Icon(Icons.add_box, color: WHITE)));
          break;
        default:
      }
    });
    controller.text = uda.udaFormValueString ?? "";
  }

  checkLoadingFormUDAValues() {
    if (isValuesLoaded == false && !udaOptions.contains(FormUDAOptions.search))
      loadValues();
  }

  loadValues() {
    GridRowData gridRowData = getformUDAGridRowData();
    FormUDAValuesRequest formRequestBody = FormUDAValuesRequest(
        formListUdaId: uda?.recId ??
            formListUdaId, //Use grid data instead of UDA data if null
        selectedFieldsNames: uda?.formUdaSelectedFields ??
            selectedFieldsNames, //Use grid data instead of UDA data if null
        selectedTypeId: uda?.formTypeId ??
            formTypeId, //Use grid data instead of UDA data if null
        genericObject: genericObject,
        gridRowData: gridRowData,
        gridId: gridID);
    loadFormUDAValues(formRequestBody);
  }

  GridRowData getformUDAGridRowData() {
    List<GridCols> gridRowDataColumns = [];
    if (isNotEmptyList(columns))
      columns.forEach((column) {
        gridRowDataColumns.add(GridCols(
            name: "{{uda.$gridUDAName.${column.name}}}", value: column.value));
      });
    return GridRowData(columnsList: gridRowDataColumns);
  }

  onOptionsIconTapped(TapUpDetails details) {
    if (isReadOnly != true) {
      PopupMenu menu = PopupMenu(
        maxColumn: udaOptions.length,
        items: formOptionsItems,
        onClickMenu: null,
        context: context,
      );
      menu.show(
          rect:
              Rect.fromPoints(details.globalPosition, details.globalPosition));
    }
  }

  @override
  void onLoadFormUDAComplete(List<FormUDAValues> formUDAValues) {
    // TODO: implement onLoadFormUDAComplete
    List<String> titles = [];
    List<int> recIDs = [];
    formUDAValues.forEach((formItem) {
      if (formItem.objTitle == null) formItem.objTitle = "Empty";
      titles.add(formItem.objTitle);
      recIDs.add(formItem.recID);
    });
    isValuesLoaded = true;
    values = titles;
    this.recIDs = recIDs;
    this.formUDAValues = formUDAValues;
    (isEmptyText(uda.udaValue))
        ? controller.text = uda.udaFormValueString ?? ""
        : controller.text = getFormUdaTitleWithValue();
    formUDAView.updateFormUDAWidgetView();
  }

  String getFormUdaTitleWithValue() {
    log(LogType.DEBUG, "###### Form list value ${uda.udaValue}");
    String value;
    if (formUDAValues != null)
      formUDAValues.forEach((form) {
        if ("${form.recID}" == uda.udaValue) {
          value = form.objTitle;
        }
      });
    return value;
  }

  @override
  void onLoadFormUDAError(onError) {
    // TODO: implement onLoadFormUDAError
    log(LogType.ERROR, "Form UDA Values Error Occurred ${onError.toString()}");
  }

  @override
  void onFormUDAsMappingComplete(List<FormListMappingResponse> formMappedUDAs) {
    // TODO: implement onFormUDAsMappingComplete
    log(LogType.DEBUG,
        "Mapped UDAs on form UDA ========== ${formMappedUDAs[0].udaValue}");
    formMappedUDAs.forEach((uda) {
      if (uda.udaValue.contains("@@/")) {
        uda.udaValue = uda.udaValue.split("@@/")[1];
      }
    });
    this.mappedUDAs = formMappedUDAs;

    if (isNotEmptyList(formMappedUDAs) &&
        formMappedUDAs[0].grid == true &&
        columns != null) {
      setMappedColumns(columns);
      setGridMappedColumns(formMappedUDAs[0].targetRowData[0].columnsList);
    } else {
      setMappedUDAs(genericObject.udasValues);
      UDAsWithValues formUDA =
          genericObject.udasValues.firstWhere((uda) => uda.recId == uda.recId);
      onValueChange(formUDA.udaValue);
    }
    formUDAView.updateFormUDAWidgetView();
  }

  @override
  void onFormUDAsMappingError(onError) {
    // TODO: implement onFormUDAsMappingError
  }
}
