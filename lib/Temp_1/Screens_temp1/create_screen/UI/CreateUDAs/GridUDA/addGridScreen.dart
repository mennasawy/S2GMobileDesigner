import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridCols.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/Grid/EditGridUDAPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/Grid/Template1/Temp1EditGridUDAPresenter.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBarTemplate1/NTGAppBar.dart';
import 'package:templets/Utilities/WidgetsUtilites/RaisedButtonWidget.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

class AddGridScreen extends StatefulWidget {
  final int gridRecID;
  final int editRowIndex;
  final int objectRecId;

  final AddGridMode mode;
  final FormModes formMode;

  final List<int> rowsRecIDs;
  final UDAsWithValues gridUDA;
  final GenericObject genericObject;
  List<GridCols> rowListItems;

  AddGridScreen({
    Key key,
    this.gridUDA,
    this.mode,
    this.rowListItems,
    this.gridRecID,
    this.editRowIndex,
    this.objectRecId,
    this.formMode,
    this.genericObject,
    this.rowsRecIDs,
  }) : super(key: key);

  @override
  _AddGridScreenState createState() => _AddGridScreenState();
}

class _AddGridScreenState extends State<AddGridScreen>
    implements EditGridUDAViewInterface {
  Temp1EditGridUDAPresenter editGridRowPresenter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePresenter();
    editGridRowPresenter.initializeItems();
  }

  @override
  void didUpdateWidget(covariant AddGridScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    editGridRowPresenter.updateColumnsWidgets();
  }

  @override
  Widget build(BuildContext context) {
    editGridRowPresenter.loadGridData();
    // if (isGridDataLoaded == false) loadGridData();
    editGridRowPresenter.updateColumnsWidgets();
    return SafeArea(
      child: Scaffold(
//          resizeToAvoidBottomPadding: false,
          appBar: NTGAppBar(
            pageName: widget.gridUDA.udaCaption ?? widget.gridUDA.udaName,
//            pageName: AppLocalizations.of(context).translate('grid_item'),
            appBarType: AppBarType.appBarWithBack,
          ),
          body: editGridRowPresenter.isGridDataLoaded
              ? getScreenContentWidget(context)
              : DrawProgressBar()),
    );
  }

  Stack getScreenContentWidget(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(child: getColumnsWidget(context), flex: 8),
            Expanded(child: getSubmitButtonWidget(context), flex: 1),
          ],
        ),
        drawWidgetOrEmptyContainer(
            editGridRowPresenter.isEditingRecord, DrawProgressBar()),
      ],
    );
  }

  Container getColumnsWidget(BuildContext context) {
    return Container(
      height: getScreenHeight(context) * 0.8,
      child: KeyboardAvoider(
        autoScroll: true,
        child: ListView.builder(
          shrinkWrap: true,
          controller: editGridRowPresenter.columnsListController,
          itemCount: editGridRowPresenter.columnsWidgets.length,
          itemBuilder: (context, index) {
            return editGridRowPresenter.columnsWidgets[index];
          },
        ),
      ),
    );
  }

  Widget getSubmitButtonWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
      child: NTGButton(
        buttonText: 'Save',
        onPressedButton: !editGridRowPresenter.isEditingRecord
            ? () {
                editGridRowPresenter.onSubmitClicked();
              }
            : null,
      ),
    );
  }

  //Separate Done..
  // onSubmitClicked() {
  //   if (validMandatoryFields()) {
  //     setRowData();
  //     if (widget.formMode == FormModes.editMode ||
  //         widget.formMode == FormModes.dictionaryModule) {
  //       editGridRow();
  //       setState(() {
  //         isEditingRecord = true;
  //       });
  //     } else
  //       Navigator.of(context).pop(rowData);
  //   } else
  //     ShowAlertMessage(
  //         AppLocalizations.of(context).translate("fill_Missed_Data_Create"),
  //         context);
  // }

  //Separate Done..
  // bool validMandatoryFields() {
  //   bool isValid = true;
  //   gridColumnsValues.forEach((gridColumn) {
  //     if (gridColumn.isMandatory == true) {
  //       isValid = (!isEmptyText(gridColumn.value)) ? isValid : false;
  //     }
  //   });
  //   return isValid;
  // }

  //Separate Done..
  // editGridRow() {
  //   editGridRowPresenter = EditGridUDAPrsenter(view: this);
  //   editGridRowPresenter.editGridUDA(context, widget.gridUDA.udaName, rowData);
  // }

  //Separate Done..
  // setRowData() {
  //   int recID;
  //   if (widget.formMode == FormModes.newMode ||
  //       widget.formMode == FormModes.cloneMode)
  //     recID = -1;
  //   else {
  //     recID = getRecId();
  //   }
  //   rowData = GridRowData(
  //     recid: recID,
  //     udaId: widget.gridUDA.recId,
  //     columnsList: gridColumnsValues,
  //     gridRowDataMode: widget.mode,
  //     rowIndex: widget.editRowIndex,
  //     objectId: widget.objectRecId,
  //   );
  // }

  //Separate Done..
  // int getRecId() {
  //   int recId = -1;
  //   if (widget.mode == AddGridMode.newMode) {
  //     if (widget.gridUDA.rowData != null) {
  //       recId = widget.gridUDA.rowData.length + 1 * -1;
  //     }
  //   } else {
  //     recId = widget.gridRecID;
  //   }
  //   return recId;
  // }

  //Initializations
  initializePresenter() {
    editGridRowPresenter = Temp1EditGridUDAPresenter(
      view: this,
      context: context,
      gridRecID: widget.gridRecID,
      editRowIndex: widget.editRowIndex,
      objectRecId: widget.objectRecId,
      mode: widget.mode,
      formMode: widget.formMode,
      rowsRecIDs: widget.rowsRecIDs,
      gridUDA: widget.gridUDA,
      genericObject: widget.genericObject,
      rowListItems: widget.rowListItems,
    );
  }

  //Separate Done..
//   initializeItems() {
//     gridColumnsValues.forEach((column) => {
//           column.value = null,
//           resolveColumnConditionalValidation(
//               column, widget.genericObject.udasValues, gridColumnsValues)
//         });

//     //Handle text columns change
//     onTextColumnValueChange =
//         (GridCols column, String value, List<GridCols> columns) {
//       setState(() {
//         if (column.type == 1 && isEmptyText(value))
//           column.value = null;
//         else
//           column.value =
//               (column.type == 1) ? (int.tryParse(value) ?? 0) : value;
//         if (column.type == 1 &&
//             isContainCalculatedFiled(gridColumnsValues) == true)
//           updateColumnsWidgets();
//       });
//       resolveColumnConditionalValidation(
//           column, widget.genericObject.udasValues, gridColumnsValues);
//     };

//     //Handle checkbox columns change
//     onCheckboxValueChange = (GridCols column, bool value) {
//       setState(() => {
//             column.value = (value == true) ? 1 : 0,
//           });
//       resolveColumnConditionalValidation(
//           column, widget.genericObject.udasValues, gridColumnsValues);
//     };

//     //Handle value list columns change
//     onValueListValueChange = (GridCols column, String value) {
//       if (column.repositoryUDAMV != null) //Repository is set from admin
//       {
//         setState(() {
//           column.value = value;
//         });
//       }
//       resolveColumnConditionalValidation(
//           column, widget.genericObject.udasValues, gridColumnsValues);
//     };

//     //Handle columns mapping on form list column
//     setMappedColumns = (List<GridCols> columns) {
//       setState(() {
//         columns.forEach((column) => {
//               gridColumnsValues
//                   .firstWhere((gridColumn) => column.name == gridColumn.name)
//                   .value = column.value,
//               resolveColumnConditionalValidation(
//                   column, widget.genericObject.udasValues, gridColumnsValues),
//             });
//         updateColumnsWidgets();
//       });
//     };
//     ////////
// //    setAutoIdUdaId = (GridCols column) {
// //      setState(()=>  column.value= column.value?? "");
// //      updateColumnsWidgets();
// //
// //    };

//     //Handle attachment columns change
//     onAttachmentListChange =
//         (GridCols column, List<AttachData> attachmentList) {
//       log(LogType.DEBUG,
//           'On grid ${column.caption} column value change ===== ${attachmentList.length}');
//       setState(() {
//         column.value = attachmentList[0].attachmentName;
//         column.attachments = attachmentList;
//       });
//       resolveColumnConditionalValidation(
//           column, widget.genericObject.udasValues, gridColumnsValues);
//     };
//     updateColumnsWidgets();
//   }

  //Separate Done..
  //Prepare list of value list columns for value list dependency
  //not used as parameters needed for dependency are not completed
  // setValueListColumnsList() {
  //   if (doesContainValueListUDA()) {
  //     gridColumnsValues.forEach((column) => {
  //           if (column.type == 4)
  //             {
  //               valueListColumns.add(column),
  //             }
  //         });

  //     valueListColumns =
  //         gridColumnsValues.where((column) => column.type == 4).toList();
  //   }
  // }

  //Separate Done..
  // bool doesContainValueListUDA() {
  //   bool isValueListColumn = false;
  //   gridColumnsValues.forEach((column) => {
  //         if (column.type == 4) {isValueListColumn = true}
  //       });
  //   return isValueListColumn;
  // }

  //Separate Done..
  // Widget getColumnWithTypeWidget(GridCols column) {
  //   switch (column.type) {
  //     case 1:
  //       return getNumericColumnWidget(
  //           column, onTextColumnValueChange, gridColumnsValues);
  //       break;
  //     case 2:
  //       return getTextFieldColumnWidget(
  //           column, onTextColumnValueChange, gridColumnsValues);
  //       break;
  //     case 3:
  //       return getValueListColumnWidget(
  //           column, onValueListValueChange, valueListColumns);
  //       break;
  //     case 4:
  //       return getDateColumnWidget(
  //           column, onTextColumnValueChange, gridColumnsValues);
  //       break;
  //     case 5:
  //       return getTimeColumnWidget(
  //           column, onTextColumnValueChange, gridColumnsValues);
  //       break;
  //     case 6:
  //       return getFormColumnWidget(
  //           column,
  //           widget.gridUDA.udaName,
  //           widget.genericObject,
  //           widget.mode,
  //           gridColumnsValues,
  //           setMappedColumns,
  //           onTextColumnValueChange);
  //       break;
  //     case 7:
  //       return getCalculatedColumnWidget(column, gridColumnsValues);
  //       break;
  //     case 8:
  //       return getDateTimeColumnWidget(
  //           column, onTextColumnValueChange, gridColumnsValues);
  //       break;
  //     case 9:
  //       return getAttachmentColumnWidget(
  //           column, widget.mode, onAttachmentListChange, widget.objectRecId);
  //       break;
  //     case 10:
  //       return getImageColumnWidget(
  //           column, onTextColumnValueChange, gridColumnsValues);
  //       break;
  //     case 14:
  //       return getCheckBoxColumnWidget(column, onCheckboxValueChange);
  //       break;
  //     case 19:
  //       return getAutoIDColumnWidget(column, setAutoIdUdaId, widget.mode);
  //       break;
  //     default:
  //       return Container();
  //   }
  // }

  //Separate Done..
  // loadGridData() {
  //   gridPresenter = GridUDAPresenter(context: context, gridView: this);
  //   gridPresenter.getGridColumns(widget.gridUDA.recId);
  // }

  //Separate Done..
  // updateColumnsWidgets() {
  //   columnsWidgets = [];
  //   gridColumnsValues.forEach((column) {
  //     if (column.columnTextController == null) {
  //       column.columnTextController = TextEditingController();
  //     }
  //     resolveColumnConditionalValidation(
  //         column, widget.genericObject?.udasValues, gridColumnsValues);
  //     if (column.columnTextController.text != column.value.toString())
  //       column.columnTextController.text = column.value?.toString() ?? "";
  //     columnsWidgets.add(Padding(
  //         padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
  //         child: getColumnWithTypeWidget(column)));
  //   });
  // }

  // @override
  // void setGridData(List<GridCols> grid) {
  //   // TODO: implement setGridData
  //   //Separate Done..
  //   setState(() {
  //     gridColumnsValues = grid;
  //     isGridDataLoaded = true;
  //     if (widget.mode == AddGridMode.editMode) {
  //       grid.forEach((gridColumn) {
  //         if (!listContainsColumn(gridColumn, widget.rowListItems ??= []))
  //           widget.rowListItems.add(gridColumn);
  //         //Prepare a list of grid columns names
  //         columnsNames.add(gridColumn.name);
  //       });
  //       gridColumnsValues.forEach((column) {
  //         column.value = widget.rowListItems
  //             .firstWhere((row) => row.name == column.name)
  //             .value;
  //         column.udaFormValueString = widget.rowListItems
  //             .firstWhere((row) => row.name == column.name)
  //             .udaFormValueString;
  //       });
  //     }
  //     updateColumnsWidgets();
  //   });
  // }

  // @override
  // void onLoadGridColumnsError(ErrorResponse error) {
  //   // TODO: implement onLoadGridColumnsError
  //   //Separate Done..
  //   setState(() {
  //     isGridDataLoaded = true;
  //   });
  //   if (error.code == CODE_EXPIRED_TOKEN)
  //     ShowExpiredTokenAlert(error.message, context);
  // }

  //Separate Done..
  // bool listContainsColumn(GridCols column, List<GridCols> list) {
  //   bool containsItem = false;
  //   list.forEach((listItem) {
  //     if (listItem.name == column.name) containsItem = true;
  //   });
  //   return containsItem;
  // }

  // @override
  // void onEditGridError(error) {
  //   // TODO: implement onEditGridError
  //   //Separate Done..
  //   setState(() {
  //     isEditingRecord = false;
  //   });
  //   log(LogType.ERROR, "Couldn't update record ${error.toString()}");
  //   ShowAlertMessage("Couldn't update record", context);
  // }

  @override
  // void onEditGridSuccesssfully(List<GridRowData> response) {
  //   // TODO: implement onEditGridSuccesssfully

  //   //Separate ..
  //   //Remove deleted columns from row data
  //   response.forEach((responseRow) {
  //     responseRow.columnsList
  //         .removeWhere((column) => !columnsNames.contains(column.name));
  //   });

  //   //Add missed columns from row data
  //   gridColumnsValues.forEach((gridColumn) {
  //     response.forEach((responseRow) {
  //       if (!listContainsColumn(gridColumn, responseRow.columnsList ??= []))
  //         responseRow.columnsList.add(gridColumn);
  //     });
  //   });

  //   GridRowData rowOfFocus = GridRowData();
  //   if (widget.mode == AddGridMode.newMode)
  //     rowOfFocus =
  //         response.firstWhere((row) => !widget.rowsRecIDs.contains(row.recid));
  //   else
  //     rowOfFocus = response.firstWhere((row) => row.recid == widget.gridRecID);
  //   rowData.columnsList.forEach((column) {
  //     column.value = rowOfFocus.columnsList
  //         .firstWhere((newColumn) => newColumn.name == column.name)
  //         .value;
  //   });
  //   Navigator.of(context).pop(rowData);
  // }

  // @override
  // void setDictionaryModuleGridData(List<GridRowData> gridRows) {
  //   // TODO: implement setDictionaryModuleGridData
  // }

  // @override
  // void updateGridView() {
  //   setState(() {});
  // }

  @override
  void updateAddRowsView() {
    setState(() {});
  }
}
