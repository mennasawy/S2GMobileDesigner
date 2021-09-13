import 'package:flutter/cupertino.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/UDAsPanelsWidgetsPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/InvokerUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/MileStone/MilestoneWidget.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/MultiMediaUDA/MultiMediaUda.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/createFunctions.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUtils.dart';

class Temp2UDAsPanelsWidgetsPresenter extends UDAsPanelsWidgetsPresenter {
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
            (uda.udaType == 9 || uda.udaType == 20)
                ? udasWidgets.add(
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: temp2GetUDAWithTypeWidget(uda),
                    ),
                  )
                : (uda.udaType == 22)
                    ? udasWidgets.add(Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: temp2GetUDAWithTypeWidget(uda),
                      ))
                    : udasWidgets.add(Padding(
                        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                        child: temp2GetUDAWithTypeWidget(uda),
                      ))
          });
    }

    if (isNotEmptyList(subPanels)) {
      subPanels.forEach((subPanel) => {
            udasWidgets.add(
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  child: temp2GetSubPanelWithUDAs(
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

  Widget temp2GetUDAWithTypeWidget(UDAsWithValues uda) {
    switch (uda.udaType) {
      case 1:
        return temp2GetNumericUDAWidget(udas, uda, mode, onTextUDAsValueChange);
        break;
      case 2:
        return temp2GetTextfieldUDAWidget(
            udas, uda, mode, onTextUDAsValueChange);
        break;
      case 3:
        return temp2GetMemoUDAWidget(udas, uda, mode, onTextUDAsValueChange);
        break;
      case 4:
        return temp2GetValueListUDAWidget(
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
        return temp2GetFormUDAWidget(
            udas, uda, mode, genericObject, onFormListUDAValueChange);
        break;
      case 6:
        return temp2GetDateUDAWidget(udas, uda, mode, onTextUDAsValueChange);
        break;
      case 7:
        return temp2GetImageUDAWidget(uda, onTextUDAsValueChange);
        break;
      case 8:
        return temp2GetAttachmentUDAWidget(
            uda, mode, onAttachmentListChange, objectRecId);
      case 9:
        return temp2GetGridUDAWidget(
            uda, onGridUDARowsChange, objectRecId, genericObject, mode);
        break;
      case 10:
        return temp2GetNoteUDAWidget(uda, mode, onNoteValueChange, objectRecId);
        break;
      case 11:
        return temp2GetInvokerUDAWidget(uda, fullUDAsList, genericObject,
            InvokerType.DBInvoker, onInvokerTap);
        break;
      case 12:
        return temp2GetInvokerUDAWidget(uda, fullUDAsList, genericObject,
            InvokerType.SOAPInvoker, onUDAsValueChange);
        break;
      case 13:
        return temp2GetInvokerUDAWidget(uda, fullUDAsList, genericObject,
            InvokerType.RuleInvoker, onUDAsValueChange);
        break;
      case 14:
        return temp2GetCheckboxUDAWidget(
            udas, uda, mode, onCheckboxValueChange);
        break;
      case 16:
        return temp2GetCalculatedFieldUDAWidget(udas, uda);
        break;
      case 18:
        return MilestoneWidget(
            genericObject: genericObject,
            uda: uda,
            mode: mode,
            objectRecId: objectRecId);
        break;
      case 19:
        return temp2GetAutoIDUDAWidget(uda, setAutoIdUdaId, mode);
        break;
      case 20:
        return temp2GetMultipleLevelUDA(
            uda, objectRecId, mode, onMultiLevelValueChange);
        break;
      //  case 22:
      //    return getHelpUDAWidget(uda);
      //    break;
      //Temp map UDA
      case 23:
        return temp2GetReportUDA(uda, location, genericObject, objectRecId);
        break;
//      case 24:
//        return getMapWebViewUDA(uda,  location);
//        break;
      case 25:
        return temp2GetRichTextUDAWidget(uda, mode, onRichTextValueChange);
        break;
      case 17:
        return temp2GetAssignmentInfoWidget(
            udas, uda, mode, onAssignmentValueChange);
        break;
      case 39:
        return temp2GetLastUpdatedInfoUDAWidget(uda, genericObject);
      //Menna review... Add method in  temp2CreateUtils that returns MultiMediaUda
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
