import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Attachment/attach_RowData.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridCols.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/ValueList/RepositoryUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/DynamicValueListPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/Grid/EditGridUDAPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/TextUDAsPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/AttachmentUDA/AttachmentUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/BasicTextInputUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/CheckBoxUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/DateUDA/BasicDateUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/DateUDA/BasicTimeUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/DateUDA/DateTimeUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/ImageBasedUDAs/DigitalSignatureUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/FormUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/ImageBasedUDAs/ImageUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/NumericUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/QRScannerUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/ReadOnlyTextUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/ValueListUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUtils.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

Widget getNumericColumnWidget(
    GridCols column,
    onTextColumnValueChange(
        GridCols column, String value, List<GridCols> columns),
    List<GridCols> columns) {
  return column.qrCode == true
      ? QRScannerUDA(
          title: column.headerName,
          inputType: InputType.number,
          inputHint: column.headerName,
          inputValue: column.value != null ? column.value.toString() : '',
          onValueChange: ((value) {
            onTextColumnValueChange(column, value, columns);
          }),
          isReadOnly: isColumnReadOnly(column),
          isMandatory: isColumnMandatory(column),
          isVisible: (column.hidden != null) ? !column.hidden : true,
        )
      : NumericUDA(
          title: column.headerName,
          inputHint: column.headerName,
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

Widget getTextFieldColumnWidget(
    GridCols column,
    onTextColumnValueChange(
        GridCols column, String value, List<GridCols> columns),
    List<GridCols> columns) {
  return column.qrCode == true
      ? QRScannerUDA(
          title: column.headerName,
          inputHint: column.headerName,
          inputValue: column.value ?? '',
          onValueChange: ((value) {
            onTextColumnValueChange(column, value, columns);
          }),
          isReadOnly: isColumnReadOnly(column),
          isMandatory: isColumnMandatory(column),
          isVisible: (column.hidden != null) ? !column.hidden : true,
        )
      : BasicTextInputUDA(
          title: column.headerName,
          inputHint: column.headerName,
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

ValueListUDA getValueListColumnWidget(
    GridCols column,
    onValueListColumnValueChange(GridCols column, String value),
    List<GridCols> valueListColumnsList) {
  return ValueListUDA(
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

BasicDateUDA getDateColumnWidget(
    GridCols column,
    onDateColumnValueChange(
        GridCols column, String value, List<GridCols> columns),
    List<GridCols> columns) {
  return BasicDateUDA(
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

BasicTimeUDA getTimeColumnWidget(
    GridCols column,
    onTimeColumnValueChange(
        GridCols column, String value, List<GridCols> columns),
    List<GridCols> columns) {
  return BasicTimeUDA(
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

DateTimeUDA getDateTimeColumnWidget(
    GridCols column,
    onDateTimeValueChange(
        GridCols column, String value, List<GridCols> columns),
    List<GridCols> columns) {
  return DateTimeUDA(
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

ReadOnlyTextUDA getCalculatedColumnWidget(
    GridCols column, List<GridCols> columns) {
  determineQueryOfCalculatedFieldColumn(column, columns);
  return ReadOnlyTextUDA(
    title: column.headerName,
    inputHint: column.headerName,
    inputValue: column.value.toString() ?? '',
    isMandatory: isColumnMandatory(column),
//    isVisible: false,
    isVisible: (column.hidden != null) ? !column.hidden : true,
  );
}

ReadOnlyTextUDA getAutoIDColumnWidget(
    GridCols column, setUDAId(GridCols column), AddGridMode gridMode) {
  column.recId = -1;
//  if (column.value != null) {
//    column.value = uda.defaultValue;
//  }
  if (gridMode == AddGridMode.newMode) {
    column.value = null;
  }
//  setUDAId(column);
  return ReadOnlyTextUDA(
    inputValue: column.value ?? '',
    inputHint: column.headerName,
    isMandatory: isColumnMandatory(column),
    isVisible: (column.hidden != null) ? !column.hidden : true,
    title: column.headerName,
  );
}

Widget getAttachmentColumnWidget(
    GridCols column,
    AddGridMode gridMode,
    onAttachmentListChange(GridCols column, List<AttachData> attachmentList),
    int objectRecId) {
  List<AttachData> attachment = [];
  if (!isEmptyText(column.value)) {
    attachment.add(AttachData(attachmentName: column.value));
  }
  return Container();
//  return AttachmentUDA(
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
//  );
}

CheckBoxUDA getCheckBoxColumnWidget(
    GridCols column, onCheckBoxColumnValueChange(GridCols column, bool value)) {
  return CheckBoxUDA(
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

FormUDA getFormColumnWidget(
  GridCols column,
  String gridUDAName,
  GenericObject genericObject,
  AddGridMode addGridMode,
  List<GridCols> columns,
  setMappedColumns(List<GridCols> gridColumns),
  onFormColumnValueChange(
      GridCols column, String value, List<GridCols> columns),
) {
  return FormUDA(
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

Widget getImageColumnWidget(
    GridCols column,
    onImageColumnValueChange(
        GridCols column, String value, List<GridCols> columns),
    List<GridCols> columns) {
  return (column.eSignature == true)
      ? DigitalSignatureUDA(
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
      : ImageUDA(
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

//----------Normal validation helping methods----------
bool isColumnReadOnly(GridCols column) {
  column.isReadOnly = (column.columnVisibility == 2 ? true : false) ||
          (column.isReadOnly != null ? column.isReadOnly : false)
      ? true
      : false;
  return column.isReadOnly;
}

bool isColumnMandatory(GridCols column) {
  column.isMandatory = (column.columnVisibility == 3 ? true : false) ||
      (column.isMandatory != null ? column.isMandatory : false);
  return column.isMandatory;
}

//----------Value List helping methods----------
//Check value list type
ValueListType getValueListType(GridCols column) {
  return (column.repositoryUDAMV?.bindDataId != null &&
          column.repositoryUDAMV?.queryId != null &&
          column.repositoryUDAMV?.sourceOperationDataId != null)
      ? ValueListType.dynamicValList
      : (column.dictionaryId != null)
          ? ValueListType.dictionaryValList
          : ValueListType.staticValList;
}

//Get query info object for dynamic value list
QueryInfo getQueryInfo(GridCols column) {
  return getValueListType(column) == ValueListType.dynamicValList
      ? QueryInfo(
          bindDataId: column.repositoryUDAMV.bindDataId,
          queryId: column.repositoryUDAMV.queryId,
          sourceOperationDataId: column.repositoryUDAMV.sourceOperationDataId)
      : null;
}

//Sort static value list values & validate nonnull values
List<String> validateAndGetStaticValues(GridCols column) {
  if (getValueListType(column) == ValueListType.staticValList &&
      column.repositoryUDAMV?.multiValues != null) {
    column.repositoryUDAMV.multiValues
        .sort((a, b) => a.recId.compareTo(b.recId));
    column.valueListValues = column.repositoryUDAMV.multiValues;
  }
  return (column.repositoryUDAMV == null ||
          column.repositoryUDAMV.multiValues == null)
      ? //Repository is not set from admin or values doesn't exist
      []
      : column.repositoryUDAMV.multiValues
          .map((listValue) => listValue.name)
          .toList();
}

determineQueryOfCalculatedFieldColumn(GridCols column, List<GridCols> columns) {
  List columnsValues = [];
  List columnsNames = [];
  String calculatedUdaQuery;
  var splittedByOp;
  var calculatedUdaEquation;
  if (column.calculatedField != null) {
    calculatedUdaQuery = column.calculatedField
        .replaceAll("\"", "")
        .replaceAll("\"", "")
        .replaceAll('{{udaGrid.', '{')
        .replaceAll('}}', '}');
    splittedByOp = calculatedUdaQuery.split(new RegExp(r'[+-/*]'));
    columnsNames.clear();
    for (int i = 0; i < splittedByOp.length; i++) {
      if (splittedByOp[i].startsWith('{')) {
        columnsNames.add(splittedByOp[i]);
      }
    }
    if (calculatedUdaQuery != null) {
      for (int i = 0; i < columnsNames.length; i++) {
        for (int j = 0; j < columns.length; j++) {
          if (columnsNames[i].replaceAll(new RegExp(r'[{}]'), '') ==
              columns[j].name) {
            columns[j].value =
                (columns[j].value == null || columns[j].value == '')
                    ? '0'
                    : columns[j].value;
            columnsValues.add(columns[j].value);
          }
        }
        calculatedUdaEquation = calculatedUdaQuery.replaceAll(
            '${columnsNames[i]}',
            (columnsValues[i] == null || columns[i].value == '')
                ? '0'
                : columnsValues[i].toString());
        calculatedUdaQuery = calculatedUdaEquation;
      }
    }
    if (calculatedUdaEquation != null) {
      var p = Parser();
      var exp = p.parse(calculatedUdaEquation);
      ContextModel cm = ContextModel();
      var eval = exp.evaluate(EvaluationType.REAL, cm);
      column.value = eval.toString();
    }
  }
}

bool isContainCalculatedFiled(List<GridCols> gridColumnsValues) {
  bool hasCalculatedField = false;
  gridColumnsValues.forEach((element) {
    if (element.type == 7) hasCalculatedField = true;
  });
  return hasCalculatedField;
}
