import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Attachment/attach_RowData.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridCols.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridRow.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/ErrorResponse/error_data.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/CreateUDAs/Grid/EditGridUDAService.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/GridUDA/GridUtils.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/createFunctions.dart';
import 'package:templets/Utilities/api_constant.dart';
import 'package:templets/Utilities/const.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/dependency_injection.dart';
import 'package:flutter/material.dart';

enum AddGridMode {
  newMode,
  editMode,
}

abstract class EditGridUDAContract {
  void onLoadGridColumnsComplete(List<GridCols> grid);
  void onLoadGridColumnsError(ErrorResponse error);
  void onEditGridSuccesssfully(List<GridRowData> response);
  void onEditGridError(error);
}

abstract class EditGridUDAViewInterface {
  void updateAddRowsView();
}

class EditGridUDAPrsenter implements EditGridUDAContract {
  final BuildContext context;
  final EditGridUDAViewInterface view;
  GridUDARepository _gridUDARepository;
  EditGridUDAServices editAttachmentUDARepository;

  //###########UI Related Parameters###########
  final int gridRecID;
  final int editRowIndex;
  final int objectRecId;

  final AddGridMode mode;
  final FormModes formMode;

  final List<int> rowsRecIDs;
  final UDAsWithValues gridUDA;
  final GenericObject genericObject;
  List<GridCols> rowListItems;

  bool isEditingRecord = false;

  bool isGridDataLoaded = false;

  bool editingGridRow = false;

  GridRowData rowData;
  List<String> columnsNames = [];
  List<Widget> columnsWidgets = [];
  List<GridCols> valueListColumns = [];
  List<GridCols> gridColumnsValues = [];

  Function(GridCols) setAutoIdUdaId;
  Function(List<GridCols>) setMappedColumns;
  Function(GridCols, bool) onCheckboxValueChange;
  Function(GridCols, String) onValueListValueChange;
  Function(GridCols, String, List<GridCols>) onTextColumnValueChange;
  Function(GridCols) setCalculatedFieldValueChange;
  Function(GridCols, List<AttachData>) onAttachmentListChange;
  ScrollController columnsListController = ScrollController();

  EditGridUDAPrsenter({
    this.gridRecID,
    this.editRowIndex,
    this.objectRecId,
    this.mode,
    this.formMode,
    this.rowsRecIDs,
    this.gridUDA,
    this.genericObject,
    this.rowListItems,
    this.view,
    this.context,
  }) {
    _gridUDARepository = Injector().gridUDARepo;
    editAttachmentUDARepository = Injector().editAttachmentRepository;
  }

  //UI Related Methods
  loadGridData() {
    if (isGridDataLoaded == false) getGridColumns(gridUDA.recId);
  }

  onSubmitClicked() {
    if (validMandatoryFields()) {
      setRowData();
      if (formMode == FormModes.editMode ||
          formMode == FormModes.dictionaryModule) {
        editGridRow();
        isEditingRecord = true;
        view.updateAddRowsView();
      } else
        Navigator.of(context).pop(rowData);
    } else
      ShowAlertMessage("Please Fill In All Mandatory Fields", context);
  }

  bool validMandatoryFields() {
    bool isValid = true;
    gridColumnsValues.forEach((gridColumn) {
      if (gridColumn.isMandatory == true) {
        isValid = (!isEmptyText(gridColumn.value)) ? isValid : false;
      }
    });
    return isValid;
  }

  editGridRow() {
    editGridUDA(context, gridUDA.udaName, rowData);
  }

  setRowData() {
    int recID;
    if (formMode == FormModes.newMode || formMode == FormModes.cloneMode)
      recID = -1;
    else {
      recID = getRecId();
    }
    rowData = GridRowData(
      recid: recID,
      udaId: gridUDA.recId,
      columnsList: gridColumnsValues,
      gridRowDataMode: mode,
      rowIndex: editRowIndex,
      objectId: objectRecId,
    );
  }

  int getRecId() {
    int recId = -1;
    if (mode == AddGridMode.newMode) {
      if (gridUDA.rowData != null) {
        recId = gridUDA.rowData.length + 1 * -1;
      }
    } else {
      recId = gridRecID;
    }
    return recId;
  }

  initializeItems() {
    gridColumnsValues.forEach((column) => {
          column.value = null,
          resolveColumnConditionalValidation(
              column, genericObject.udasValues, gridColumnsValues)
        });

    //Handle text columns change
    onTextColumnValueChange =
        (GridCols column, String value, List<GridCols> columns) {
      if (column.type == 1 && isEmptyText(value))
        column.value = null;
      else
        column.value = (column.type == 1) ? (int.tryParse(value) ?? 0) : value;
      if (column.type == 1 &&
          isContainCalculatedFiled(gridColumnsValues) == true)
        updateColumnsWidgets();
      view.updateAddRowsView();
      resolveColumnConditionalValidation(
          column, genericObject.udasValues, gridColumnsValues);
    };

    //Handle checkbox columns change
    onCheckboxValueChange = (GridCols column, bool value) {
      column.value = (value == true) ? 1 : 0;
      view.updateAddRowsView();
      resolveColumnConditionalValidation(
          column, genericObject.udasValues, gridColumnsValues);
    };

    //Handle value list columns change
    onValueListValueChange = (GridCols column, String value) {
      if (column.repositoryUDAMV != null) //Repository is set from admin
      {
        column.value = value;
        view.updateAddRowsView();
      }
      resolveColumnConditionalValidation(
          column, genericObject.udasValues, gridColumnsValues);
    };

    //Handle columns mapping on form list column
    setMappedColumns = (List<GridCols> columns) {
      columns.forEach((column) => {
            gridColumnsValues
                .firstWhere((gridColumn) => column.name == gridColumn.name)
                .value = column.value,
            resolveColumnConditionalValidation(
                column, genericObject.udasValues, gridColumnsValues),
          });
      updateColumnsWidgets();
      view.updateAddRowsView();
    };
    ////////
//    setAutoIdUdaId = (GridCols column) {
//      setState(()=>  column.value= column.value?? "");
//      updateColumnsWidgets();
//
//    };

    //Handle attachment columns change
    onAttachmentListChange =
        (GridCols column, List<AttachData> attachmentList) {
      log(LogType.DEBUG,
          'On grid ${column.caption} column value change ===== ${attachmentList.length}');
      column.value = attachmentList[0].attachmentName;
      column.attachments = attachmentList;
      view.updateAddRowsView();
      resolveColumnConditionalValidation(
          column, genericObject.udasValues, gridColumnsValues);
    };
    updateColumnsWidgets();
  }

  updateColumnsWidgets() {
    columnsWidgets = [];
    gridColumnsValues.forEach((column) {
      if (column.columnTextController == null) {
        column.columnTextController = TextEditingController();
      }
      resolveColumnConditionalValidation(
          column, genericObject?.udasValues, gridColumnsValues);
      if (column.columnTextController.text != column.value.toString())
        column.columnTextController.text = column.value?.toString() ?? "";
      columnsWidgets.add(Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
          child: getColumnWithTypeWidget(column)));
    });
  }

  Widget getColumnWithTypeWidget(GridCols column) {}

  setValueListColumnsList() {
    if (doesContainValueListUDA()) {
      gridColumnsValues.forEach((column) => {
            if (column.type == 4)
              {
                valueListColumns.add(column),
              }
          });

      valueListColumns =
          gridColumnsValues.where((column) => column.type == 4).toList();
    }
  }

  bool doesContainValueListUDA() {
    bool isValueListColumn = false;
    gridColumnsValues.forEach((column) => {
          if (column.type == 4) {isValueListColumn = true}
        });
    return isValueListColumn;
  }

  void getGridColumns(int udaRecId) {
    _gridUDARepository
        .getGridColumns(context, udaRecId)
        .then((c) => this.onLoadGridColumnsComplete(c))
        .catchError((onError) => this.onLoadGridColumnsError(onError));
  }

  void editGridUDA(BuildContext context, gridName, gridBody) {
    editAttachmentUDARepository
        .editGridUDA(context, gridName, gridBody)
        .then((value) => this.onEditGridSuccesssfully(value))
        .catchError((onError) => this.onEditGridError(onError));
  }

  @override
  void onLoadGridColumnsComplete(List<GridCols> grid) {
    setGridColumnsData(grid);
    view.updateAddRowsView();
  }

  setGridColumnsData(List<GridCols> grid) {
    gridColumnsValues = grid;
    isGridDataLoaded = true;
    if (mode == AddGridMode.editMode) {
      grid.forEach((gridColumn) {
        if (!listContainsColumn(gridColumn, rowListItems ??= []))
          rowListItems.add(gridColumn);
        //Prepare a list of grid columns names
        columnsNames.add(gridColumn.name);
      });
      gridColumnsValues.forEach((column) {
        column.value =
            rowListItems.firstWhere((row) => row.name == column.name).value;
        column.udaFormValueString = rowListItems
            .firstWhere((row) => row.name == column.name)
            .udaFormValueString;
      });
    }
    updateColumnsWidgets();
  }

  bool listContainsColumn(GridCols column, List<GridCols> list) {
    bool containsItem = false;
    list.forEach((listItem) {
      if (listItem.name == column.name) containsItem = true;
    });
    return containsItem;
  }

  @override
  void onLoadGridColumnsError(ErrorResponse error) {
    isGridDataLoaded = true;
    view.updateAddRowsView();
    if (error.code == CODE_EXPIRED_TOKEN)
      ShowExpiredTokenAlert(error.message, context);
  }

  @override
  void onEditGridError(error) {
    isEditingRecord = false;
    view.updateAddRowsView();
    log(LogType.ERROR, "Couldn't update record ${error.toString()}");
    ShowAlertMessage("Couldn't update record", context);
  }

  @override
  void onEditGridSuccesssfully(List<GridRowData> response) {
    //Remove deleted columns from row data
    response.forEach((responseRow) {
      responseRow.columnsList
          .removeWhere((column) => !columnsNames.contains(column.name));
    });

    //Add missed columns from row data
    gridColumnsValues.forEach((gridColumn) {
      response.forEach((responseRow) {
        if (!listContainsColumn(gridColumn, responseRow.columnsList ??= []))
          responseRow.columnsList.add(gridColumn);
      });
    });

    GridRowData rowOfFocus = GridRowData();
    if (mode == AddGridMode.newMode)
      rowOfFocus =
          response.firstWhere((row) => !rowsRecIDs.contains(row.recid));
    else
      rowOfFocus = response.firstWhere((row) => row.recid == gridRecID);
    rowData.columnsList.forEach((column) {
      column.value = rowOfFocus.columnsList
          .firstWhere((newColumn) => newColumn.name == column.name)
          .value;
    });
    Navigator.of(context).pop(rowData);
  }
}
