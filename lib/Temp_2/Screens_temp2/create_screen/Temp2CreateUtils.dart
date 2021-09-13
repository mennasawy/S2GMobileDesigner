import 'dart:io';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/AssignmentInfoUDAModel/SaveAssignmentInfoModel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Attachment/attach_RowData.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridCols.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridRow.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MultipleLevel/MultipleLevelRowData.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/SubPanelUda.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/map.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/AttachmentUDA/AttachmentUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/HelpUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/InvokerUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/MapWebViewUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/ReportUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/RichTextUDA/RichTextUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUtils.dart';
import 'package:templets/Utilities/const.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/MultiLevelUDA/Temp2MultilevelTable.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2AssignmentInfoUDA.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2AttachmentUDA/Temp2AttachmentUDA.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2BasicTextInputUDA.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2CheckBoxUDA.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2DateUDA/Temp2DateUDA.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2FormUDA.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2GridUDA/Temp2GridTable.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2ImageBasedUDAs/Temp2DigitalSignatureUDA.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2ImageBasedUDAs/Temp2ImageUDA.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2LastUpdatedIndoUDA.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2MemoUDA.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2NoteUDA/Temp2NoteUDA.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2NumericUDA.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2QRScannerUDA.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2ReadOnlyTextUDA.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2SubPanel.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2ValueList.dart';
import 'package:flutter/material.dart';

//----------UDAs Rendering Methods----------
Widget temp2GetNumericUDAWidget(
    List<UDAsWithValues> udas,
    UDAsWithValues uda,
    FormModes mode,
    onTextUDAsValueChange(UDAsWithValues uda, String value,
        TextEditingController textController)) {
  if (!isNumeric(uda.udaValue)) uda.udaTextController.text = "";
  return uda.qrCode == true
      ? Temp2QRScannerUDA(
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
      : Temp2NumericUDA(
          key: ValueKey(uda.recId),
          title: uda.udaCaption,
          labelColor: uda.labelColor,
          // inputHint: (isEmptyText(uda.defaultValue))
          //     ? uda.udaCaption
          //     : uda.defaultValue,
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

Widget temp2GetTextfieldUDAWidget(
    List<UDAsWithValues> udas,
    UDAsWithValues uda,
    FormModes mode,
    onTextUDAsValueChange(UDAsWithValues uda, String value,
        TextEditingController textController)) {
  uda.udaValue = uda.udaValue ?? uda.defaultValue ?? '';
  return uda.qrCode == true
      ? Temp2QRScannerUDA(
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
      : Temp2BasicTextInputUDA(
          labelColor: uda.labelColor,
          key: ValueKey(uda.recId),
          title: uda.udaCaption,
          // inputHint: (isEmptyText(uda.defaultValue))
          //     ? uda.udaCaption
          //     : uda.defaultValue,
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

Temp2MemoUDA temp2GetMemoUDAWidget(
    List<UDAsWithValues> udas,
    UDAsWithValues uda,
    FormModes mode,
    onTextUDAsValueChange(UDAsWithValues uda, String value,
        TextEditingController textController)) {
  uda.udaValue = uda.udaValue ?? uda.defaultValue ?? '';
  return Temp2MemoUDA(
    key: ValueKey(uda.recId),
    // inputHint: uda.udaCaption,
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

Temp2ValueListUDA temp2GetValueListUDAWidget(
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
  return Temp2ValueListUDA(
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

Temp2FormUDA temp2GetFormUDAWidget(
    List<UDAsWithValues> udas,
    UDAsWithValues uda,
    FormModes mode,
    GenericObject genericObject,
    onTextUDAsValueChange(UDAsWithValues uda, dynamic value)) {
  return Temp2FormUDA(
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

Temp2DateUDA temp2GetDateUDAWidget(
    List<UDAsWithValues> udas,
    UDAsWithValues uda,
    FormModes mode,
    onTextUDAsValueChange(UDAsWithValues uda, String value,
        TextEditingController textController)) {
  uda.udaValue = uda.udaValue ?? uda.defaultValue ?? '';
  return Temp2DateUDA(
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

Widget temp2GetRichTextUDAWidget(UDAsWithValues uda, FormModes mode,
    onTextUDAsValueChange(UDAsWithValues uda, String value)) {
  return RichTextUDA(
    key: ValueKey(uda.recId),
    richTextUda: uda,
    mode: mode,
    isReadOnly: isUDAReadOnly(uda),
    isVisible: isUDAVisible(uda),
    isMandatory: isUDAMandatory(uda),
    template: 2,
    onValueChange: ((value) {
      onTextUDAsValueChange(uda, value);
    }),
  );
//  return Container();
}

temp2GetNoteUDAWidget(UDAsWithValues uda, FormModes mode,
    onNoteValueChange(UDAsWithValues uda, notesList), int objectRecId) {
  return Temp2NoteUDA(
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

Widget temp2GetAttachmentUDAWidget(
    UDAsWithValues uda,
    FormModes mode,
    onAttachmentListChange(
        UDAsWithValues uda, List<AttachData> attachmentList, List<File> files),
    int objectRecId) {
  return Temp2AttachmentUDA(
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

Widget temp2GetAssignmentInfoWidget(
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
  return Temp2AssignmentInfoUDA(
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

Temp2CheckBoxUDA temp2GetCheckboxUDAWidget(
    List<UDAsWithValues> udas,
    UDAsWithValues uda,
    FormModes mode,
    onCheckboxValueChange(UDAsWithValues uda, bool value)) {
  if (uda.udaValue == null) uda.udaValue = 'false';
  return Temp2CheckBoxUDA(
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

Temp2ReadOnlyTextUDA temp2GetCalculatedFieldUDAWidget(
    List<UDAsWithValues> udas, UDAsWithValues uda) {
  return Temp2ReadOnlyTextUDA(
    key: ValueKey(uda.recId),
    inputValue: uda.udaValue ?? '',
    udaDescription: uda.udaDescription,
    validationMessage: getValidationMessage(uda),
    isValidationMSGWarning: uda.isValidationCondMsgWarn,
    // inputHint: uda.udaCaption,
    isMandatory: isUDAMandatory(uda),
    isVisible: isUDAVisible(uda),
    title: uda.udaCaption,
    labelColor: uda.labelColor,
    isLocation: uda.location,
  );
}

Temp2ReadOnlyTextUDA temp2GetAutoIDUDAWidget(
    UDAsWithValues uda, setUDAId(UDAsWithValues uda), FormModes formMode) {
  uda.udaId = -1;
  if (uda.defaultValue != null) {
    uda.udaValue = uda.defaultValue;
  }
  if (formMode == FormModes.cloneMode) {
    uda.udaValue = null;
  }
  setUDAId(uda);
  return Temp2ReadOnlyTextUDA(
    key: ValueKey(uda.recId),
    inputValue: uda.udaValue ?? '',
    udaDescription: uda.udaDescription,
    validationMessage: getValidationMessage(uda),
    isValidationMSGWarning: uda.isValidationCondMsgWarn,
    // inputHint: uda.udaCaption,
    isMandatory: isUDAMandatory(uda),
    isVisible: isUDAVisible(uda),
    title: uda.udaCaption,
    labelColor: uda.labelColor,
    isLocation: uda.location,
  );
}

HelpUDA temp2GetHelpUDAWidget(UDAsWithValues uda) {
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

Temp2MultiLevelTable temp2GetMultipleLevelUDA(
    UDAsWithValues uda,
    int objectRecId,
    FormModes formMode,
    onGridRowsChange(UDAsWithValues uda, List<MultipleLevelRowData> rowsData)) {
  return Temp2MultiLevelTable(
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

Widget temp2GetImageUDAWidget(
    UDAsWithValues uda,
    onImageUDAValueChange(UDAsWithValues uda, String value,
        TextEditingController textController)) {
  TextEditingController textController = TextEditingController();
  return (uda.eSignature == true)
      ? Temp2DigitalSignatureUDA(
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
      : Temp2ImageUDA(
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

Temp2GridTable temp2GetGridUDAWidget(
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
  return Temp2GridTable(
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

//Temp map UDA
LocationPickerUDA temp2GetMapWebViewUDA(
    UDAsWithValues uda, String currentLocation) {
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

Widget temp2GetSubPanelWithUDAs(
    List<UDAsWithValues> udas,
    List<UDAsWithValues> fullUDAs,
    SubPanelUda subPanel,
    onUDAsValueChange,
    FormModes mode,
    int objectRecId,
    GenericObject genericObject) {
  return Temp2SubPanel(
      key: ValueKey(subPanel.recId),
      mode: mode,
      udas: udas,
      fullUDAs: fullUDAs,
      objectRecId: objectRecId,
      panelTitle: subPanel.subPanelName,
      onUDAsValueChange: onUDAsValueChange,
      subPanels: subPanel.subPanels,
      genericObject: genericObject);
}

Widget temp2GetInvokerUDAWidget(
    UDAsWithValues uda,
    List<UDAsWithValues> udasList,
    GenericObject genericObject,
    InvokerType type,
    onUDAsChange) {
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

Widget temp2GetReportUDA(UDAsWithValues uda, String currentLocation,
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

Widget temp2GetLastUpdatedInfoUDAWidget(
    UDAsWithValues uda, GenericObject genericObject) {
  return Temp2LastUpdatedInfoUDA(
      createDate: genericObject.createdDate,
      createdBy: genericObject.createdBy,
      lastModificationDate: genericObject.updatedDate,
      lastModifiedBy: genericObject.updatedBy,
      statusLastModificationDate: genericObject.statusLastChangeDate,
      groupID: genericObject.groupId,
      uda: uda);
}
