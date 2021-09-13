import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridCols.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/Grid/EditGridUDAPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2GridUDA/Temp2GridUtils.dart';

class Temp2EditGridUDAPresenter extends EditGridUDAPrsenter {
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

  Temp2EditGridUDAPresenter({
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
        return temp2GetNumericColumnWidget(
            column, onTextColumnValueChange, gridColumnsValues);
        break;
      case 2:
        return temp2GetTextFieldColumnWidget(
            column, onTextColumnValueChange, gridColumnsValues);
        break;
      case 3:
        return temp2GetValueListColumnWidget(
            column, onValueListValueChange, valueListColumns);
        break;
      case 4:
        return temp2GetDateColumnWidget(
            column, onTextColumnValueChange, gridColumnsValues);
        break;
      case 5:
        return temp2GetTimeColumnWidget(
            column, onTextColumnValueChange, gridColumnsValues);
        break;
      case 6:
        return temp2GetFormColumnWidget(column, gridUDA.udaName, genericObject,
            mode, gridColumnsValues, setMappedColumns, onTextColumnValueChange);
        break;
      case 7:
        return temp2GetCalculatedColumnWidget(column, gridColumnsValues);
        break;
      case 8:
        return temp2GetDateTimeColumnWidget(
            column, onTextColumnValueChange, gridColumnsValues);
        break;
      case 9:
        return temp2GetAttachmentColumnWidget(
            column, mode, onAttachmentListChange, objectRecId);
        break;
      case 10:
        return temp2GetImageColumnWidget(
            column, onTextColumnValueChange, gridColumnsValues);
        break;
      case 14:
        return temp2GetCheckBoxColumnWidget(column, onCheckboxValueChange);
        break;
      case 19:
        return temp2GetAutoIDColumnWidget(column, setAutoIdUdaId, mode);
        break;
      default:
        return Container();
    }
  }
}
