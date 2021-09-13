import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridCols.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridRow.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/ErrorResponse/error_data.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/Grid/AllRowsScreenPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/Grid/EditGridUDAPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/GridUDA/addGridScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/GridUDA/gridAllRowsScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/GridUDA/gridTable.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2GridUDA/Temp2AddGridScreen.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2GridUDA/Temp2GridAllRowsScreen.dart';

abstract class GridUDAContract {
  void onLoadGridColumnsComplete(List<GridCols> grid);
  void onLoadGridColumnsError(ErrorResponse error);
  void onLoadDictionaryModGridComplete(List<GridRowData> gridRows);
  void onLoadDictionaryModGridError(error);
}

abstract class GridUDAViewContract {
  void updateGridView();
  // void setGridData(List<GridCols> grid);
  // void onLoadGridColumnsError(ErrorResponse error);
  // void setDictionaryModuleGridData(List<GridRowData> gridRows);
}

class GridUDAPresenter implements GridUDAContract {
  GridUDARepository _gridUDARepository;
  DictionaryModuleGridRepository _dictionaryModuleGridRepo;
  GridUDAViewContract gridView;
  BuildContext context;

  //#########UI related parameters#########
  bool isGridDataLoaded = false;
  List<List<GridCols>> gridRowListItems = [];
  List<GridRowData> gridRowData = [];
  List<GridCols> gridColumns = [];
  List<String> columnsNames = [];
  List<int> rowsRecIDs = [];

  final String gridName;
  final int objectRecId;
  final String labelColor;
  final FormModes formMode;
  final UDAsWithValues gridUDA;
  final GenericObject genericObject;

  List<GridRowData> rowListItems;
  final Function(List<GridRowData>) onAddRows;

  final bool isVisible;
  final bool isLocation = false;
  final String udaDescription;
  final String validationMessage;
  final bool isValidationMSGWarning;
  final GridVisibility gridValidation;

  GridUDAPresenter({
    this.gridName,
    this.objectRecId,
    this.labelColor,
    this.formMode,
    this.gridUDA,
    this.genericObject,
    this.rowListItems,
    this.onAddRows,
    this.isVisible,
    this.udaDescription,
    this.validationMessage,
    this.isValidationMSGWarning,
    this.gridValidation,
    this.context,
    this.gridView,
  }) {
    _gridUDARepository = Injector().gridUDARepo;
    _dictionaryModuleGridRepo = Injector().dictionaryModuleRepo;
  }

  //#########UI related methods#########
  initializeItems() {
    (rowListItems != null)
        ? rowListItems.forEach((row) {
            gridRowListItems.add(row.columnsList);
            rowsRecIDs.add(row.recid);
          })
        : gridRowListItems = [];
    gridRowData = rowListItems;
  }

  updateGridData(GridTable widget, GridTable oldWidget) {
    if (widget.rowListItems != oldWidget.rowListItems &&
        widget.formMode != FormModes.dictionaryModule) updateGridValues();
  }

  updateGridValues() {
    gridRowListItems = [];
    (rowListItems != null)
        ? rowListItems.forEach((row) => gridRowListItems.add(row.columnsList))
        : gridRowListItems = [];
    gridRowData = rowListItems;
    isGridDataLoaded = false;
    gridView.updateGridView();
    getGridColumns(gridUDA.recId);
  }

  loadGridData() {
    if (isGridDataLoaded == false) {
      getGridColumns(gridUDA.recId);
    }
  }

  hasDataToShow() {
    return isGridDataLoaded || isListEmpty(gridRowListItems);
  }

  onAddGridRowAction() {
    if (gridValidation != GridVisibility.editOnly &&
        gridUDA.isReadOnly != true) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => AddGridScreen(
                    rowsRecIDs: rowsRecIDs,
                    gridUDA: gridUDA,
                    mode: AddGridMode.newMode,
                    formMode: formMode,
                    objectRecId: objectRecId,
                    genericObject: genericObject,
                  ))).then((value) async {
        if (value != null) await refreshRowsList(value);
      });
    }
  }

  temp2OnAddGridRowAction() {
    Navigator.push(
        context,
        openAnimatedRoute(Temp2AddGridScreen(
          rowsRecIDs: rowsRecIDs,
          gridUDA: gridUDA,
          mode: AddGridMode.newMode,
          formMode: formMode,
          objectRecId: objectRecId,
          genericObject: genericObject,
        ))).then((value) async {
      if (value != null) await refreshRowsList(value);
    });
  }

  navigateToAllRowsScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => GridAllRowsScreen(
                  gridRowsValues: gridRowListItems,
                  gridUDA: gridUDA,
                  rowListItems: rowListItems,
                  objectRecId: objectRecId,
                  formMode: formMode,
                  onAddRows: onAddRows,
                  onEditRefresh: refreshRowsList,
                  gridValidation: gridValidation,
                  genericObject: genericObject,
                  rowsRecIDs: rowsRecIDs,
                ))).then((value) async {
      refreshList();
    });
  }

  temp2NavigateToAllRowsScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => Temp2GridAllRowsScreen(
                  gridRowsValues: gridRowListItems,
                  gridUDA: gridUDA,
                  rowListItems: rowListItems,
                  objectRecId: objectRecId,
                  formMode: formMode,
                  onAddRows: onAddRows,
                  onEditRefresh: refreshRowsList,
                  gridValidation: gridValidation,
                  genericObject: genericObject,
                  rowsRecIDs: rowsRecIDs,
                ))).then((value) async {
      refreshList();
    });
  }

  Future<void> refreshRowsList(rowList) async {
    // await Future.delayed(Duration(seconds: 0));
    if (rowList.gridRowDataMode == AddGridMode.newMode) {
      gridRowListItems.add(rowList.columnsList);
      gridRowData.add(rowList);
      onAddRows(gridRowData);
    } else {
      gridRowListItems[rowList.rowIndex] = rowList.columnsList;
      gridRowData[rowList.rowIndex] = rowList;
      onAddRows(gridRowData);
    }
    gridView.updateGridView();
  }

  bool isListEmpty(List list) {
    if (gridRowListItems == null || gridRowListItems.isEmpty) return true;
    return false;
  }

  setGridData(List<GridCols> grid) {
    //Add empty columns to row data
    grid.forEach((gridColumn) {
      gridRowListItems.forEach((gridRowList) {
        if (!listContainsColumn(gridColumn, gridRowList))
          gridRowList.add(gridColumn);
      });
      //Prepare a list of grid columns names
      columnsNames.add(gridColumn.name);
    });

    //Remove deleted columns from row data
    gridRowListItems.forEach((rowData) {
      rowData.removeWhere((column) => !columnsNames.contains(column.name));
    });
    gridRowListItems.forEach((row) {
      //Set column captions in row data
      row.forEach((column) => {
            column.name = grid
                .firstWhere((gridColumn) => gridColumn.name == column.name)
                .name,
            column.headerName = grid
                .firstWhere((gridColumn) => gridColumn.name == column.name)
                .headerName,
            column.type = grid
                .firstWhere((gridColumn) => gridColumn.name == column.name)
                .type,
          });
      //Set each row data with columns rec ID
      row.forEach((column) => column.recId = grid
          .firstWhere((gridColumn) => gridColumn.name == column.name)
          .recId);
    });

    //Sort each row with its column rec ID
    gridRowListItems
        .forEach((row) => row.sort((a, b) => a.recId.compareTo(b.recId)));
    gridColumns = grid;
    //Setstae
    if (formMode == FormModes.dictionaryModule)
      getDictionaryModuleGridData(gridUDA.recId, gridUDA.udaName);
    isGridDataLoaded = true;
  }

  setDictionaryModuleGridData(List<GridRowData> gridRows) {
    if (gridRowListItems == null) gridRowListItems = [];
    if (gridRows != null && !isNotEmptyList(gridRowListItems))
      gridRows.forEach((row) {
        rowsRecIDs.add(row.recid);
        gridRowListItems.add(row.columnsList);
      });

    //Add empty columns to row data
    gridColumns.forEach((gridColumn) {
      gridRowListItems.forEach((gridRowList) {
        if (!listContainsColumn(gridColumn, gridRowList))
          gridRowList.add(gridColumn);
      });
      //Prepare a list of grid columns names
      columnsNames.add(gridColumn.name);
    });

    gridRowData = gridRows;
    //Remove deleted columns from row data
    gridRowData.forEach((rowData) {
      rowData.columnsList
          .removeWhere((column) => !columnsNames.contains(column.name));
    });
    gridRowData.forEach((row) {
      //Set column captions in row data
      row.columnsList.forEach((column) => {
            column.name = gridColumns
                .firstWhere((gridColumn) => gridColumn.name == column.name)
                .name,
            column.headerName = gridColumns
                .firstWhere((gridColumn) => gridColumn.name == column.name)
                .headerName,
          });
      //Set each row data with columns rec ID
      row.columnsList.forEach((column) => column.recId = gridColumns
          .firstWhere((gridColumn) => gridColumn.name == column.name)
          .recId);
    });
    gridRowData.forEach(
        (row) => row.columnsList.sort((a, b) => a.recId.compareTo(b.recId)));
    rowListItems = gridRows;
    onAddRows(gridRowData);
    isGridDataLoaded = true;
    gridView.updateGridView();
  }

  bool listContainsColumn(GridCols column, List<GridCols> list) {
    bool containsItem = false;
    list.forEach((listItem) {
      if (listItem.name == column.name) containsItem = true;
    });
    return containsItem;
  }

  Future<void> refreshRowsListonDelete(int index) async {
    await Future.delayed(Duration(seconds: 0));
    gridRowListItems.removeAt(index);
    gridRowData.removeAt(index);
    onAddRows(gridRowData);
    gridView.updateGridView();
  }

  Future<Null> refreshList() async {
    isGridDataLoaded = false;
    await Future.delayed(Duration(seconds: 0));
    getGridColumns(gridUDA.recId);
    gridView.updateGridView();
    return null;
  }

  void getGridColumns(int udaRecId) {
    _gridUDARepository
        .getGridColumns(context, udaRecId)
        .then((c) => this.onLoadGridColumnsComplete(c))
        .catchError((onError) => this.onLoadGridColumnsError(onError));
  }

  void getDictionaryModuleGridData(num udaID, String udaName) {
    _dictionaryModuleGridRepo
        .getDictionaryModuleData(context, udaID, udaName)
        .then((c) => this.onLoadDictionaryModGridComplete(c))
        .catchError((onError) => this.onLoadDictionaryModGridError(onError));
  }

  @override
  void onLoadGridColumnsComplete(List<GridCols> grid) {
    setGridData(grid);
    gridView.updateGridView();
  }

  @override
  void onLoadGridColumnsError(ErrorResponse error) {}

  @override
  void onLoadDictionaryModGridComplete(List<GridRowData> gridRows) {
    setDictionaryModuleGridData(gridRows);
    gridView.updateGridView();
    // gridView.setDictionaryModuleGridData(gridRows);
  }

  @override
  void onLoadDictionaryModGridError(error) {}
}
