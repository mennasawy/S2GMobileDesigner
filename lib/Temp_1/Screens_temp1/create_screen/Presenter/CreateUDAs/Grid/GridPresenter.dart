import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/DeleteGridModel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridCols.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridRow.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/ErrorResponse/error_data.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/Grid/AllRowsScreenPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/Grid/EditGridUDAPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/GridUDA/addGridScreen.dart';
import 'package:templets/Utilities/api_constant.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/const.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Utilities/WidgetsUtilites/Alerts/dual_action_alert.dart';
import 'package:templets/dependency_injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class GridItemContract {
  void onDeleteGridRecordSuccess();
  void onDeleteGridRecordError(ErrorResponse err);
}

abstract class GridViewContract {
  updateGridItemView();
}

class GridPresenter implements GridItemContract {
  GridRecoredRepositry _repository;
  GridViewContract view;
  BuildContext context;

  bool clickExpand = false;
  List<GridCols> newDataSource = [];
  bool isCardDeleted = false;

  bool isSortScreen;
  List<GridCols> dataSource;
  bool areGridCaptionsLoaded;
  final UDAsWithValues gridUDA;
  final GridRowData gridRowData;
  final Function onEditRefresh;
  final Function ondelete;
  final int gridRowIndex;
  final int objectRecId;
  final FormModes formMode;
  final GridVisibility gridValidation;
  final GenericObject genericObject;

  GridPresenter({
    this.view,
    this.context,
    this.gridUDA,
    this.gridRowData,
    this.onEditRefresh,
    this.ondelete,
    this.gridRowIndex,
    this.objectRecId,
    this.formMode,
    this.gridValidation,
    this.genericObject,
    this.dataSource,
    this.isSortScreen,
    this.areGridCaptionsLoaded,
  }) {
    _repository = new Injector().deleteGridRepository;
    // dataSource = [];
    isSortScreen = false;
    areGridCaptionsLoaded = false;
  }

  showElements() {
    clickExpand = !clickExpand;
    view.updateGridItemView();
  }

  deleteItem() {
    if (formMode == FormModes.editMode ||
        formMode == FormModes.dictionaryModule) {
      log(
          LogType.DEBUG,
          "print delete data API" +
              gridUDA.udaName +
              gridRowData.recid.toString());
      return DualActionAlert(
        context: context,
        message: 'Do you want to remove the item?',
        leftButtonTitle: 'No',
        rightButtonTitle: 'Yes',
        rightButtonAction: () {
          log(LogType.DEBUG, 'inside grid deleteItem method');
          Navigator.pop(context);
          deleteGridRecord(context, gridUDA.udaTableName, gridRowData.recid);
          view.updateGridItemView();
        },
      ).showAlert();
    } else {
      log(
          LogType.DEBUG,
          "Print delete data local" +
              gridUDA.udaName +
              gridRowData.recid.toString());
      return DualActionAlert(
        context: context,
        message: 'Do you want to remove the item?',
        leftButtonTitle: 'No',
        rightButtonTitle: 'Yes',
        rightButtonAction: () {
          log(LogType.DEBUG, 'inside grid deleteItem method');
          Navigator.pop(context);
          ondelete(gridRowIndex);
          view.updateGridItemView();
        },
      ).showAlert();
    }
  }

  Widget getEditIconWidget(double iconSize, String iconImageName) {
    return (gridValidation != GridVisibility.readOnly)
        ? IconButton(
            icon: Icon(Icons.phone_iphone),
            onPressed: (gridValidation != GridVisibility.addOnly &&
                    gridUDA.isReadOnly != true)
                ? () {
                    onEditRowClicked();
                  }
                : null,
          )
        : Container(height: 40);
  }

  onEditRowClicked() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => AddGridScreen(
                  gridUDA: gridUDA,
                  rowListItems: dataSource,
                  gridRecID: gridRowData.recid,
                  mode: AddGridMode.editMode,
                  editRowIndex: gridRowIndex,
                  objectRecId: objectRecId,
                  formMode: formMode,
                  genericObject: genericObject,
                ))).then((value) {
      if (value != null) {
        onEditRefresh(value);
        view.updateGridItemView();
      }
    });
  }

  Widget temp2EditIconWidget(double iconSize, String iconImageName) {
    return (gridValidation != GridVisibility.readOnly)
        ? GestureDetector(
            child: Icon(Icons.phone_iphone),
            onTap: (gridValidation != GridVisibility.addOnly &&
                    gridUDA.isReadOnly != true)
                ? () {
                    temp2EditRowClicked();
                  }
                : null,
          )
        : Container(height: 40);
  }

  temp2EditRowClicked() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => AddGridScreen(
                  gridUDA: gridUDA,
                  rowListItems: dataSource,
                  gridRecID: gridRowData.recid,
                  mode: AddGridMode.editMode,
                  editRowIndex: gridRowIndex,
                  objectRecId: objectRecId,
                  formMode: formMode,
                  genericObject: genericObject,
                ))).then((value) {
      if (value != null) {
        onEditRefresh(value);
        view.updateGridItemView();
      }
    });
  }

  Widget getDeleteIconWidget(String iconImageName, {double iconSize}) {
    return (gridValidation != GridVisibility.readOnly &&
            gridUDA.isReadOnly != true)
        ? _iconButton(
            iconImageName,
            (gridValidation != GridVisibility.addOnly &&
                    gridValidation != GridVisibility.editOnly)
                ? () {
                    deleteItem();
                    view.updateGridItemView();
                  }
                : null,
            iconSize)
        : Container(
            height: 22,
          );
  }

  _iconButton(String image, Function onTap, double iconSize) {
    return GestureDetector(
      child: Icon(Icons.phone_iphone),
      onTap: onTap,
    );
  }

  isValidImageRow(GridCols value) {
    return value.type == 10 && value.value != null;
  }

  String columnHeaderText(GridCols value) {
    return '${getTextOrEmptyString(value.headerName)} :';
  }

  String columnValueText(GridCols value) {
    return '  ' +
        '${getTextOrEmptyString((value.type == 6) ? value.udaFormValueString : value.value)}';
  }

  String getTextOrEmptyString(value) {
    return (value != null) ? value.toString() : '';
  }

  void deleteGridRecord(context, String udaNme, int recordId) {
    _repository
        .deleteRecored(context, udaNme, recordId)
        .then((c) => this.onDeleteGridRecordSuccess())
        .catchError((onError) => this.onDeleteGridRecordError(onError));
  }

  @override
  void onDeleteGridRecordError(ErrorResponse err) {
    if (err.code == CODE_EXPIRED_TOKEN)
      ShowExpiredTokenAlert(err.message, context);
    else
      ShowAlertMessage(err.message, context);
  }

  @override
  void onDeleteGridRecordSuccess() {
    ondelete(gridRowIndex);
    log(LogType.DEBUG, 'You have deleted this item');
  }
}
