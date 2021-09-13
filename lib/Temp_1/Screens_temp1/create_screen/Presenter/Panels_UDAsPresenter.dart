import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/Rules.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/SubPanelUda.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/Types.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/ErrorResponse/error_data.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/AllValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUtils.dart';
import 'package:templets/Utilities/api_constant.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/dependency_injection.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/createFunctions.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/UDAsView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class PanelsResponse {
  void onLoadPanelsResponseComplete(List<SubPanelUda> panelsWithUDAs);
  void onLoadPanelsResponseError(ErrorResponse error);
}

abstract class UDAsResponse {
  void onLoadUDAsResponseComplete(UDAsObject panelsWithUDAs);
  void onLoadUDAsResponseError(ErrorResponse error);
  void onLoadingRulesResponseComplete(GenericObject genericObject);
  void onLoadingRulesError(error);
}

abstract class GenericObjectResponse {
  void onSavingGenericObjectResponseComplete(GenericObject object);
  void onSavingGenericObjectResponseError(ErrorResponse error);
}

abstract class SavedGenericObjectResponse {
  void onLoadSavedGenericObjectResponseComplete(
      GenericObject savedGenericObject);
  void onLoadSavedGenericObjectResponseError(ErrorResponse error);
}

class PanelsUDAsPresenter
    implements
        PanelsResponse,
        UDAsResponse,
        SavedGenericObjectResponse,
        GenericObjectResponse {
  int rowID;
  int typeRecId;
  int objectRecID;
  bool isNewMode;
  BuildContext context;

  UDAsView view;
  GenericObject genericObject;
  UDAsRepository _udasRepository;
  List<SubPanelUda> panelsWithUDAs;
  LoadingRulesRepository loadingRulesRepository;
  GenericObjectRepository genericObjectRepository;
  RulesGenericObject _rulesGenericObject = RulesGenericObject();

  //######View related parameters######
  final Types type;

  final int typeID;
  final int savedObjectID;
  String location;
  final String moduleID;

  final AllValues object;
  final dynamic objectId;

  FormModes mode;

  bool modifyall;
  bool isLocationSet;
  bool isSavingObject;
  bool isPanelsWithUDAsLoaded;
  bool isPanelsWithUDAsLoadFailed;
  final bool hasModifyPrivilage;
  bool isPresenterCalled = false;

  final List<UDAsWithValues> fullUDAsList = [];

  PanelsUDAsPresenter({
    this.type,
    this.moduleID,
    this.typeID,
    this.object,
    this.objectId,
    this.savedObjectID,
    this.mode,
    this.isSavingObject,
    this.hasModifyPrivilage,
    this.isLocationSet,
    this.location,
    this.view,
    this.context,
    this.objectRecID,
    this.rowID,
    this.typeRecId,
    this.modifyall,
  }) {
    _udasRepository = Injector().udasToRepository;
    loadingRulesRepository = Injector().loadingRulesRepository;
    genericObjectRepository = Injector().genericObjectToRepository;
    genericObject = GenericObject();
    isSavingObject = false;
    isPanelsWithUDAsLoaded = false;
    isPanelsWithUDAsLoadFailed = false;
    isLocationSet = false;
  }

  void loadPanelsAndUDAs(typeRecId, isNewMode, udas) {
    this.typeRecId = typeRecId;
    this.isNewMode = isNewMode;
    _udasRepository
        .getPanelsOfSelectedBusinessType(context, typeRecId)
        .then((c) => this.onLoadPanelsResponseComplete(c))
        .catchError((onError) => this.onLoadPanelsResponseError(onError));
  }

  void applyOnLoadingRule(String action, String rowID) {
    _rulesGenericObject.object = genericObject;
    _rulesGenericObject.isNew = isNewMode;
    _rulesGenericObject.ruleType = isNewMode ? "before" : "after";
    _rulesGenericObject.objectTypeRecId =
        genericObject.type?.recId ?? genericObject.typeId ?? 0;
    _rulesGenericObject.objectRecId =
        genericObject.type?.objects?.recId ?? objectRecID;
    loadingRulesRepository
        .getOnLoadingRules(action, rowID, context, _rulesGenericObject)
        .then((response) => this.onLoadingRulesResponseComplete(response))
        .catchError((onError) => this.onLoadingRulesError(onError));
  }

  void getSavedGenericObjectWithId(objectId, savedObjectId) {
    genericObjectRepository
        .getSavedGenericObjectWithId(context, objectId, savedObjectId)
        .then((c) => this.onLoadSavedGenericObjectResponseComplete(c))
        .catchError(
            (onError) => this.onLoadSavedGenericObjectResponseError(onError));
  }

  void saveGenericObject(
      GenericObject genericObject, List<SubPanelUda> panels) {
    genericObjectRepository
        .postGenericObject(context, genericObject, modifyall)
        .then((c) => this.onSavingGenericObjectResponseComplete(c))
        .catchError(
            (onError) => this.onSavingGenericObjectResponseError(onError));
  }

  initializeGenericObject() {
    // if (type != null && moduleID != null) {
    genericObject.type = type;
    genericObject.typeId = type?.recId ?? typeID;
    genericObject.typeObjectId = moduleID;
    // _genericObject.typeObjectId = objectId.toString();
    // }
  }

  loadFormDataOnFormType() {
    if (mode == FormModes.newMode ||
        mode == FormModes.freeModuleMode ||
        mode == FormModes.freeModuleFromDashboardMode ||
        mode == FormModes.dictionaryModule) {
      _loadPanelsOfUDAs();
    } else if (mode == FormModes.cloneMode ||
        mode == FormModes.editMode ||
        mode == FormModes.viewMode) _loadPanelsOfUDAsOnCloneMode();
  }

  void _loadPanelsOfUDAs() {
    if (isPresenterCalled) return;
    loadPanelsAndUDAs(type?.recId ?? typeID, true, null);
    isPresenterCalled = true;
  }

  void _loadPanelsOfUDAsOnCloneMode() {
    if (isPresenterCalled) return;
    getSavedGenericObjectWithId(objectId, object?.recid ?? savedObjectID);
    isPresenterCalled = true;
  }

  bool shouldShowSaveButton() {
    return (mode != FormModes.freeModuleMode &&
        mode != FormModes.freeModuleFromDashboardMode &&
        mode != FormModes.dictionaryModule &&
        (hasModifyPrivilage != false || mode == FormModes.newMode));
  }

  int getObjectRecID() {
    return (mode == FormModes.newMode ||
            mode == FormModes.freeModuleMode ||
            mode == FormModes.freeModuleFromDashboardMode ||
            mode == FormModes.dictionaryModule)
        ? 0
        //Separate
        : object?.recid ??
            ((objectId is String) ? int.tryParse(objectId) : objectId);
  }

  bool checkGenericObjectUDAsLocation(List<UDAsWithValues> genericObjectUdas) {
    bool isLocationFound = false;
    genericObjectUdas.forEach((uda) {
      if (uda.location == true || uda.udaType == 24) {
        isLocationFound = true;
        return;
      }
    });
    return isLocationFound;
  }

  checkUDAsLocation() async {
    panelsWithUDAs.forEach((element) async {
      if (checkGenericObjectUDAsLocation(element.udas)) {
        location = await getDeviceCurrentLocation();
        isLocationSet = true;
        view.updateGenericObjectView();
        return;
      }
    });
  }

  setSavedGenericObject(GenericObject savedGenericObject) {
    if (mode == FormModes.viewMode || hasModifyPrivilage == false)
      savedGenericObject.udasValues.forEach((uda) => {
            uda.isReadOnly = true,
            uda.isNormal = false,
          });
    genericObject = savedGenericObject;
    genericObject.type ??= type;
    //This object is used in conditional validations on generic object
    mainGenericObject = savedGenericObject;
  }

  String getSaveButtonText() {
    return
        //Separate..
        (mode == FormModes.newMode || mode == FormModes.cloneMode)
            ? 'Submit'
            : 'Update';
  }

  //##############APIs Response Handling##############
  @override
  void onLoadPanelsResponseComplete(List<SubPanelUda> panels) {
    panelsWithUDAs = panels;
    if (isNewMode) {
      _udasRepository
          .getUDAsWithValues(context, typeRecId)
          .then((c) => this.onLoadUDAsResponseComplete(c))
          .catchError((onError) => this.onLoadUDAsResponseError(onError));
    } else {
      applyOnLoadingRule("after", rowID.toString());
    }
  }

  @override
  void onLoadPanelsResponseError(ErrorResponse error) {
    // TODO: implement onLoadPanelsResponseError
    onLoadingScreenDataError(error);
  }

  @override
  void onLoadUDAsResponseComplete(UDAsObject udasObject) {
    udasObject.udas.forEach((uda) {
      if (uda.udaType == 14 && uda.udaValue == null) uda.udaValue = 'false';
    });
    genericObject.udasValues = udasObject.udas;
    applyOnLoadingRule("befor", objectRecID.toString());
  }

  @override
  void onLoadUDAsResponseError(error) {
    // TODO: implement onLoadUDAsResponseError
    onLoadingScreenDataError(error);
  }

  @override
  Future<void> onLoadingRulesResponseComplete(
      GenericObject genericObject) async {
    // TODO: implement onLoadingRulesResponseComplete
    mainGenericObject = genericObject;
    panelsWithUDAs =
        renderPanelsToUDAs(panelsWithUDAs, genericObject.udasValues);

    if (mode == FormModes.viewMode || hasModifyPrivilage == false)
      panelsWithUDAs.forEach((panel) {
        panel.udas.forEach((uda) {
          uda.isReadOnly = true;
          uda.isNormal = false;
        });
      });
    this.panelsWithUDAs = panelsWithUDAs;
    isPanelsWithUDAsLoaded = true;

    await checkUDAsLocation();

    view.updateGenericObjectView();
  }

  @override
  void onLoadingRulesError(error) {
    // TODO: implement onLoadingRulesError
    onLoadingScreenDataError(error);
  }

  @override
  void onLoadSavedGenericObjectResponseComplete(
      GenericObject savedGenericObject) {
    if (mode == FormModes.viewMode || hasModifyPrivilage == false)
      savedGenericObject.udasValues.forEach((uda) => {
            uda.isReadOnly = true,
            uda.isNormal = false,
          });
    genericObject = savedGenericObject;
    genericObject.type ??= type;
    //This object is used in conditional validations on generic object
    mainGenericObject = savedGenericObject;

    loadPanelsAndUDAs(type?.recId ?? typeID ?? genericObject.typeId, false,
        savedGenericObject.udasValues);
  }

  @override
  void onLoadSavedGenericObjectResponseError(ErrorResponse error) {
    // TODO: implement onLoadSavedGenericObjectResponseError
    onLoadingScreenDataError(error);
  }

  @override
  void onSavingGenericObjectResponseComplete(GenericObject object) {}

  @override
  void onSavingGenericObjectResponseError(ErrorResponse error) {}

  onLoadingScreenDataError(error) {
    isPanelsWithUDAsLoadFailed = true;
    panelsWithUDAs = [];
    onLoadingError(error);
    view.updateGenericObjectView();
  }

  onLoadingError(error) {
    if (error.code == CODE_EXPIRED_TOKEN)
      ShowExpiredTokenAlert(error.message, context);
    else
      ShowAlertMessage(error.message, context);
  }
}
