import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridCols.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MultipleLevel/MultipleLevelRowData.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MultipleLevel/getMultiLevelResponse.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MultipleLevel/multiLevelResponseLevelModel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/ErrorResponse/error_data.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/MultiLevelUDA/multiLevelPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/MultiLevelUDA/AddMultiLevelScreen.dart';
import 'package:templets/Utilities/api_constant.dart';
import 'package:templets/Utilities/const.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/dependency_injection.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/MultiLevelUDA/MultiLevelUDAViewInterface/IGetMultiLevelsView.dart';
import 'package:flutter/material.dart';
import 'IGetMyltiLevelsPresenter.dart';

enum AddMultiLevelMode {
  newMode,
  editMode,
}

class AddEditMultiLevelPresenter
    implements IGETMultiLevelDataPresenter, MultiLevelContract {
  // initialize view interface here
  IGetMultiLevelView igetMultiLevelDataView;
  BuildContext context;
  IMultiLevelGetRepository iMultiLevelGetRepository;

  //##########UI Related Parameters##########
  final int repositoryID;
  final AddMultiLevelMode mode;
  final int multiLevelRecID;
  final UDAsWithValues multiLevelUDA;
  final int editRowIndex;
  final int objectRecId;
  final FormModes formMode;
  final List<GridCols> rowListItems;

  List<String> firstLevelDataModel = [];

  MultipleLevelRowData multipleLevelRowData;

  List<String> tireNameAddress = [];

  List<String> tireNameValue = [];

  List<bool> visibleList = [];

  List<List<String>> dropDownData = [[]];
  List<GridCols> columnsList = [];
  List<String> listAddress;
  bool listSelected = false;
  bool areLevelsLoaded = false;
  bool areLevelsDataLoaded = false;
  bool isEditingRecord = false;
  bool isMonitorDataLoaded = false;
  List<List<LevelMultiLevel>> level = [[]];
  List<String> levelsSelectedValue = [];
  var firstLevelResponse;
  List<List<String>> levelDataId = [[]];
  int counter = 0;
  MultiLevelResponse listCount_tiresName = MultiLevelResponse();
  String selectedLevelValue;
  int noOfMonitorLevels;

  AddEditMultiLevelPresenter({
    this.repositoryID,
    this.mode,
    this.multiLevelRecID,
    this.multiLevelUDA,
    this.editRowIndex,
    this.objectRecId,
    this.formMode,
    this.rowListItems,
    this.context,
    this.igetMultiLevelDataView,
  }) {
    /* initialize view Interface in presenter constructor here */
    iMultiLevelGetRepository = new Injector().getMultLevelRepository;
  }

  //##########UI Related Methods##########
  initializeItems() {
    noOfMonitorLevels = 0;
    isNotEmptyList(rowListItems)
        ? rowListItems.forEach((rowLevel) =>
            {if (!isEmptyText(rowLevel.value)) noOfMonitorLevels++})
        : noOfMonitorLevels = noOfMonitorLevels;

    levelsSelectedValue = [];
    if (mode == AddMultiLevelMode.editMode) {
      columnsList = rowListItems;
    }
  }

  checkLoadingLevels() {
    if (!areLevelsLoaded) getLevels(context, repositoryID.toString());
  }

  bool hasValidDataToShow() {
    return areLevelsLoaded && areLevelsDataLoaded;
  }

  onSubmitButtonClicked() {
    if (!isEditingRecord) {
      setTireData();
      if (formMode == FormModes.editMode) {
        editMultilevelRec(
            context, multipleLevelRowData, multiLevelUDA.udaTableName);
        isEditingRecord = true;
        igetMultiLevelDataView.updateMultiLevelView();
      } else
        Navigator.of(context).pop(multipleLevelRowData);
    }
  }

  setTireData() {
    multipleLevelRowData = MultipleLevelRowData(
      columnsList: columnsList,
      gridRowDataMode: mode,
      recID: (mode == AddMultiLevelMode.newMode) ? -1 : multiLevelRecID,
      udaID: multiLevelUDA.recId,
      rowIndex: editRowIndex,
      objectID: objectRecId,
      repositoryID: repositoryID,
    );
  }

  String levelValueAtIndex(int index) {
    return (index < levelsSelectedValue.length)
        ? !isEmptyText(levelsSelectedValue[index])
            ? levelsSelectedValue[index]
            : ""
        : "";
  }

  onLevelValueChanged(String value, int index) {
    if (value != tireNameValue[index]) {
      levelsSelectedValue[index] = value;
      if (index < counter) {
        int iterationNum = counter - index;
        for (int i = 0; i < iterationNum; i++) {
          int count = index + i;
          count++;
          levelsSelectedValue[count] = '';
          visibleList[count] = false;
          level[count] = [];
        }
        counter = index;
        for (int i = 0; i < level[index].length; i++) {
          if (value == level[index][i].tireName || isEmptyText(value)) {
            tireNameValue[index] = value;
            levelsSelectedValue[index] = value;
            selectedLevelValue = value;
            log(LogType.ERROR, "Tier Name Values $tireNameValue");
            if (!isEmptyText(value))
              getLevelById(
                  context, repositoryID.toString(), level[index][i].id);
          }
        }
      } else {
        for (int i = 0; i < level[index].length; i++) {
          if (value == level[index][i].tireName || isEmptyText(value)) {
            tireNameValue[index] = value;
            levelsSelectedValue[index] = value;
            selectedLevelValue = value;
            log(LogType.ERROR, "Tier Name Values $tireNameValue");
            if (!isEmptyText(value))
              getLevelById(
                  context, repositoryID.toString(), level[index][i].id);
          }
        }
      }
      for (int i = index; i < listCount_tiresName.numberOfLevels; i++) {
        if (isEmptyText(value)) {
          levelsSelectedValue[i] = "";
          tireNameValue[i] = "";
        }
        columnsList[i].value = tireNameValue[i];
      }
    }
    igetMultiLevelDataView.updateMultiLevelView();
  }

  List<String> getnameList(List<LevelMultiLevel> list) {
    List<String> names = [];
    for (int i = 0; i < list.length; i++) {
      names.add(list.elementAt(i).tireName);
    }
    return names;
  }

  setLevelValue(int index, String item) {
    levelsSelectedValue[index] = item;
  }

  onLoadingFirstLevelSuccessfully(List<LevelDataModel> multiLevelResponse) {
    for (int i = 0; i < multiLevelResponse.length; i++) {
      log(LogType.ERROR,
          multiLevelResponse[i].tireName + "######11111111" + 'rowsItem =====');
      log(LogType.ERROR, rowListItems);
      level[0].add(LevelMultiLevel(multiLevelResponse[i].tireName,
          multiLevelResponse[i].recid.toString()));
      log(LogType.ERROR, dropDownData);
    }
    visibleList[0] = true;
    areLevelsLoaded = true;
    if (mode == AddMultiLevelMode.editMode) {
      levelsSelectedValue.add(rowListItems[0].value);
      if (noOfMonitorLevels >= 1)
        getLevelById(context, repositoryID.toString(), "1");
    } else
      levelsSelectedValue.add("");
    if (mode == AddMultiLevelMode.newMode) {
      areLevelsDataLoaded = true;
    }
  }

  onLoadingLevelByIDSuccessfully(List<LevelDataModel> multiLevelResponse) {
    if (counter < level.length) {
      log(LogType.ERROR, "#########level22222222222222222");
      log(LogType.ERROR,
          'counter $counter  no of levels===== $noOfMonitorLevels');
      if (mode == AddMultiLevelMode.editMode) {
        levelsSelectedValue.add(rowListItems[counter + 1].value);
        if (counter + 1 < noOfMonitorLevels - 1) {
          getLevelById(
              context, repositoryID.toString(), (counter + 2).toString());
        } else
          areLevelsDataLoaded = true;
      } else {
        levelsSelectedValue.add("");
        selectedLevelValue = "";
      }
      if (counter < listCount_tiresName.numberOfLevels - 1) counter++;
      visibleList[counter] = true;
      for (int i = 0; i < multiLevelResponse.length; i++) {
        dropDownData[i].add(multiLevelResponse[i].tireName);
        level[counter].add(LevelMultiLevel(multiLevelResponse[i].tireName,
            multiLevelResponse[i].recid.toString()));
      }
    }
  }

  onLoadingLevelsSuccessfully(MultiLevelResponse multiLevelResponse) {
    listCount_tiresName = multiLevelResponse;
    getFirstLevel(context, repositoryID.toString());
    listAddress = !isEmptyText(listCount_tiresName.tiresNames)
        ? listCount_tiresName.tiresNames.split(',')
        : [];
    for (int i = 0; i < multiLevelResponse.numberOfLevels; i++) {
      visibleList.add(false);
      level.add([]);
      tireNameValue.add("");
      log(LogType.ERROR, dropDownData);
      if (!isNotEmptyList(listAddress) ||
          listAddress.length < multiLevelResponse.numberOfLevels)
        listAddress.add("Tier " + (i + 1).toString());
    }

    if (mode == AddMultiLevelMode.newMode) {
      listAddress.forEach((element) {
        columnsList.add(GridCols(caption: element));
      });
    } else {
      for (var i = 0; i < tireNameValue.length; i++) {
        tireNameValue[i] = rowListItems[i].value;
      }
    }
  }

  onLoadingLevelsError(ErrorResponse errorResponse) {
    areLevelsLoaded = true;
    areLevelsDataLoaded = true;
    if (errorResponse.code == CODE_EXPIRED_TOKEN)
      ShowExpiredTokenAlert(errorResponse.message, context);
  }

  void _loadLevels(BuildContext context, String repoId) {
    iMultiLevelGetRepository
        .getLevels(context, repoId)
        .then((c) => this.onloadLevelsComplete(c))
        .catchError((onError) => this.onloadLevelsError(onError is FlutterError
            ? ErrorResponse(message: onError.message)
            : onError is AssertionError
                ? ErrorResponse(message: onError.message)
                : onError));
  }

  void _loadFirstLevels(BuildContext context, String repoId) {
    iMultiLevelGetRepository
        .getFirstLevel(context, repoId)
        .then((c) => this.onloadFirstLevelComplete(c))
        .catchError(
            (onError) => this.onloadFirstLevelError(onError is FlutterError
                ? ErrorResponse(message: onError.message)
                : onError is AssertionError
                    ? ErrorResponse(message: onError.message)
                    : onError));
  }

  void _loadLevelById(BuildContext context, String repoId, String id) {
    iMultiLevelGetRepository
        .getLevelById(context, repoId, id)
        .then((c) => this.onloadLevelByIdComplete(c))
        .catchError(
            (onError) => this.onloadLevelByIdError(onError is FlutterError
                ? ErrorResponse(message: onError.message)
                : onError is AssertionError
                    ? ErrorResponse(message: onError.message)
                    : onError));
  }

  void _addEditmultilevelRec(BuildContext context,
      MultipleLevelRowData multiLevelAddEditRequest, String udaName) {
    iMultiLevelGetRepository
        .addEditMultiLevelRec(context, multiLevelAddEditRequest, udaName)
        .then((c) => this.onAddEditRecComplete(c))
        .catchError((onError) => this.onAddEditRecError(onError is FlutterError
            ? ErrorResponse(message: onError.message)
            : onError is AssertionError
                ? ErrorResponse(message: onError.message)
                : onError));
  }

  @override
  void getLevels(BuildContext context, String repoId) {
    _loadLevels(context, repoId);
  }

  @override
  void getFirstLevel(BuildContext context, String repoId) {
    _loadFirstLevels(context, repoId);
  }

  @override
  void getLevelById(BuildContext context, String repoId, String id) {
    _loadLevelById(context, repoId, id);
  }

  @override
  void addMultilevelRec(BuildContext context,
      MultipleLevelRowData multiLevelAddEditRequest, String udaName) {
    _addEditmultilevelRec(context, multiLevelAddEditRequest, udaName);
  }

  @override
  void editMultilevelRec(BuildContext context,
      MultipleLevelRowData multiLevelAddEditRequest, String udaName) {
    _addEditmultilevelRec(context, multiLevelAddEditRequest, udaName);
  }

  @override
  void onAddEditRecComplete(String response) {
    Navigator.of(context).pop(multipleLevelRowData);
  }

  @override
  void onAddEditRecError(ErrorResponse errorResponse) {
    isEditingRecord = false;
    igetMultiLevelDataView.updateMultiLevelView();
    if (errorResponse.code == CODE_EXPIRED_TOKEN)
      ShowExpiredTokenAlert(errorResponse.message, context);
    else
      ShowAlertMessage(errorResponse.message, context);
  }

  @override
  void onloadFirstLevelComplete(List<LevelDataModel> multiLevelResponse) {
    onLoadingFirstLevelSuccessfully(multiLevelResponse);
    igetMultiLevelDataView.updateMultiLevelView();
  }

  @override
  void onloadFirstLevelError(ErrorResponse errorResponse) {
    onLoadingLevelsError(errorResponse);
    igetMultiLevelDataView.updateMultiLevelView();
  }

  @override
  void onloadLevelByIdComplete(List<LevelDataModel> multiLevelResponse) {
    onLoadingLevelByIDSuccessfully(multiLevelResponse);
    igetMultiLevelDataView.updateMultiLevelView();
  }

  @override
  void onloadLevelByIdError(ErrorResponse errorResponse) {
    if (errorResponse.code == CODE_EXPIRED_TOKEN)
      ShowExpiredTokenAlert(errorResponse.message, context);
  }

  @override
  void onloadLevelsComplete(MultiLevelResponse multiLevelResponse) {
    onLoadingLevelsSuccessfully(multiLevelResponse);
    // igetMultiLevelDataView.updateMultiLevelView();
  }

  @override
  void onloadLevelsError(ErrorResponse errorResponse) {
    onLoadingLevelsError(errorResponse);
    igetMultiLevelDataView.updateMultiLevelView();
  }
}
