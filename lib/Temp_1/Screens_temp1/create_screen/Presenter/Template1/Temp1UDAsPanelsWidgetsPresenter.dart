import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/UDAsPanelsWidgetsPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/InvokerUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/MileStone/MilestoneWidget.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/MultiMediaUDA/MultiMediaUda.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUtils.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/createFunctions.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:flutter/cupertino.dart';

class Temp1UDAsPanelsWidgetsPresenter extends UDAsPanelsWidgetsPresenter {
  getUDAsListWidgets(bool initialTime) {
    fullUDAsList.forEach((uda) {
      if (mode != FormModes.viewMode)
        resolveUDAConditionalValidation(uda, fullUDAsList);
    });
    udasWidgets = [];
    if (udas != null) {
      sortUDAs();
      udas.forEach((uda) => {
            if (initialTime || uda.udaTextController == null)
              {
                uda.udaTextController = TextEditingController(),
              },
            if ((uda.udaType != 5) &&
                (uda.udaTextController.text != uda.udaValue))
              uda.udaTextController.text = uda.udaValue ?? "",
            (uda.udaType == 9 || uda.udaType == 8 || uda.udaType == 20)
                ? udasWidgets.add(
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: temp1GetUDAWithTypeWidget(uda),
                    ),
                  )
                : (uda.udaType == 22)
                    ? udasWidgets.add(Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: temp1GetUDAWithTypeWidget(uda),
                      ))
                    : udasWidgets.add(Padding(
                        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                        child: temp1GetUDAWithTypeWidget(uda),
                      ))
          });
    }

    if (isNotEmptyList(subPanels)) {
      subPanels.forEach((subPanel) => {
            udasWidgets.add(
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  child: getSubPanelWithUDAs(
                      subPanel.udas,
                      fullUDAsList,
                      subPanel,
                      onSubPanelUDAsChange,
                      mode,
                      objectRecId,
                      genericObject)),
            )
          });
    }
  }

  Widget temp1GetUDAWithTypeWidget(UDAsWithValues uda) {
    switch (uda.udaType) {
      case 1:
        return getNumericUDAWidget(udas, uda, mode, onTextUDAsValueChange);
        break;
      case 2:
        return getTextfieldUDAWidget(udas, uda, mode, onTextUDAsValueChange);
        break;
      case 3:
        return getMemoUDAWidget(udas, uda, mode, onTextUDAsValueChange);
        break;
      case 4:
        return getValueListUDAWidget(
            udas,
            valueListUDAs,
            genericObject,
            uda,
            mode,
            onValueListValueChange,
            onDependentValueListValueChange,
            onApplyingValueListRules);
        break;
      case 5:
        return getFormUDAWidget(
            udas, uda, mode, genericObject, onFormListUDAValueChange);
        break;
      case 6:
        return getDateUDAWidget(udas, uda, mode, onTextUDAsValueChange);
        break;
      case 7:
        return getImageUDAWidget(uda, onTextUDAsValueChange);
        break;
      case 8:
        return getAttachmentUDAWidget(
            uda, mode, onAttachmentListChange, objectRecId);
      case 9:
        return getGridUDAWidget(
            uda, onGridUDARowsChange, objectRecId, genericObject, mode);
        break;
      case 10:
        return getNoteUDAWidget(uda, mode, onNoteValueChange, objectRecId);
        break;
      case 11:
        return getInvokerUDAWidget(uda, fullUDAsList, genericObject,
            InvokerType.DBInvoker, onInvokerTap);
        break;
      case 12:
        return getInvokerUDAWidget(uda, fullUDAsList, genericObject,
            InvokerType.SOAPInvoker, onUDAsValueChange);
        break;
      case 13:
        return getInvokerUDAWidget(uda, fullUDAsList, genericObject,
            InvokerType.RuleInvoker, onUDAsValueChange);
        break;
      case 14:
        return getCheckboxUDAWidget(udas, uda, mode, onCheckboxValueChange);
        break;
      case 16:
        return getCalculatedFieldUDAWidget(udas, uda);
        break;
      case 19:
        return getAutoIDUDAWidget(uda, setAutoIdUdaId, mode);
        break;
      case 18:
        return MilestoneWidget(
            genericObject: genericObject,
            uda: uda,
            mode: mode,
            objectRecId: objectRecId);
        break;
      case 20:
        return getMultipleLevelUDA(
            uda, objectRecId, mode, onMultiLevelValueChange);
        break;
      //  case 22:
      //    return getHelpUDAWidget(uda);
      //    break;
      //Temp map UDA
      case 23:
        return getReportUDA(uda, location, genericObject, objectRecId);
        break;
      case 24:
        return getMapWebViewUDA(uda, location);
        break;
      case 25:
        return getRichTextUDAWidget(uda, mode, onRichTextValueChange);
        break;
      case 17:
        return getAssignmentInfoWidget(
            udas, uda, mode, onAssignmentValueChange);
        break;
      case 39:
        return getLastUpdatedInfoUDAWidget(uda, genericObject);
      //Menna review... Add method in createUtils that returns MultiMediaUda
      case 40:
        return MultiMediaUda(
          uda,
          genericObject,
          mode,
          onTextUDAsValueChange,
          onMultiMediaUDAsValueChange,
          key: ValueKey(uda.recId),
        );
      //counter chart
      default:
        return Container();
    }
  }
}
