import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Attachment/attach_RowData.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridCols.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/FormUDAPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/Grid/EditGridUDAPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/TextUDAsPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/AttachmentUDA/AttachmentUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/GridUDA/GridUtils.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2BasicTextInputUDA.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2CheckBoxUDA.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2DateUDA/Temp2BasicDateUDA.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2DateUDA/Temp2BasicTimeUDA.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2DateUDA/Temp2DateTimeUDA.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2FormUDA.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2ImageBasedUDAs/Temp2DigitalSignatureUDA.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2ImageBasedUDAs/Temp2ImageUDA.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2NumericUDA.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2QRScannerUDA.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2ReadOnlyTextUDA.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2ValueList.dart';

Widget temp2GetNumericColumnWidget(
    GridCols column,
    onTextColumnValueChange(
        GridCols column, String value, List<GridCols> columns),
    List<GridCols> columns) {
  return column.qrCode == true
      ? Temp2QRScannerUDA(
          title: column.headerName,
          // inputHint: column.headerName,
          inputType: InputType.number,
          inputValue: column.value != null ? column.value.toString() : '',
          onValueChange: ((value) {
            onTextColumnValueChange(column, value, columns);
          }),
          isReadOnly: isColumnReadOnly(column),
          isMandatory: isColumnMandatory(column),
          isVisible: (column.hidden != null) ? !column.hidden : true,
        )
      : Temp2NumericUDA(
          title: column.headerName,
          // inputHint: column.headerName,
          inputValue: column.value != null ? column.value.toString() : '',
          textController: column.columnTextController,
          onValueChange: ((value) {
            onTextColumnValueChange(column, value, columns);
          }),
          isReadOnly: isColumnReadOnly(column),
          isMandatory: isColumnMandatory(column),
          isVisible: (column.hidden != null) ? !column.hidden : true,
        );
}

Widget temp2GetTextFieldColumnWidget(
    GridCols column,
    onTextColumnValueChange(
        GridCols column, String value, List<GridCols> columns),
    List<GridCols> columns) {
  return column.qrCode == true
      ? Temp2QRScannerUDA(
          title: column.headerName,
          // inputHint: column.headerName,
          inputValue: column.value ?? '',
          onValueChange: ((value) {
            onTextColumnValueChange(column, value, columns);
          }),
          isReadOnly: isColumnReadOnly(column),
          isMandatory: isColumnMandatory(column),
          isVisible: (column.hidden != null) ? !column.hidden : true,
        )
      : Temp2BasicTextInputUDA(
          title: column.headerName,
          // inputHint: column.headerName,
          inputValue: column.value ?? '',
          textController: column.columnTextController,
          onValueChange: ((value) {
            onTextColumnValueChange(column, value, columns);
          }),
          isReadOnly: isColumnReadOnly(column),
          isMandatory: isColumnMandatory(column),
          isVisible: (column.hidden != null) ? !column.hidden : true,
        );
}

Temp2ValueListUDA temp2GetValueListColumnWidget(
    GridCols column,
    onValueListColumnValueChange(GridCols column, String value),
    List<GridCols> valueListColumnsList) {
  return Temp2ValueListUDA(
    valListType: getValueListType(column),
    initialValue: column.value ?? '',
    controller: column.columnTextController,
    title: column.headerName,
    staticValues: validateAndGetStaticValues(column),
    queryInfo: getQueryInfo(column),
    onValueChange: ((value) {
      onValueListColumnValueChange(column, value);
    }),
    uda: column,
    isReadOnly: isColumnReadOnly(column),
    isMandatory: isColumnMandatory(column),
    isVisible: (column.hidden != null) ? !column.hidden : true,
  );
}

Temp2BasicDateUDA temp2GetDateColumnWidget(
    GridCols column,
    onDateColumnValueChange(
        GridCols column, String value, List<GridCols> columns),
    List<GridCols> columns) {
  return Temp2BasicDateUDA(
    name: column.headerName,
    initialValue: column.value ?? '',
    onValueChange: ((value) {
      onDateColumnValueChange(column, value, columns);
    }),
    isReadOnly: isColumnReadOnly(column),
    isMandatory: isColumnMandatory(column),
    isVisible: (column.hidden != null) ? !column.hidden : true,
  );
}

Temp2BasicTimeUDA temp2GetTimeColumnWidget(
    GridCols column,
    onTimeColumnValueChange(
        GridCols column, String value, List<GridCols> columns),
    List<GridCols> columns) {
  return Temp2BasicTimeUDA(
    name: column.headerName,
    initialValue: column.value ?? '',
    onValueChange: ((value) {
      onTimeColumnValueChange(column, value, columns);
    }),
    isReadOnly: isColumnReadOnly(column),
    isMandatory: isColumnMandatory(column),
    isVisible: (column.hidden != null) ? !column.hidden : true,
  );
}

Temp2DateTimeUDA temp2GetDateTimeColumnWidget(
    GridCols column,
    onDateTimeValueChange(
        GridCols column, String value, List<GridCols> columns),
    List<GridCols> columns) {
  return Temp2DateTimeUDA(
    name: column.headerName,
    initialValue: column.value ?? '',
    onValueChange: ((value) {
      onDateTimeValueChange(column, value.replaceAll(".000", ""), columns);
    }),
    isReadOnly: isColumnReadOnly(column),
    isMandatory: isColumnMandatory(column),
    isVisible: (column.hidden != null) ? !column.hidden : true,
  );
}

Temp2ReadOnlyTextUDA temp2GetCalculatedColumnWidget(
    GridCols column, List<GridCols> columns) {
  determineQueryOfCalculatedFieldColumn(column, columns);
  return Temp2ReadOnlyTextUDA(
    title: column.headerName,
    // inputHint: column.headerName,
    inputValue: column.value.toString() ?? '',
    isMandatory: isColumnMandatory(column),
    isVisible: (column.hidden != null) ? !column.hidden : true,
  );
}

Temp2ReadOnlyTextUDA temp2GetAutoIDColumnWidget(
    GridCols column, setUDAId(GridCols column), AddGridMode gridMode) {
  column.recId = -1;
//  if (column.value != null) {
//    column.value = uda.defaultValue;
//  }
  if (gridMode == AddGridMode.newMode) {
    column.value = null;
  }
//  setUDAId(column);
  return Temp2ReadOnlyTextUDA(
    inputValue: column.value ?? '',
    // inputHint: column.headerName,
    isMandatory: isColumnMandatory(column),
    isVisible: (column.hidden != null) ? !column.hidden : true,
    title: column.headerName,
  );
}

Widget temp2GetAttachmentColumnWidget(
    GridCols column,
    AddGridMode gridMode,
    onAttachmentListChange(GridCols column, List<AttachData> attachmentList),
    int objectRecId) {
  List<AttachData> attachment = [];
  if (!isEmptyText(column.value)) {
    attachment.add(AttachData(attachmentName: column.value));
  }
  return Container();
  // AttachmentUDA(
//    attachmentId: column.recId.toString(),
//    attachmentName: column.name,
//    attachmentTitle: column.headerName,
//    attachmentMode: AttachmentMode.GridMode,
//    objectID: (gridMode == AddGridMode.newMode) ? -1 : objectRecId,
//    mode:
//        (gridMode == AddGridMode.newMode) ? FormType.create : FormType.monitor,
//    parsedAttachmentList: attachment,
//    onAttachmentListChange: (attachmentList, files) {
//      onAttachmentListChange(column, attachmentList);
//      column.value = attachmentList[0].attachmentName;
//    },
//    isReadOnly: isColumnReadOnly(column),
//    isVisible: (column.hidden != null) ? !column.hidden : true,
//    isMandatory: isColumnMandatory(column),
  // );
}

Temp2CheckBoxUDA temp2GetCheckBoxColumnWidget(
    GridCols column, onCheckBoxColumnValueChange(GridCols column, bool value)) {
  return Temp2CheckBoxUDA(
    value: (column.value == 1) ? true : false,
    title: column.headerName,
    onValueChange: ((value) {
      onCheckBoxColumnValueChange(column, value);
    }),
    isReadOnly: isColumnReadOnly(column),
    isMandatory: isColumnMandatory(column),
    isVisible: (column.hidden != null) ? !column.hidden : true,
  );
}

Temp2FormUDA temp2GetFormColumnWidget(
  GridCols column,
  String gridUDAName,
  GenericObject genericObject,
  AddGridMode addGridMode,
  List<GridCols> columns,
  setMappedColumns(List<GridCols> gridColumns),
  onFormColumnValueChange(
      GridCols column, String value, List<GridCols> columns),
) {
  return Temp2FormUDA(
    genericObject: genericObject,
    uda: column,
    fomMode: (addGridMode == AddGridMode.newMode)
        ? FormModes.newMode
        : FormModes.editMode,
    title: column.headerName,
    initialValue: column.value,
    formListMappingDTOList: column.formListMappingDTOList,
    formListUdaId: column.recId,
    formTypeId: column.formTypeId,
    gridID: column.formGridId,
    gridUDAName: gridUDAName,
    columns: columns,
    selectedFieldsNames: column.formUdaSelectedFields,
    udaOptions: getFormUDAOptions(column.formUdaOptions),
    onValueChange: ((value) {
      onFormColumnValueChange(column, value, columns);
    }),
    setGridMappedColumns: ((columns) {
      setMappedColumns(columns);
    }),
    isVisible: (column.hidden != null) ? !column.hidden : true,
    isReadOnly: isColumnReadOnly(column),
    isMandatory: isColumnMandatory(column),
  );
}

Widget temp2GetImageColumnWidget(
    GridCols column,
    onImageColumnValueChange(
        GridCols column, String value, List<GridCols> columns),
    List<GridCols> columns) {
  return (column.eSignature == true)
      ? Temp2DigitalSignatureUDA(
          title: column.headerName,
          onImagePick: (image) {
            onImageColumnValueChange(column, image, columns);
          },
          imageValue:
              column.value != null ? convertStringtoImage(column.value) : null,
          isReadOnly: isColumnReadOnly(column),
          isMandatory: isColumnMandatory(column),
          isVisible: (column.hidden != null) ? !column.hidden : true,
        )
      : Temp2ImageUDA(
          title: column.headerName,
          onImagePick: (image) {
            onImageColumnValueChange(column, image, columns);
          },
          imageValue:
              column.value != null ? convertStringtoImage(column.value) : null,
          isReadOnly: isColumnReadOnly(column),
          isMandatory: isColumnMandatory(column),
          isVisible: (column.hidden != null) ? !column.hidden : true,
        );
}

List<FormUDAOptions> getFormUDAOptions(String formUDAOptionsText) {
  List<FormUDAOptions> formUDAsOptionsList = [];
  List<String> formUDAOptionsTextList = formUDAOptionsText?.split(",");
  formUDAOptionsTextList?.forEach((formOption) {
    switch (formOption) {
      case "1":
        formUDAsOptionsList.add(FormUDAOptions.view);
        break;
      case "2":
        formUDAsOptionsList.add(FormUDAOptions.search);
        break;
      case "3":
        formUDAsOptionsList.add(FormUDAOptions.modify);
        break;
      case "4":
        formUDAsOptionsList.add(FormUDAOptions.create);
        break;
      default:
    }
  });
  return formUDAsOptionsList;
}
