import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Attachment/attach_RowData.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/Grid/EditGridUDAPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridCols.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/GridUDA/GridUtils.dart';
import 'package:flutter/material.dart';

class Temp1EditGridUDAPresenter extends EditGridUDAPrsenter {
  final BuildContext context;
  final EditGridUDAViewInterface view;

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

  Temp1EditGridUDAPresenter({
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
  });

  @override
  Widget getColumnWithTypeWidget(GridCols column) {
    switch (column.type) {
      case 1:
        return getNumericColumnWidget(
            column, onTextColumnValueChange, gridColumnsValues);
        break;
      case 2:
        return getTextFieldColumnWidget(
            column, onTextColumnValueChange, gridColumnsValues);
        break;
      case 3:
        return getValueListColumnWidget(
            column, onValueListValueChange, valueListColumns);
        break;
      case 4:
        return getDateColumnWidget(
            column, onTextColumnValueChange, gridColumnsValues);
        break;
      case 5:
        return getTimeColumnWidget(
            column, onTextColumnValueChange, gridColumnsValues);
        break;
      case 6:
        return getFormColumnWidget(column, gridUDA.udaName, genericObject, mode,
            gridColumnsValues, setMappedColumns, onTextColumnValueChange);
        break;
      case 7:
        return getCalculatedColumnWidget(column, gridColumnsValues);
        break;
      case 8:
        return getDateTimeColumnWidget(
            column, onTextColumnValueChange, gridColumnsValues);
        break;
      case 9:
        return getAttachmentColumnWidget(
            column, mode, onAttachmentListChange, objectRecId);
        break;
      case 10:
        return getImageColumnWidget(
            column, onTextColumnValueChange, gridColumnsValues);
        break;
      case 14:
        return getCheckBoxColumnWidget(column, onCheckboxValueChange);
        break;
      case 19:
        return getAutoIDColumnWidget(column, setAutoIdUdaId, mode);
        break;
      default:
        return Container();
    }
  }
}
