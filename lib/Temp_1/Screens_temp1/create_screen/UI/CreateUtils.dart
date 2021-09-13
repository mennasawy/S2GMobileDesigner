import 'dart:io';
//import 'package:location/location.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/AssignmentInfoUDAModel/SaveAssignmentInfoModel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Attachment/attach_RowData.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridCols.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridRow.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MultipleLevel/MultipleLevelRowData.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/ValueList/RepositoryUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/SubPanelUda.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/map.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/DynamicValueListPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/FormUDAPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/Grid/AllRowsScreenPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/TextUDAsPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/AssignmentInfoUDA/AssignmentInfoWidget.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/ImageBasedUDAs/DigitalSignatureUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/LastUpdatedInfoUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/ReportUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/RichTextUDA/RichTextUDA.dart';
import 'package:templets/Utilities/const.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/AttachmentUDA/AttachmentUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/BasicTextInputUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/CheckBoxUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/DateUDA/DateUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/FormUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/GridUDA/gridTable.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/HelpUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/ImageBasedUDAs/ImageUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/InvokerUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/MapWebViewUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/MemoUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/MultiLevelUDA/multilevelTable.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/Note/NoteUDAA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/NumericUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/QRScannerUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/ReadOnlyTextUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/SubPanel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/ValueListUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/createFunctions.dart';
import 'package:flutter/material.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:location/location.dart';

enum FormType { create, monitor }

// TextEditingController textController = TextEditingController();
//----------UDAs Rendering Methods----------
Widget getNumericUDAWidget(
    List<UDAsWithValues> udas,
    UDAsWithValues uda,
    FormModes mode,
    onTextUDAsValueChange(UDAsWithValues uda, String value,
        TextEditingController textController)) {
  if (!isNumeric(uda.udaValue)) uda.udaTextController.text = "";
  return uda.qrCode == true
      ? QRScannerUDA(
          key: ValueKey(uda.recId),
          title: uda.udaCaption,
          labelColor: uda.labelColor,
          inputType: getParsedInputType(uda.udaType),
          inputValue:
              uda.udaValue != null && uda.udaValue != "0" ? uda.udaValue : '',
          udaDescription: uda.udaDescription,
          validationMessage: getValidationMessage(uda),
          isValidationMSGWarning: uda.isValidationCondMsgWarn,
          onValueChange: ((value) {
            onTextUDAsValueChange(uda, value, uda.udaTextController);
          }),
          isVisible: isUDAVisible(uda),
          isReadOnly: isUDAReadOnly(uda),
          isMandatory: isUDAMandatory(uda),
        )
      : NumericUDA(
          key: ValueKey(uda.recId),
          title: uda.udaCaption,
          labelColor: uda.labelColor,
          inputHint: (isEmptyText(uda.defaultValue))
              ? uda.udaCaption
              : uda.defaultValue,
          udaDescription: uda.udaDescription,
          inputValue: uda.udaValue != null ? uda.udaValue : '',
          // inputValue:
          //     uda.udaValue != null && uda.udaValue != "0" ? uda.udaValue : '',
          validationMessage: getValidationMessage(uda),
          isValidationMSGWarning: uda.isValidationCondMsgWarn,
          onValueChange: ((value) {
            onTextUDAsValueChange(uda, value, uda.udaTextController);
          }),
          isVisible: isUDAVisible(uda),
          isReadOnly: isUDAReadOnly(uda),
          isMandatory: isUDAMandatory(uda),
          isLocation: uda.location,
          textController: uda.udaTextController,
        );
}

Widget getTextfieldUDAWidget(
    List<UDAsWithValues> udas,
    UDAsWithValues uda,
    FormModes mode,
    onTextUDAsValueChange(UDAsWithValues uda, String value,
        TextEditingController textController)) {
  uda.udaValue = uda.udaValue ?? uda.defaultValue ?? '';
  return uda.qrCode == true
      ? QRScannerUDA(
          key: ValueKey(uda.recId),
          labelColor: uda.labelColor,
          title: uda.udaCaption,
          inputType: getParsedInputType(uda.udaType),
          inputValue: uda.udaValue ?? '',
          udaDescription: uda.udaDescription,
          validationMessage: getValidationMessage(uda),
          isValidationMSGWarning: uda.isValidationCondMsgWarn,
          onValueChange: ((value) {
            onTextUDAsValueChange(uda, value, uda.udaTextController);
          }),
          isVisible: isUDAVisible(uda),
          isReadOnly: isUDAReadOnly(uda),
          isMandatory: isUDAMandatory(uda),
        )
      : BasicTextInputUDA(
          labelColor: uda.labelColor,
          key: ValueKey(uda.recId),
          title: uda.udaCaption,
          inputHint: (isEmptyText(uda.defaultValue))
              ? uda.udaCaption
              : uda.defaultValue,
          inputValue: uda.udaValue ?? '',
          udaDescription: uda.udaDescription,
          validationMessage: getValidationMessage(uda),
          isValidationMSGWarning: uda.isValidationCondMsgWarn,
          onValueChange: ((value) {
            onTextUDAsValueChange(uda, value, uda.udaTextController);
          }),
          isVisible: isUDAVisible(uda),
          isReadOnly: isUDAReadOnly(uda),
          isMandatory: isUDAMandatory(uda),
          isLocation: uda.location,
          textController: uda.udaTextController,
        );
}

MemoUDA getMemoUDAWidget(
    List<UDAsWithValues> udas,
    UDAsWithValues uda,
    FormModes mode,
    onTextUDAsValueChange(UDAsWithValues uda, String value,
        TextEditingController textController)) {
  uda.udaValue = uda.udaValue ?? uda.defaultValue ?? '';
  return MemoUDA(
    key: ValueKey(uda.recId),
    labelColor: uda.labelColor,
    title: uda.udaCaption,
    inputValue: uda.udaValue ?? '',
    udaDescription: uda.udaDescription,
    onValueChange: ((value) {
      onTextUDAsValueChange(uda, value, uda.udaTextController);
    }),
    validationMessage: getValidationMessage(uda),
    isValidationMSGWarning: uda.isValidationCondMsgWarn,
    isVisible: isUDAVisible(uda),
    isReadOnly: isUDAReadOnly(uda),
    isMandatory: isUDAMandatory(uda),
    isLocation: uda.location,
    textController: uda.udaTextController,
  );
}

ValueListUDA getValueListUDAWidget(
    List<UDAsWithValues> udas,
    List<UDAsWithValues> valueListUDAsList,
    GenericObject genericObject,
    UDAsWithValues uda,
    FormModes mode,
    onValueListValueChange(UDAsWithValues uda, String value),
    onDependentValueListValueChange(List<UDAsWithValues> valListUDAs),
    onApplyingValueListRule(List<UDAsWithValues> mappedUDAs)) {
  uda.udaValue = uda.udaValue ?? uda.defaultValue ?? '';
  uda.udaTextController.text = uda.udaValue;
  return ValueListUDA(
    key: ValueKey(uda.recId),
    labelColor: uda.labelColor,
    valListType: getValueListType(uda),
    title: uda.udaCaption,
    initialValue: uda.udaValue,
    controller: uda.udaTextController,
    udaDescription: uda.udaDescription,
    validationMessage: getValidationMessage(uda),
    isValidationMSGWarning: uda.isValidationCondMsgWarn,
    staticValues: validateAndGetStaticValues(uda),
    uda: uda,
    queryInfo: getQueryInfo(uda, uda.valueListConditionDBValue),
    onValueChange: ((value) {
      onValueListValueChange(uda, value);
    }),
    onDependentValueChange: ((valListUDAs) {
      onDependentValueListValueChange(valListUDAs);
    }),
    onApplyingValueListRule: ((mappedUDAs) {
      onApplyingValueListRule(mappedUDAs);
    }),
    isVisible: isUDAVisible(uda),
    isReadOnly: isUDAReadOnly(uda),
    isMandatory: isUDAMandatory(uda),
    valueListUDAsList: valueListUDAsList,
    isLocation: uda.location,
    genericObject: genericObject,
  );
}

FormUDA getFormUDAWidget(
    List<UDAsWithValues> udas,
    UDAsWithValues uda,
    FormModes mode,
    GenericObject genericObject,
    onTextUDAsValueChange(UDAsWithValues uda, dynamic value)) {
  return FormUDA(
    labelColor: uda.labelColor,
    uda: uda,
    key: ValueKey(uda.recId),
    genericObject: genericObject,
    fomMode: mode,
    title: uda.udaCaption,
    initialValue: uda.udaValue,
    udaDescription: uda.udaDescription,
    validationMessage: getValidationMessage(uda),
    isValidationMSGWarning: uda.isValidationCondMsgWarn,
    onValueChange: ((value) {
      onTextUDAsValueChange(uda, value);
    }),
    isVisible: isUDAVisible(uda),
    isReadOnly: isUDAReadOnly(uda),
    isMandatory: isUDAMandatory(uda),
    isLocation: uda.location,
    udaOptions: getFormUDAOptions(uda.formUdaOptions),
  );
}

DateUDA getDateUDAWidget(
    List<UDAsWithValues> udas,
    UDAsWithValues uda,
    FormModes mode,
    onTextUDAsValueChange(UDAsWithValues uda, String value,
        TextEditingController textController)) {
  uda.udaValue = uda.udaValue ?? uda.defaultValue ?? '';
  return DateUDA(
    key: ValueKey(uda.recId),
    labelColor: uda.labelColor,
    name: uda.udaCaption,
    initialValue: uda.udaValue,
    udaDescription: uda.udaDescription,
    dateType: getParsedDateType(uda.dateTypes),
    validationMessage: getValidationMessage(uda),
    isValidationMSGWarning: uda.isValidationCondMsgWarn,
    onValueChange: ((value) {
      onTextUDAsValueChange(uda, value, uda.udaTextController);
    }),
    isReadOnly: isUDAReadOnly(uda),
    isVisible: isUDAVisible(uda),
    isMandatory: isUDAMandatory(uda),
    isLocation: uda.location,
  );
}

Widget getRichTextUDAWidget(UDAsWithValues uda, FormModes mode,
    onTextUDAsValueChange(UDAsWithValues uda, String value)) {
  return RichTextUDA(
    key: ValueKey(uda.recId),
    richTextUda: uda,
    template: 1,
    mode: mode,
    isReadOnly: isUDAReadOnly(uda),
    isVisible: isUDAVisible(uda),
    isMandatory: isUDAMandatory(uda),
    onValueChange: ((value) {
      onTextUDAsValueChange(uda, value);
    }),
  );
//  return Container();
}

getNoteUDAWidget(UDAsWithValues uda, FormModes mode,
    onNoteValueChange(UDAsWithValues uda, notesList), int objectRecId) {
  return NoteUDAs(
    key: ValueKey(uda.recId),
    noteUDA: uda,
    formType: (mode == FormModes.newMode || mode == FormModes.freeModuleMode)
        ? FormType.create
        : FormType.monitor,
    objectRecId: (mode == FormModes.newMode || mode == FormModes.freeModuleMode)
        ? 0
        : objectRecId,
    onAddNote: (nOfNotes, notesList) {
      onNoteValueChange(uda, notesList);
      uda.notesList = notesList;
    },
    validationMessage: getValidationMessage(uda),
    isValidationMSGWarning: uda.isValidationCondMsgWarn,
    isVisible: isUDAVisible(uda),
    isReadOnly: isUDAReadOnly(uda),
    isMandatory: isUDAMandatory(uda),
    isLocation: uda.location,
  );
}

Widget getAttachmentUDAWidget(
    UDAsWithValues uda,
    FormModes mode,
    onAttachmentListChange(
        UDAsWithValues uda, List<AttachData> attachmentList, List<File> files),
    int objectRecId) {
  return AttachmentUDA(
    key: ValueKey(uda.recId),
    uda: uda,
    attachmentMode: AttachmentMode.UDAMode,
    objectID: (mode == FormModes.newMode) ? -1 : objectRecId,
    mode: (mode == FormModes.newMode) ? FormType.create : FormType.monitor,
    onAttachmentListChange: (attachmentList, files) {
      onAttachmentListChange(uda, attachmentList, files);
      uda.attachments = attachmentList;
    },
    validationMessage: getValidationMessage(uda),
    isVisible: isUDAVisible(uda),
    isReadOnly: isUDAReadOnly(uda),
    isMandatory: isUDAMandatory(uda),
  );
}

Widget getAssignmentInfoWidget(
    List<UDAsWithValues> udas,
    UDAsWithValues uda,
    FormModes mode,
    onAssignmentValueChange(
        UDAsWithValues uda,
        String companyValue,
        String organizationValue,
        String groupValue,
        String memberValue,
        SaveAssignmentInfoModel memberData)) {
  return AssignmentInfoWidget(
    key: ValueKey(uda.recId),
    assignmentudaTitle: uda.udaCaption,
    initialValue: uda.udaValue ?? '',
    udaDescription: uda.udaDescription,
    validationMessage: getValidationMessage(uda),
    isValidationMSGWarning: uda.isValidationCondMsgWarn,
    labelColor: uda.labelColor,
    uda: uda,
    mode: mode,
    isReadOnly: isUDAReadOnly(uda),
    isMandatory: isUDAMandatory(uda),
    isVisible: isUDAVisible(uda),
    isLocation: uda.location,
    onValueChange: ((String companyValue,
        String organizationValue,
        String groupValue,
        String memberValue,
        SaveAssignmentInfoModel memberData) {
      onAssignmentValueChange(uda, companyValue, organizationValue, groupValue,
          memberValue, memberData);
    }),
  );
}

CheckBoxUDA getCheckboxUDAWidget(List<UDAsWithValues> udas, UDAsWithValues uda,
    FormModes mode, onCheckboxValueChange(UDAsWithValues uda, bool value)) {
  if (uda.udaValue == null) uda.udaValue = 'false';
  return CheckBoxUDA(
    key: ValueKey(uda.recId),
    title: uda.udaCaption,
    value: (uda.udaValue == "true" || uda.udaValue == "1") ? true : false,
    udaDescription: uda.udaDescription,
    onValueChange: ((value) {
      onCheckboxValueChange(uda, value);
    }),
    isVisible: isUDAVisible(uda),
    isReadOnly: isUDAReadOnly(uda),
    isMandatory: isUDAMandatory(uda),
    isLocation: uda.location,
  );
}

ReadOnlyTextUDA getCalculatedFieldUDAWidget(
    List<UDAsWithValues> udas, UDAsWithValues uda) {
  determineQueryOfCalculatedFieldUDA(uda, udas);
  return ReadOnlyTextUDA(
    key: ValueKey(uda.recId),
    inputValue: uda.udaValue ?? '',
    udaDescription: uda.udaDescription,
    validationMessage: getValidationMessage(uda),
    isValidationMSGWarning: uda.isValidationCondMsgWarn,
    inputHint: uda.udaCaption,
    isMandatory: isUDAMandatory(uda),
    isVisible: isUDAVisible(uda),
    title: uda.udaCaption,
    labelColor: uda.labelColor,
    isLocation: uda.location,
  );
}

ReadOnlyTextUDA getAutoIDUDAWidget(
    UDAsWithValues uda, setUDAId(UDAsWithValues uda), FormModes formMode) {
  uda.udaId = -1;
  if (uda.defaultValue != null) {
    uda.udaValue = uda.defaultValue;
  }
  if (formMode == FormModes.cloneMode) {
    uda.udaValue = null;
  }
  setUDAId(uda);
  return ReadOnlyTextUDA(
    key: ValueKey(uda.recId),
    inputValue: uda.udaValue ?? '',
    udaDescription: uda.udaDescription,
    validationMessage: getValidationMessage(uda),
    isValidationMSGWarning: uda.isValidationCondMsgWarn,
    inputHint: uda.udaCaption,
    isMandatory: isUDAMandatory(uda),
    isVisible: isUDAVisible(uda),
    title: uda.udaCaption,
    labelColor: uda.labelColor,
    isLocation: uda.location,
  );
}

HelpUDA getHelpUDAWidget(UDAsWithValues uda) {
  return HelpUDA(
    key: ValueKey(uda.recId),
    title: uda.udaCaption,
    helpID: uda.recId,
    validationMessage: uda.validationMessage,
    isVisible: isUDAVisible(uda),
    labelColor: uda.labelColor,
    isLocation: uda.location,
  );
}

MultiLevelTable getMultipleLevelUDA(
    UDAsWithValues uda,
    int objectRecId,
    FormModes formMode,
    onGridRowsChange(UDAsWithValues uda, List<MultipleLevelRowData> rowsData)) {
  return MultiLevelTable(
    key: ValueKey(uda.recId),
    gridName: uda.udaCaption,
    multiLevelUDA: uda,
    labelColor: uda.labelColor,
    rowListItems: uda.rowData ?? [],
    onAddRows: (rowsData) {
      onGridRowsChange(uda, rowsData);
    },
    objectRecId: objectRecId,
    formMode: formMode,
    validationMessage: getValidationMessage(uda),
    isValidationMSGWarning: uda.isValidationCondMsgWarn,
    repositoryID: (uda.multipleLevelRepository != null)
        ? uda.multipleLevelRepository.recId
        : (isNotEmptyList(uda.rowData))
            ? uda.rowData[0].repositoryID
            : null,
    isVisible: isUDAVisible(uda),
    udaDescription: uda.udaDescription,
    isReadOnly: isUDAReadOnly(uda),
    isMandatory: isUDAMandatory(uda),
    isLocation: uda.location,
  );
}

Widget getImageUDAWidget(
    UDAsWithValues uda,
    onImageUDAValueChange(UDAsWithValues uda, String value,
        TextEditingController textController)) {
  TextEditingController textController = TextEditingController();
  return (uda.eSignature == true)
      ? DigitalSignatureUDA(
          key: ValueKey(uda.recId),
          labelColor: uda.labelColor,
          title: uda.udaCaption,
          udaDescription: uda.udaDescription,
          validationMessage: getValidationMessage(uda),
          isValidationMSGWarning: uda.isValidationCondMsgWarn,
          onImagePick: (image) {
            onImageUDAValueChange(uda, image, textController);
          },
          imageValue:
              uda.udaValue != null ? convertStringtoImage(uda.udaValue) : null,
          isReadOnly: isUDAReadOnly(uda),
          isMandatory: isUDAMandatory(uda),
          isVisible: isUDAVisible(uda),
          isLocation: uda.location,
        )
      : ImageUDA(
          key: ValueKey(uda.recId),
          labelColor: uda.labelColor,
          title: uda.udaCaption,
          udaDescription: uda.udaDescription,
          validationMessage: getValidationMessage(uda),
          isValidationMSGWarning: uda.isValidationCondMsgWarn,
          onImagePick: (image) {
            onImageUDAValueChange(uda, image, textController);
          },
          imageValue:
              uda.udaValue != null ? convertStringtoImage(uda.udaValue) : null,
          isReadOnly: isUDAReadOnly(uda),
          isMandatory: isUDAMandatory(uda),
          isVisible: isUDAVisible(uda),
          isLocation: uda.location,
        );
}

GridTable getGridUDAWidget(
    UDAsWithValues uda,
    onGridRowsChange(UDAsWithValues uda, List<GridRowData> rowsData),
    int objectRecId,
    GenericObject genericObject,
    FormModes formMode) {
  log(LogType.DEBUG, "Grid row data in create utils ===== ${uda.rowData}");
  List<List<GridCols>> gridRowData = [];
  if (uda.rowData != null) {
    uda.rowData.forEach((row) => gridRowData.add(row.columnsList));
  }
  return GridTable(
    key: ValueKey(uda.recId),
    gridName: uda.udaCaption ?? uda.udaName ?? "",
    labelColor: uda.labelColor,
    gridUDA: uda,
    genericObject: genericObject,
    rowListItems: uda.rowData ?? [],
    onAddRows: (rowsData) {
      onGridRowsChange(uda, rowsData);
    },
    objectRecId: objectRecId,
    formMode: formMode,
    validationMessage: getValidationMessage(uda),
    isValidationMSGWarning: uda.isValidationCondMsgWarn,
    gridValidation: getGridValidation(uda),
    isVisible: isUDAVisible(uda),
    isLocation: uda.location,
    udaDescription: uda.udaDescription,
  );
}

// Charts getChartUDAWidget(
//     UDAsWithValues uda, ChartUDAType type, GenericObject genericObject) {
//   return Charts(
//     key: ValueKey(uda.recId),
//     chartUDA: uda,
//     chartType: type,
//     isReadOnly: isUDAReadOnly(uda),
//     isMandatory: isUDAMandatory(uda),
//     isVisible: isUDAVisible(uda),
//     isLocation: uda.location,
//     genericObject: genericObject,
//   );
// }

//Temp map UDA
LocationPickerUDA getMapWebViewUDA(UDAsWithValues uda, String currentLocation) {
  // String longitude = (isEmptyText(currentLocation))
  //     ? ""
  //     : currentLocation.substring(0, currentLocation?.indexOf(","));
  // String latitude = (isEmptyText(currentLocation))
  //     ? ""
  //     : currentLocation.substring((currentLocation?.indexOf(",") ?? 0) + 1);

//  String latitude;
//  String longitude;
//  if (!isEmptyText(uda.udaValue)) {
//    List<String> latLongList = getLatLongFromMapQuery(uda.udaValue);
//    latitude = latLongList[1];
//    longitude = latLongList[0];
//  }
  String longitude = (isEmptyText(currentLocation))
      ? ""
      : currentLocation.substring(0, currentLocation?.indexOf(","));
  String latitude = (isEmptyText(currentLocation))
      ? ""
      : currentLocation.substring(currentLocation?.indexOf(",") + 1);
  MapObject map = MapObject(
      latitude: latitude, longtitude: longitude, mapValue: uda.udaValue);
  return LocationPickerUDA(
    mapObjects: (isEmptyText(uda.udaValue))
        ? []
        : map.pasrseLangtidueAndLatitudeForMapUDA(uda.udaValue),
    longitude: longitude,
    latitude: latitude,
  );
//  return LocationPickerUDA(
//    mapObjects: (uda.udaValue != null)
//        ? pasrseLangtidueAndLatitudeForMapUDA(uda.udaValue)
//        : null,
//    longitude: longitude,
//    latitude: latitude,
//  );
}

Widget getSubPanelWithUDAs(
    List<UDAsWithValues> udas,
    List<UDAsWithValues> fullUDAs,
    SubPanelUda subPanel,
    onUDAsValueChange,
    FormModes mode,
    int objectRecId,
    GenericObject genericObject) {
  return SubPanel(
    key: ValueKey(subPanel.recId),
    mode: mode,
    udas: udas,
    fullUDAs: fullUDAs,
    objectRecId: objectRecId,
    panelTitle: subPanel.subPanelName,
    onUDAsValueChange: onUDAsValueChange,
    subPanels: subPanel.subPanels,
    genericObject: genericObject,
  );
}

Widget getInvokerUDAWidget(UDAsWithValues uda, List<UDAsWithValues> udasList,
    GenericObject genericObject, InvokerType type, onUDAsChange) {
  return InvokerUDA(
    key: ValueKey(uda.recId),
    labelColor: uda.labelColor,
    genericObject: genericObject,
    title: uda.udaCaption,
    udasList: udasList,
    type: type,
    uda: uda,
    onValueChange: (udasValues) {
      onUDAsChange(udasValues);
    },
    isReadOnly: isUDAReadOnly(uda),
    isVisible: isUDAVisible(uda),
  );
}

Widget getReportUDA(UDAsWithValues uda, String currentLocation,
    GenericObject genericObject, int objectRecId) {
  return ReportUDA(
    key: ValueKey(uda.recId),
    labelColor: uda.labelColor,
    title: uda.udaCaption,
    uda: uda,
    objectRecId: objectRecId,
    genericObject: genericObject,
    isReadOnly: isUDAReadOnly(uda),
    isVisible: isUDAVisible(uda),
  );
}

Widget getLastUpdatedInfoUDAWidget(
    UDAsWithValues uda, GenericObject genericObject) {
  return LastUpdatedInfoUDA(
      createDate: genericObject.createdDate,
      createdBy: genericObject.createdBy,
      lastModificationDate: genericObject.updatedDate,
      lastModifiedBy: genericObject.updatedBy,
      statusLastModificationDate: genericObject.statusLastChangeDate,
      groupID: genericObject.groupId,
      uda: uda);
}

//----------Check if is number value----------
bool isNumeric(String value) {
  if (value == null) {
    return false;
  }
  return double.tryParse(value) != null;
}

//----------Parse date types from int to DateType----------
DateType getParsedDateType(int numDatType) {
  switch (numDatType) {
    case 1:
      return DateType.dateOnly;
      break;
    case 2:
      return DateType.timeOnly;
      break;
    case 3:
      return DateType.dateAndTime;
      break;
    default:
      return null;
  }
}

//----------Parse input types from int to InputType----------
InputType getParsedInputType(int inputType) {
  switch (inputType) {
    case 1:
      return InputType.number;
      break;
    case 2:
      return InputType.text;
      break;
    default:
      return InputType.text;
  }
}

//----------Value List helping methods----------
//Check value list type
ValueListType getValueListType(UDAsWithValues uda) {
  return (uda?.bindDataId != null &&
          uda?.sourceOperationDataId != null &&
          uda?.sourceOperationId != null)
      ? ValueListType.dynamicValList
      : (uda.dictionaryId != null)
          ? ValueListType.dictionaryValList
          : ValueListType.staticValList;
}

//Get query info object for dynamic value list
QueryInfo getQueryInfo(UDAsWithValues uda, String valListCondtion) {
  return getValueListType(uda) == ValueListType.dynamicValList
      ? QueryInfo(
          bindDataId: uda.bindDataId,
          queryId: uda.sourceOperationId,
          sourceOperationDataId: uda.sourceOperationDataId,
          filter: valListCondtion)
      : null;
}

//Sort static value list values & validate nonnull values
List<String> validateAndGetStaticValues(UDAsWithValues uda) {
  if (getValueListType(uda) == ValueListType.staticValList &&
      uda.repositoryUDA?.multiValues != null) {
    uda.repositoryUDA.multiValues
        .removeWhere((value) => value.isDeleted == true);
    uda.repositoryUDA.multiValues.sort((a, b) => a.recId.compareTo(b.recId));
    uda.valueListValues = uda.repositoryUDA.multiValues;
  }
  return (uda.repositoryUDA == null || uda.repositoryUDA.multiValues == null)
      ? //Repository is not set from admin or values doesn't exist
      []
      : uda.repositoryUDA.multiValues
          .map((listValue) => listValue.name)
          .toList();
}

//------------Form UDA helping methods----------------
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

//----------Normal validation helping methods----------
bool isUDAReadOnly(UDAsWithValues uda) {
  uda.isReadOnly = (uda.visableType == 2 ? true : false) ||
          (uda.isReadOnly != null ? uda.isReadOnly : false)
      ? true
      : false;
  return uda.isReadOnly;
}

bool isUDAMandatory(UDAsWithValues uda) {
  uda.isMandatory =
      (uda.visableType == 3 ? true && !uda.isNormal ?? false : false) ||
          (uda.visableType == 3 ? true : false) ||
          (uda.isMandatory != null ? uda.isMandatory : false);
  return uda.isMandatory;
}

bool isUDAVisible(UDAsWithValues uda) {
  uda.isVisible = (uda.isVisible ?? true) &&
      (uda.hasNoPrevilage != null ? !uda.hasNoPrevilage : true);
  return uda.isVisible;
}

String getValidationMessage(UDAsWithValues uda) {
  return uda.isUdaValid == true ? '' : uda.validationMessage;
}

GridVisibility getGridValidation(UDAsWithValues uda) {
  switch (uda.visableType) {
    case 1:
      return GridVisibility.normal;
      break;
    case 2:
      return GridVisibility.readOnly;
      break;
    case 3:
      return GridVisibility.mandatory;
      break;
    case 4:
      return GridVisibility.addOnly;
      break;
    case 5:
      return GridVisibility.editOnly;
      break;
    default:
      return GridVisibility.normal;
  }
}

//----get location helping methods -------
Future<String> getDeviceCurrentLocation() async {
  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return "";
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.DENIED) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.GRANTED) {
      return "";
    }
  }

  _locationData = await location.getLocation();
  log(LogType.DEBUG,
      "current location lat ===${_locationData.latitude} longt=== ${_locationData.longitude} ");
  return "${_locationData.latitude},${_locationData.longitude}";
}
