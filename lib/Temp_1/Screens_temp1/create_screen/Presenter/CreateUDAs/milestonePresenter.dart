import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/ErrorResponse/error_data.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MileStoneModel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/CreateUDAs/MilestoneService.dart';
import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Utilities/const.dart';

abstract class MilestoneInterface {
  changeState();
}

abstract class MilestoneContract {
  onLoadDataSuccess(List<MilestoneObject> milestoneList);
  onError(ErrorResponse errorResponse);
}

class MileStonePresenter implements MilestoneContract {
  UDAsWithValues uda;
  GenericObject genericObject;
  BuildContext context;
  bool isMilestoneDataLoaded = false;
  MilestoneInterface milestoneInterface;
  FormModes mode;
  MileStoneServiceCall mileStoneServiceCall = MileStoneServiceCall();
  List<MilestoneObject> milestoneObjectList = [];
  bool isDataLoaded = false;

  MileStonePresenter(
      {this.context,
      this.uda,
      this.genericObject,
      this.milestoneInterface,
      this.mode});

  getMilestoneData(UDAsWithValues uda, BuildContext context,
      GenericObject genericObject, FormModes mode, int objectRecId) {
    isDataLoaded = false;
    milestoneInterface.changeState();
    String additionalUDATableNames = uda.AdditionalUdaTableNames;
    String recId = ((genericObject.recId) != null)
        ? genericObject.recId.toString()
        : objectRecId.toString();
    mileStoneServiceCall
        .getMileStone(context, additionalUDATableNames, recId, mode)
        .then((value) => this.onLoadDataSuccess(value))
        .catchError((value) => this.onError(value));
  }

  loadData(FormModes formMode, int objectRecId, genericObject,
      UDAsWithValues uda, BuildContext context) {
    if (formMode != FormModes.newMode) {
      getMilestoneData(
        uda,
        context,
        genericObject,
        formMode,
        objectRecId,
      );
    } else {
      isDataLoaded = true;
    }
  }

  bool canShowMileStone() {
    return mode != FormModes.newMode &&
        (milestoneObjectList != null && milestoneObjectList.isNotEmpty);
  }

  @override
  onLoadDataSuccess(List<MilestoneObject> milestoneList) {
    isDataLoaded = true;
    milestoneObjectList = milestoneList;
    milestoneInterface.changeState();
  }

  @override
  onError(ErrorResponse response) {
    isDataLoaded = true;
    ShowAlertMessage(response.message, context);
    milestoneInterface.changeState();
    log(LogType.DEBUG, 'Milestone Error Response ====== ${response.message}');
  }
}
