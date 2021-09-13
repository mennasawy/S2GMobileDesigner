import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/AssignmentInfoUDAModel/SaveAssignmentInfoModel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/SubPanelUda.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/createFunctions.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'dart:io';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Attachment/attach_RowData.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/ColumnDefs.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MultipleLevel/MultipleLevelRepositoryFields.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridRow.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MultipleLevel/MultipleLevelRowData.dart';
import 'package:templets/Utilities/const.dart';
import 'package:flutter/material.dart';

abstract class PanelsViewInterface {
  void updateWidgetOfPanelsAndUDAs();
}

class UDAsPanelsWidgetsPresenter {
  FormModes mode;
  SubPanelUda selectedPanel;
  List<SubPanelUda> panels;
  List<UDAsWithValues> fullUDAsList = [];

  int objectRecId;
  List<UDAsWithValues> udas; //Current panel UDAs
  List<SubPanelUda> subPanels;
  Function(List<UDAsWithValues>) onUDAsValueChange;
  GenericObject genericObject;
  String location;

  List<Widget> udasWidgets = [];
  List<UDAsWithValues> helpUDAs = [];
  List<UDAsWithValues> valueListUDAs = [];

  Function(UDAsWithValues) setAutoIdUdaId;
  Function(UDAsWithValues, bool) onCheckboxValueChange;
  Function(UDAsWithValues, dynamic, TextEditingController)
      onTextUDAsValueChange;
  Function(UDAsWithValues, dynamic) onFormListUDAValueChange;
  Function(UDAsWithValues, String) onValueListValueChange;
  Function(List<UDAsWithValues>) onApplyingValueListRules;
  Function(List<UDAsWithValues>) onDependentValueListValueChange;
  Function(UDAsWithValues, dynamic) onNoteValueChange;
  Function(
      UDAsWithValues uda,
      String companyValue,
      String organizationValue,
      String groupValue,
      String memberValue,
      SaveAssignmentInfoModel memberData) onAssignmentValueChange;
  Function(UDAsWithValues, List<AttachData>, List<File> files)
      onAttachmentListChange;
  Function(UDAsWithValues, List<GridRowData>) onGridUDARowsChange;
  Function(UDAsWithValues, List<MultipleLevelRowData>) onMultiLevelValueChange;
  Function(UDAsWithValues, String) onRichTextValueChange;
  Function onInvokerTap;
  Function onSubPanelUDAsChange;
  Function(UDAsWithValues, dynamic, TextEditingController description)
      onMultiMediaUDAsValueChange;

  PanelsViewInterface panelsView;
  PanelsViewInterface udasView;

  UDAsPanelsWidgetsPresenter(
      {this.objectRecId,
      this.udas,
      this.subPanels,
      this.onUDAsValueChange,
      this.genericObject,
      this.location,
      this.panelsView,
      this.udasView,
      this.panels,
      this.selectedPanel,
      this.fullUDAsList,
      this.mode}) {
    // initializeUDAsItems();
  }

  //Panels helping methods
  initializePanelItems() {
    if (isNotEmptyList(panels)) {
      selectedPanel = panels[0];
      panels[0].isPanelSelected = true;
      separateUDAsListFromPanels();
    }
  }

  separateUDAsListFromPanels() {
    fullUDAsList = [];
    panels.forEach((panel) => {
          fullUDAsList.addAll(panel.udas),
          panel.subPanels
              .forEach((subPanel) => fullUDAsList.addAll(subPanel.udas))
        });
  }

  onPanelSelectionAction(int index) {
    selectedPanel = panels[index];
    panels
        .firstWhere((panel) => panel.isPanelSelected == true)
        .isPanelSelected = false;
    panels[index].isPanelSelected = true;

    panelsView.updateWidgetOfPanelsAndUDAs();
  }

  int panelsLength() {
    return (mode == FormModes.freeModuleFromDashboardMode)
        ? panels.length == 1
            ? 0
            : panels.length
        : panels.length;
  }

  String panelTitle(int index) {
    return panels[index].subPanelName ?? "";
  }

  //UDAs helping methods
  initializeUDAsItems() {
    fullUDAsList.forEach((uda) {
      if (mode != FormModes.viewMode)
        resolveUDAConditionalValidation(uda, fullUDAsList);
    }); //To initialize validation state for all UDAs

    onTextUDAsValueChange = (UDAsWithValues uda, dynamic value,
        TextEditingController textController) {
      uda.udaValue = value;
      if (textController.text != value) textController.text = value;
      onUDAsValueChange(fullUDAsList);
      resolveUDAConditionalValidation(uda, fullUDAsList);
      udasView.updateWidgetOfPanelsAndUDAs();
    };

    onFormListUDAValueChange = (UDAsWithValues uda, dynamic value) {
      uda.udaValue = value;
      onUDAsValueChange(fullUDAsList);
      resolveUDAConditionalValidation(uda, fullUDAsList);
      udasView.updateWidgetOfPanelsAndUDAs();
    };

    onRichTextValueChange = (UDAsWithValues uda, String value) {
      uda.richTextValue = value;
      resolveUDAConditionalValidation(uda, fullUDAsList);
      udasView.updateWidgetOfPanelsAndUDAs();
    };
    onCheckboxValueChange = (UDAsWithValues uda, bool value) {
      uda.udaValue = value.toString();
      onUDAsValueChange(fullUDAsList);
      resolveUDAConditionalValidation(uda, fullUDAsList);
      udasView.updateWidgetOfPanelsAndUDAs();
    };

    onValueListValueChange = (
      UDAsWithValues uda,
      String value,
    ) {
      if (uda.repositoryUDA != null ||
          uda.dictionaryId !=
              null) //Repository is set from admin or repo type is dictionary
      {
        uda.udaValue = !isEmptyText(value) ? value : null;
        uda.selectedObj = !isEmptyText(value)
            ? uda.valueListValues
                .firstWhere((listValue) => listValue.name == value)
            : null;
        onUDAsValueChange(fullUDAsList);
        resolveUDAConditionalValidation(uda, fullUDAsList);
        udasView.updateWidgetOfPanelsAndUDAs();
      }
    };

    onDependentValueListValueChange =
        (List<UDAsWithValues> dependentValueLists) {
      fullUDAsList.forEach((uda) {
        dependentValueLists.forEach((valList) {
          if (uda.recId == valList.recId) {
            uda = valList;
          }
        });
      });

      udas.forEach((uda) {
        dependentValueLists.forEach((valList) {
          if (uda.recId == valList.recId) {
            uda = valList;
          }
        });
      });
      udasView.updateWidgetOfPanelsAndUDAs();
    };

    onApplyingValueListRules = (List<UDAsWithValues> udasValues) {
      onUDAsValueChange(udasValues);
      // fullUDAsList = udasValues;
      udasView.updateWidgetOfPanelsAndUDAs();
    };

    setAutoIdUdaId = (UDAsWithValues uda) {
      if (!udasWithValues.contains(uda)) {
        udasWithValues.add(uda);
      } else {
        udasWithValues[udasWithValues.indexOf(uda)].udaId = -1;
      }
      udasView.updateWidgetOfPanelsAndUDAs();
    };

    onNoteValueChange = (UDAsWithValues uda, notesList) {
      uda.notesList = notesList;
      onUDAsValueChange(fullUDAsList);
      udasView.updateWidgetOfPanelsAndUDAs();
    };

    onAttachmentListChange = (UDAsWithValues uda,
        List<AttachData> attachmentList, List<File> files) {
      log(LogType.DEBUG,
          'On attachment UDA value changes ===== ${attachmentList.length}');
      uda.attachments = attachmentList;
      onUDAsValueChange(fullUDAsList);
      resolveUDAConditionalValidation(uda, fullUDAsList);
      udasView.updateWidgetOfPanelsAndUDAs();
    };

    onAssignmentValueChange = (UDAsWithValues uda,
        String companyValue,
        String organizationValue,
        String groupValue,
        String memberValue,
        SaveAssignmentInfoModel memberData) {
      uda.ai_Comp = companyValue;
      uda.ai_Orga = organizationValue;
      uda.ai_Group = groupValue;
      uda.ai_Mem = memberValue;
      uda.ai_Mem_UId =
          (memberData != null) ? memberData.userID.toString() : null;
      uda.assignedMemberDTO = memberData;
      onUDAsValueChange(fullUDAsList);
      resolveUDAConditionalValidation(uda, fullUDAsList);
      udasView.updateWidgetOfPanelsAndUDAs();
    };

    onGridUDARowsChange = (UDAsWithValues uda, List<GridRowData> rowsData) {
      uda.rowData = rowsData;
      uda.fields = isNotEmptyList(rowsData) ? rowsData.last.columnsList : [];
      uda.columnDefs = [];
      uda.fields.forEach((field) {
        uda.columnDefs.add(ColumnDefs(
          headerName: field.headerName,
          field: field.field,
          width: field.width,
        ));
      });
      onUDAsValueChange(fullUDAsList);
      resolveUDAConditionalValidation(uda, fullUDAsList);
      udasView.updateWidgetOfPanelsAndUDAs();
    };

    onMultiLevelValueChange =
        (UDAsWithValues uda, List<MultipleLevelRowData> rowsData) {
      uda.rowData = rowsData;
      if (uda.levelRepositoryField == null) {
        uda.levelRepositoryField = [];
        for (var i = 0; i < rowsData[0].columnsList.length; i++) {
          uda.levelRepositoryField.add(MultipleLevelRepositoryField(
            caption: rowsData[0].columnsList[i].caption,
            name: "Tire " + (i + 1).toString(),
            width: 150,
            seq: i + 1,
            type: 2,
          ));
        }
        uda.levelRepositoryField.add(MultipleLevelRepositoryField(
          caption: "Repository",
          name: "Repository Id",
          width: 100,
          seq: 1,
          type: null,
        ));
      }
      onUDAsValueChange(fullUDAsList);
      resolveUDAConditionalValidation(uda, fullUDAsList);
      udasView.updateWidgetOfPanelsAndUDAs();
    };

    onInvokerTap = (List<UDAsWithValues> udasValues) {
      onUDAsValueChange(udasValues);
      fullUDAsList = udasValues;
      udasView.updateWidgetOfPanelsAndUDAs();
    };

    onSubPanelUDAsChange = (List<UDAsWithValues> udas) {
      onUDAsValueChange(fullUDAsList);
      subPanels.forEach((subPanel) => subPanel.udas.forEach(
          (uda) => resolveUDAConditionalValidation(uda, fullUDAsList)));
      udasView.updateWidgetOfPanelsAndUDAs();
    };

    onMultiMediaUDAsValueChange =
        (UDAsWithValues uda, dynamic value, TextEditingController description) {
      uda.multiMediaDescription = value;
      if (description.text != value) description.text = value;
      onUDAsValueChange(fullUDAsList);
      resolveUDAConditionalValidation(uda, fullUDAsList);
      udasView.updateWidgetOfPanelsAndUDAs();
    };
  }

  //UDAs sorting helping methods
  sortUDAs() {
    //Sort with UDA order
    udas.sort((a, b) => a.udaOrder.compareTo(b.udaOrder));

    //Move help UDAs to the beginning
    if (doesContainHelpUDA()) {
      udas.forEach((uda) => {
            if (uda.udaType == 22)
              {
                helpUDAs.add(uda),
              }
          });
      for (int i = 0; i < helpUDAs.length; i++) {
        moveUDAToBeginning(helpUDAs[i]);
      }
    }

    //Initialize list of value list UDAs
    if (doesContainValueListUDA()) {
      valueListUDAs = udas.where((uda) => uda.udaType == 4).toList();
    }
  }

  moveUDAToBeginning(UDAsWithValues helpUDA) {
    udas.remove(helpUDA);
    udas.insert(0, helpUDA);
  }

  //Get all help UDAs only in the current panel to move them to the top of the panel.
  bool doesContainHelpUDA() {
    bool isHelpUDA = false;
    udas.forEach((uda) => {
          if (uda.udaType == 22) {isHelpUDA = true}
        });
    return isHelpUDA;
  }

  //Get all value list UDAs in the whole form to check value list dependency.
  bool doesContainValueListUDA() {
    bool isValueListUDA = false;
    fullUDAsList.forEach((uda) => {
          if (uda.udaType == 4) {isValueListUDA = true}
        });
    return isValueListUDA;
  }
}
