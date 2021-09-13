import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MultipleLevel/MultipleLevelRowData.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MultipleLevel/getMultiLevelResponse.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/ErrorResponse/error_data.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/MultiLevelUDA/AddEditMultiLevelPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/MultiLevelUDA/AddMultiLevelScreen.dart';
import 'package:templets/Utilities/const.dart';
import 'package:templets/Utilities/WidgetsUtilites/Alerts/dual_action_alert.dart';
import 'package:templets/dependency_injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class MultiLevelViewContract {
  void updateItemView();
  // void onDeleteMultiLevelRecordSuccess();
  // void onDeleteMultiLevelRecordError(ErrorResponse err);
}

abstract class MultiLevelContract {
  void onDeleteMultiLevelRecordSuccess();
  void onDeleteMultiLevelRecordError(ErrorResponse err);
}

class MultiLevelDeletePresenter implements MultiLevelContract {
  DeleteMultiLevelRepository _deleteMultiLevelRepository;
  MultiLevelViewContract view;
  final BuildContext context;

  bool isCardDeleted = false;

  final dataSource;
  final bool isSortScreen;
  final UDAsWithValues multiLevelUDA;
  final MultipleLevelRowData multiLevelRowData;
  final int multiLevelRowIndex;
  final int objectRecId;
  final Function onEditRefresh;
  final Function ondelete;
  final FormModes formMode;
  final bool fullList;
  final int repositoryID;
  final bool isReadOnly;
  final bool isMandatory;

  MultiLevelDeletePresenter({
    this.view,
    this.context,
    this.dataSource,
    this.isSortScreen,
    this.multiLevelUDA,
    this.multiLevelRowData,
    this.multiLevelRowIndex,
    this.objectRecId,
    this.onEditRefresh,
    this.ondelete,
    this.formMode,
    this.fullList,
    this.repositoryID,
    this.isReadOnly,
    this.isMandatory,
  }) {
    _deleteMultiLevelRepository = new Injector().deleteMultiLvelRepository;
  }

  deleteItem() {
    if (formMode == FormModes.editMode) {
      log(
          LogType.ERROR,
          "print deletee dataa Api" +
              multiLevelUDA.udaName +
              multiLevelRowData.recID.toString());
      return DualActionAlert(
        context: context,
        message: 'Do you want to remove the item?',
        leftButtonTitle: 'No',
        rightButtonTitle: 'Yes',
        rightButtonAction: () {
          log(LogType.ERROR, 'inside deleteItem method ');
          Navigator.pop(context);
          // pass your number to delete
          deleteGridRecord(
              context, multiLevelUDA.udaTableName, multiLevelRowData.recID);
          //setState
        },
      ).showAlert();
    } else {
      // gridRowData.removeAt(index);
      log(
          LogType.ERROR,
          "print deletee dataa local" +
              multiLevelUDA.udaName +
              multiLevelRowData.recID.toString());
      return DualActionAlert(
        context: context,
        message: 'Do you want to remove the item?',
        leftButtonTitle: 'No',
        rightButtonTitle: 'Yes',
        rightButtonAction: () {
          log(LogType.ERROR, 'inside deleteItem method ');
          Navigator.pop(context);
          // pass your number to delete
          ondelete(multiLevelRowIndex);
          //setState
          //  alertDeletedSuccessfully.showAlert();
        },
      ).showAlert();
    }
  }

  onEditIconTapped() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => AddMultiLevelScreen(
                  multiLevelUDA: multiLevelUDA,
                  rowListItems: dataSource,
                  multiLevelRecID: multiLevelRowData.recID,
                  mode: AddMultiLevelMode.editMode,
                  editRowIndex: multiLevelRowIndex,
                  objectRecId: objectRecId,
                  formMode: formMode,
                  repositoryID: repositoryID,
                ))).then((value) {
      if (value != null) {
        onEditRefresh(value);
      }
    });
  }

  String getTextOrEmptyString(value) {
    return (value != null) ? value.toString() : '';
  }

  void deleteGridRecord(context, String udaNme, int recordId) {
    _deleteMultiLevelRepository
        .deleteMultiLevel(context, udaNme, recordId)
        .then((c) => this.onDeleteMultiLevelRecordSuccess())
        .catchError((onError) => this.onDeleteMultiLevelRecordError(onError));
  }

  @override
  void onDeleteMultiLevelRecordError(ErrorResponse err) {
    // TODO: implement onDeleteMultiLevelRecordError
  }

  @override
  void onDeleteMultiLevelRecordSuccess() {
    ondelete(multiLevelRowIndex);
  }
}
