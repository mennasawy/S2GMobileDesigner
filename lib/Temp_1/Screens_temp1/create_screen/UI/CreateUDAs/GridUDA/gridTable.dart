import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridCols.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridRow.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/ErrorResponse/error_data.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/Grid/AllRowsScreenPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/Grid/GridUDAPresenter.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/GridUDA/grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// enum GridVisibility { normal, readOnly, addOnly, editOnly, mandatory }

class GridTable extends StatefulWidget {
  final String gridName;
  final int objectRecId;
  final String labelColor;
  final FormModes formMode;
  final UDAsWithValues gridUDA;
  final GenericObject genericObject;

  List<GridRowData> rowListItems;
  final Function(List<GridRowData>) onAddRows;

  final bool isVisible;
  bool isLocation = false;
  final String udaDescription;
  final String validationMessage;
  final bool isValidationMSGWarning;
  final GridVisibility gridValidation;

  GridTable(
      {Key key,
      this.gridName,
      this.rowListItems,
      this.gridUDA,
      this.onAddRows,
      this.objectRecId,
      this.formMode,
      this.isVisible,
      this.isLocation,
      this.validationMessage,
      this.isValidationMSGWarning,
      this.gridValidation,
      this.udaDescription,
      this.labelColor,
      this.genericObject})
      : super(key: key);

  @override
  _GridTableState createState() => _GridTableState();
}

class _GridTableState extends State<GridTable> implements GridUDAViewContract {
  // bool isGridDataLoaded = false;
  GridUDAPresenter gridPresenter;
  // List<List<GridCols>> gridRowListItems = [];
  // List<GridRowData> gridRowData = [];
  // List<GridCols> gridColumns = [];
  // List<String> columnsNames = [];
  // List<int> rowsRecIDs = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePresenter();
    gridPresenter.initializeItems();
  }

  @override
  void didUpdateWidget(GridTable oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (widget.rowListItems != oldWidget.rowListItems &&
        widget.formMode != FormModes.dictionaryModule)
      gridPresenter.updateGridValues();
  }

  @override
  Widget build(BuildContext context) {
    gridPresenter.loadGridData();
    // if (isGridDataLoaded == false) {
    //   loadGridData();
    // }

    return Column(
      children: [
        drawWidgetOrEmptyContainer(
            widget.isVisible == true && widget.isLocation != true,
            getGridUDAWithTitleWidget()),
        getValidationMessageWidget(
            widget.validationMessage, widget.isValidationMSGWarning)
      ],
    );
  }

  Container getGridUDAWithTitleWidget() {
    return Container(
      decoration: BoxDecoration(
          color: LITE_GREY.withOpacity(OPACITY),
          border: Border(
              top: BorderSide(width: 3.0, color: GREY),
              bottom: BorderSide(width: 3.0, color: GREY))),
      child: Container(
        key: widget.key,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: gridPresenter.hasDataToShow()
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        // padding: EdgeInsets.symmetric(vertical: 10),
                        child: getUDATitleWidget(
                            context,
                            widget.gridValidation == GridVisibility.mandatory,
                            widget.gridName,
                            widget.udaDescription,
                            hexToColor(widget.labelColor)),
                      ),
                      drawWidgetOrEmptyContainer(
                          !gridPresenter
                              .isListEmpty(gridPresenter.gridRowListItems),
                          getAddButtonWidget(BTN_ADD_GRID_BLUEE)),
                    ],
                  ),
                  (gridPresenter.isListEmpty(gridPresenter.gridRowListItems))
                      ? getClickToAddNewWidget()
                      : getAppreviatedRowsListWidget(),
                  drawWidgetOrEmptyContainer(
                      !gridPresenter
                          .isListEmpty(gridPresenter.gridRowListItems),
                      getSeeAllListWidget(context)),
                ],
              )
            : DrawProgressBar(),
      ),
    );
  }

  //TODO: Widgets Drawing Methods
  Widget getClickToAddNewWidget() {
    return (widget.gridValidation != GridVisibility.readOnly)
        ? Center(
            child: FlatButton(
              onPressed: () {},
              child: Column(
                children: <Widget>[
                  getAddButtonWidget(BTN_ADD_NEW_GRID),
                  Text(
                    "Click To Add New",
                    style: TextStyle(color: BLUE),
                  ),
                ],
              ),
            ),
          )
        : Container();
  }

  Widget getAddButtonWidget(String iconName) {
    return (widget.gridValidation != GridVisibility.readOnly)
        ? IconButton(
            icon: Icon(Icons.add),
            onPressed: gridPresenter.onAddGridRowAction,

            // (widget.gridValidation != GridVisibility.editOnly &&
            //         widget.gridUDA.isReadOnly != true)
            //     ? () {
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (BuildContext context) => AddGridScreen(
            //                       rowsRecIDs: gridPresenter.rowsRecIDs,
            //                       gridUDA: widget.gridUDA,
            //                       mode: AddGridMode.newMode,
            //                       formMode: widget.formMode,
            //                       objectRecId: widget.objectRecId,
            //                       genericObject: widget.genericObject,
            //                     ))).then((value) async {
            //           if (value != null)
            //             await gridPresenter.refreshRowsList(value);
            //         });
            //       }
            //     : null
          )
        : Container();
  }

  Container getAppreviatedRowsListWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          getGridRowItem(0),
          (gridPresenter.gridRowListItems.length == 1)
              ? Container()
              : getGridRowItem(1),
        ],
      ),
    );
  }

  Widget getSeeAllListWidget(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: FlatButton(
            shape: Border(),
            child: Text(
              "See All List",
              style: TextStyle(color: BLUE),
            ),
            onPressed: gridPresenter.navigateToAllRowsScreen,

            // () {
            //   Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (BuildContext context) => GridAllRowsScreen(
            //                 gridRowsValues: gridPresenter.gridRowListItems,
            //                 gridUDA: widget.gridUDA,
            //                 rowListItems: widget.rowListItems,
            //                 objectRecId: widget.objectRecId,
            //                 formMode: widget.formMode,
            //                 onAddRows: widget.onAddRows,
            //                 onEditRefresh: gridPresenter.refreshRowsList,
            //                 gridValidation: widget.gridValidation,
            //                 genericObject: widget.genericObject,
            //                 rowsRecIDs: gridPresenter.rowsRecIDs,
            //               ))).then((value) async {
            //     gridPresenter.refreshList();
            //   });
            //   //Navigator.pushNamed(context, GRID_ROWS_SCREEN);
            // },
          ),
        ),
      ],
    );
  }

  Widget getGridRowItem(int rowIndex) {
    return GridRowItem(
      dataSource: gridPresenter.gridRowListItems[rowIndex],
      gridUDA: widget.gridUDA,
      gridRowData: widget.rowListItems[rowIndex],
      gridRowIndex: rowIndex,
      objectRecId: widget.objectRecId,
      onEditRefresh: gridPresenter.refreshRowsList,
      formMode: widget.formMode,
      gridValidation: widget.gridValidation,
      ondelete: gridPresenter.refreshRowsListonDelete,
      genericObject: widget.genericObject,
    );
  }

  //Helping Methods
  // initializeItems() {
  //   (widget.rowListItems != null)
  //       ? widget.rowListItems.forEach((row) {
  //           gridPresenter.gridRowListItems.add(row.columnsList);
  //           gridPresenter.rowsRecIDs.add(row.recid);
  //         })
  //       : gridPresenter.gridRowListItems = [];
  //   gridPresenter.gridRowData = widget.rowListItems;
  // }

  // updateGridValues() {
  //   setState(() {
  //     gridRowListItems = [];
  //     (widget.rowListItems != null)
  //         ? widget.rowListItems
  //             .forEach((row) => gridRowListItems.add(row.columnsList))
  //         : gridRowListItems = [];
  //     gridRowData = widget.rowListItems;
  //     isGridDataLoaded = false;
  //   });
  //   loadGridData();
  // }

  // loadGridData() {
  //   gridPresenter = GridUDAPresenter(context: context, gridView: this);
  //   gridPresenter.getGridColumns(widget.gridUDA.recId);
  //   // if (widget.formMode == FormModes.dictionaryModule) gridPresenter.getDictionaryModuleGridData(widget.gridUDA.recId, widget.gridUDA.udaName);
  // }

  // bool isListEmpty(List list) {
  //   if (gridRowListItems == null || gridRowListItems.isEmpty) return true;
  //   return false;
  // }

  // Future<void> refreshRowsList(rowList) async {
  //   // await Future.delayed(Duration(seconds: 0));
  //   setState(() {
  //     if (rowList.gridRowDataMode == AddGridMode.newMode) {
  //       gridRowListItems.add(rowList.columnsList);
  //       gridRowData.add(rowList);
  //       widget.onAddRows(gridRowData);
  //     } else {
  //       gridRowListItems[rowList.rowIndex] = rowList.columnsList;
  //       gridRowData[rowList.rowIndex] = rowList;
  //       widget.onAddRows(gridRowData);
  //     }
  //   });
  // }

  initializePresenter() {
    gridPresenter = GridUDAPresenter(
      context: context,
      gridView: this,
      gridName: widget.gridName,
      objectRecId: widget.objectRecId,
      labelColor: widget.labelColor,
      formMode: widget.formMode,
      gridUDA: widget.gridUDA,
      genericObject: widget.genericObject,
      rowListItems: widget.rowListItems,
      onAddRows: widget.onAddRows,
      isVisible: widget.isVisible,
      udaDescription: widget.udaDescription,
      validationMessage: widget.validationMessage,
      isValidationMSGWarning: widget.isValidationMSGWarning,
      gridValidation: widget.gridValidation,
    );
  }

  @override
  void setGridData(List<GridCols> grid) {
    // TODO: implement setGridData
    setState(() {
      //Add empty columns to row data
      // grid.forEach((gridColumn) {
      //   gridRowListItems.forEach((gridRowList) {
      //     if (!listContainsColumn(gridColumn, gridRowList))
      //       gridRowList.add(gridColumn);
      //   });
      //   //Prepare a list of grid columns names
      //   columnsNames.add(gridColumn.name);
      // });

      // //Remove deleted columns from row data
      // gridRowListItems.forEach((rowData) {
      //   rowData.removeWhere((column) => !columnsNames.contains(column.name));
      // });
      // gridRowListItems.forEach((row) {
      //   //Set column captions in row data
      //   row.forEach((column) => {
      //         column.name = grid
      //             .firstWhere((gridColumn) => gridColumn.name == column.name)
      //             .name,
      //         column.headerName = grid
      //             .firstWhere((gridColumn) => gridColumn.name == column.name)
      //             .headerName,
      //         column.type = grid
      //             .firstWhere((gridColumn) => gridColumn.name == column.name)
      //             .type,
      //       });
      //   //Set each row data with columns rec ID
      //   row.forEach((column) => column.recId = grid
      //       .firstWhere((gridColumn) => gridColumn.name == column.name)
      //       .recId);
      // });

      // //Sort each row with its column rec ID
      // gridRowListItems
      //     .forEach((row) => row.sort((a, b) => a.recId.compareTo(b.recId)));
      // gridColumns = grid;
    });
    // if (widget.formMode == FormModes.dictionaryModule)
    //   gridPresenter.getDictionaryModuleGridData(
    //       widget.gridUDA.recId, widget.gridUDA.udaName);
    // isGridDataLoaded = true;
  }

  // bool listContainsColumn(GridCols column, List<GridCols> list) {
  //   bool containsItem = false;
  //   list.forEach((listItem) {
  //     if (listItem.name == column.name) containsItem = true;
  //   });
  //   return containsItem;
  // }

  // Future<void> refreshRowsListonDelete(int index) async {
  //   await Future.delayed(Duration(seconds: 0));
  //   setState(() {
  //     gridRowListItems.removeAt(index);
  //     gridRowData.removeAt(index);
  //     widget.onAddRows(gridRowData);
  //   });
  // }

  // Future<Null> refreshList() async {
  //   setState(() {
  //     isGridDataLoaded = false;
  //     //  isLoadTasksPresenterCalled = false;
  //   });
  //   await Future.delayed(Duration(seconds: 0));
  //   setState(() {
  //     loadGridData();
  //   });
  //   return null;
  // }

  @override
  void onLoadGridColumnsError(ErrorResponse error) {
    // TODO: implement onLoadGridColumnsError
  }

  @override
  void setDictionaryModuleGridData(List<GridRowData> gridRows) {
    // TODO: implement setDictionaryModuleGridData
    setState(() {
      // if (gridRowListItems == null) gridRowListItems = [];
      // if (gridRows != null && !isNotEmptyList(gridRowListItems))
      //   gridRows.forEach((row) {
      //     rowsRecIDs.add(row.recid);
      //     gridRowListItems.add(row.columnsList);
      //   });

      // //Add empty columns to row data
      // gridColumns.forEach((gridColumn) {
      //   gridRowListItems.forEach((gridRowList) {
      //     if (!listContainsColumn(gridColumn, gridRowList))
      //       gridRowList.add(gridColumn);
      //   });
      //   //Prepare a list of grid columns names
      //   columnsNames.add(gridColumn.name);
      // });

      // gridRowData = gridRows;
      // //Remove deleted columns from row data
      // gridRowData.forEach((rowData) {
      //   rowData.columnsList
      //       .removeWhere((column) => !columnsNames.contains(column.name));
      // });
      // gridRowData.forEach((row) {
      //   //Set column captions in row data
      //   row.columnsList.forEach((column) => {
      //         column.name = gridColumns
      //             .firstWhere((gridColumn) => gridColumn.name == column.name)
      //             .name,
      //         column.headerName = gridColumns
      //             .firstWhere((gridColumn) => gridColumn.name == column.name)
      //             .headerName,
      //       });
      //   //Set each row data with columns rec ID
      //   row.columnsList.forEach((column) => column.recId = gridColumns
      //       .firstWhere((gridColumn) => gridColumn.name == column.name)
      //       .recId);
      // });
      // gridRowData.forEach(
      //     (row) => row.columnsList.sort((a, b) => a.recId.compareTo(b.recId)));
      // widget.rowListItems = gridRows;
      // widget.onAddRows(gridRowData);
      // isGridDataLoaded = true;
    });
  }

  @override
  void updateGridView() {
    setState(() {});
  }
}
