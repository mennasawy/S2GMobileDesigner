import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridCols.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MultipleLevel/MultipleLevelRowData.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MultipleLevel/getMultiLevelResponse.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MultipleLevel/multiLevelResponseLevelModel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/ErrorResponse/error_data.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/MultiLevelUDA/AddEditMultiLevelPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/MultiLevelUDA/AddMultiLevelScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/MultiLevelUDA/MultiLevelItem.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/MultiLevelUDA/MultiLevelScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/MultiLevelUDA/multilevelTable.dart';
import 'package:templets/Utilities/const.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/dependency_injection.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/MultiLevelUDA/MultiLevelUDAViewInterface/IGetMultiLevelsView.dart';
import 'package:flutter/material.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/MultiLevelUDA/Temp2AddMultiLevelScreen.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/MultiLevelUDA/Temp2MultiLevelItem.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/MultiLevelUDA/Temp2MultiLevelScreen.dart';
import 'IGetMyltiLevelsPresenter.dart';

abstract class UDAObjectContract {
  void onLoadUDAObjectComplete(UDAsWithValues uda);
  void onLoadUDAObjectError(error);
}

abstract class MultiLevelContract {
  void onloadLevelsComplete(MultiLevelResponse multiLevelResponse);
  void onloadLevelsError(ErrorResponse errorResponse);

  void onloadFirstLevelComplete(List<LevelDataModel> multiLevelResponse);
  void onloadFirstLevelError(ErrorResponse errorResponse);

  void onloadLevelByIdComplete(List<LevelDataModel> multiLevelResponse);
  void onloadLevelByIdError(ErrorResponse errorResponse);

  void onAddEditRecComplete(String response);
  void onAddEditRecError(ErrorResponse errorResponse);
}

class MultiLevelPresenter
    implements
        IGETMultiLevelDataPresenter,
        UDAObjectContract,
        MultiLevelContract {
  // initialize view interface here
  IGetMultiLevelView igetMultiLevelDataView;
  BuildContext context;
  UDAsRepository _udasRepository;
  IMultiLevelGetRepository iMultiLevelGetRepository;

  //##########UI Related Parameters##########
  int multipleLevelRepositoryID;
  bool isMultiLevelDataLoaded = false;
  bool isUDAObjectLoaded = false;
  List<List<GridCols>> gridRowListItems = [];
  List<MultipleLevelRowData> multiLevelRowData = [];
  List<String> levelsCaptions = [];

  final bool isVisible;
  final bool isLocation = false;

  final int objectRecId;
  final int repositoryID;

  final String gridName;
  final String udaDescription;
  final String validationMessage;
  final bool isValidationMSGWarning;
  final String labelColor;
  final FormModes formMode;
  final UDAsWithValues multiLevelUDA;

  final MultiLevelVisibility gridValidation;
  final List<MultipleLevelRowData> rowListItems;
  final Function(List<MultipleLevelRowData>) onAddRows;

  final bool isReadOnly;
  final bool isMandatory;

  MultiLevelPresenter({
    this.isVisible,
    this.objectRecId,
    this.repositoryID,
    this.gridName,
    this.udaDescription,
    this.validationMessage,
    this.isValidationMSGWarning,
    this.labelColor,
    this.formMode,
    this.multiLevelUDA,
    this.gridValidation,
    this.rowListItems,
    this.onAddRows,
    this.isReadOnly,
    this.isMandatory,
    this.context,
    this.igetMultiLevelDataView,
  }) {
    /* initialize view Interface in presenter constructor here */
    _udasRepository = new Injector().udasToRepository;
    iMultiLevelGetRepository = new Injector().getMultLevelRepository;
  }

  //##########UI Related Methods##########
  initializeItems() {
    (rowListItems != null)
        ? rowListItems.forEach((row) => {gridRowListItems.add(row.columnsList)})
        : gridRowListItems = [];
    multiLevelRowData = rowListItems;
    // if( formMode == FormModes.newMode) isMultiLevelDataLoaded = true;
  }

  checkLoadingUDAObject() {
    if (isUDAObjectLoaded == false) loadUDAObject(multiLevelUDA.recId);
  }

  bool isListEmpty(List list) {
    if (list == null || list.isEmpty) return true;
    return false;
  }

  onAddNewRecordTapped() {
    if (gridValidation != MultiLevelVisibility.editOnly) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => AddMultiLevelScreen(
                    repositoryID: multipleLevelRepositoryID,
                    multiLevelUDA: multiLevelUDA,
                    mode: AddMultiLevelMode.newMode,
                    formMode: formMode,
                    objectRecId: objectRecId,
                    multiLevelRecID: multiLevelUDA.recId,
                  ))).then((value) async {
        if (value != null) await refreshRowsList(value);
      });
    }
  }

  navigateToAllRowsScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => MultiLevelScreen(
                  multiLevelRowsValues: gridRowListItems,
                  multiLevelUDA: multiLevelUDA,
                  rowListItems: rowListItems,
                  objectRecId: objectRecId,
                  formMode: formMode,
                  onAddRows: onAddRows,
                  onEditRefresh: refreshRowsList,
                  repositoryID: multipleLevelRepositoryID,
                  // gridValidation:  gridValidation,
                  isReadOnly: isReadOnly,
                  isMandatory: isMandatory,
                ))).then((value) async {
      refreshList();
    });
  }

  temp2OnAddNewRecordTapped() {
    if (gridValidation != MultiLevelVisibility.editOnly) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Temp2AddMultiLevelScreen(
                    repositoryID: multipleLevelRepositoryID,
                    multiLevelUDA: multiLevelUDA,
                    mode: AddMultiLevelMode.newMode,
                    formMode: formMode,
                    objectRecId: objectRecId,
                    multiLevelRecID: multiLevelUDA.recId,
                  ))).then((value) async {
        if (value != null) await refreshRowsList(value);
      });
    }
  }

  temp2NavigateToAllRowsScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => Temp2MultiLevelScreen(
                  multiLevelRowsValues: gridRowListItems,
                  multiLevelUDA: multiLevelUDA,
                  rowListItems: rowListItems,
                  objectRecId: objectRecId,
                  formMode: formMode,
                  onAddRows: onAddRows,
                  onEditRefresh: refreshRowsList,
                  repositoryID: multipleLevelRepositoryID,
                  // gridValidation:  gridValidation,
                  isReadOnly: isReadOnly,
                  isMandatory: isMandatory,
                ))).then((value) async {
      refreshList();
    });
  }

  Widget temp2GetGridRowItem(int rowIndex) {
    return Temp2MultiLevelItem(
      dataSource: gridRowListItems[rowIndex],
      multiLevelUDA: multiLevelUDA,
      multiLevelRowData: multiLevelRowData[rowIndex],
      multiLevelRowIndex: rowIndex,
      objectRecId: objectRecId,
      onEditRefresh: refreshRowsList,
      formMode: formMode,
      fullList: false,
      repositoryID: multipleLevelRepositoryID,
      // gridValidation:  gridValidation,
      ondelete: refreshRowsListonDelete,
      isReadOnly: isReadOnly,
      isMandatory: isMandatory,
    );
  }

  Future<void> refreshRowsList(rowList) async {
    if (rowList.gridRowDataMode == AddMultiLevelMode.newMode) {
      gridRowListItems.add(rowList.columnsList);
      multiLevelRowData.add(rowList);
      onAddRows(multiLevelRowData);
    } else {
      gridRowListItems[rowList.rowIndex] = rowList.columnsList;
      multiLevelRowData[rowList.rowIndex] = rowList;
      onAddRows(multiLevelRowData);
    }
    igetMultiLevelDataView.updateMultiLevelView();
  }

  Future<Null> refreshList() async {
    isMultiLevelDataLoaded = false;
    await Future.delayed(Duration(seconds: 0));
    getLevels(context, multipleLevelRepositoryID.toString());
    igetMultiLevelDataView.updateMultiLevelView();
    return null;
  }

  Widget getGridRowItem(int rowIndex) {
    return MultiLevelItem(
      dataSource: gridRowListItems[rowIndex],
      multiLevelUDA: multiLevelUDA,
      multiLevelRowData: multiLevelRowData[rowIndex],
      multiLevelRowIndex: rowIndex,
      objectRecId: objectRecId,
      onEditRefresh: refreshRowsList,
      formMode: formMode,
      fullList: false,
      repositoryID: multipleLevelRepositoryID,
      // gridValidation:  gridValidation,
      ondelete: refreshRowsListonDelete,
      isReadOnly: isReadOnly,
      isMandatory: isMandatory,
    );
  }

  Future<void> refreshRowsListonDelete(int index) async {
    log(LogType.ERROR, '############ inside refresh Rows List on Delete');
    await Future.delayed(Duration(seconds: 0));
    gridRowListItems.removeAt(index);
    multiLevelRowData.removeAt(index);
    igetMultiLevelDataView.updateMultiLevelView();
  }

  onLoadingLevelsSuccessfully(MultiLevelResponse multiLevelResponse) {
    levelsCaptions = !isEmptyText(multiLevelResponse.tiresNames)
        ? multiLevelResponse.tiresNames.split(",")
        : [];
    if (isListEmpty(levelsCaptions)) {
      for (int i = 0; i < multiLevelResponse.numberOfLevels; i++) {
        levelsCaptions.add("Tier " + (i + 1).toString());
      }
    }

    gridRowListItems.forEach((gridRow) {
      for (var i = 0; i < gridRow.length; i++) {
        gridRow[i].caption = levelsCaptions[i];
      }
    });
    isMultiLevelDataLoaded = true;
    igetMultiLevelDataView.updateMultiLevelView();

    levelsCaptions.forEach((caption) {
      gridRowListItems.forEach((row) {
        if (!listContainsColumn(caption, row)) {
          row.add(GridCols(caption: caption));
        }
      });
    });
  }

  onLoadingLevelsForAddNewRec() {}

  bool listContainsColumn(String columCaption, List<GridCols> list) {
    bool containsItem = false;
    list.forEach((listItem) {
      if (listItem.caption == columCaption) containsItem = true;
    });
    return containsItem;
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

  void loadUDAObject(int udaID) {
    _udasRepository
        .getUDAObject(context, udaID)
        .then((uda) => this.onLoadUDAObjectComplete(uda))
        .catchError((onError) => this.onLoadUDAObjectError(onError));
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
  void onLoadUDAObjectComplete(UDAsWithValues uda) {
    multipleLevelRepositoryID = uda.multipleLevelRepository.recId;
    isUDAObjectLoaded = true;
    igetMultiLevelDataView.updateMultiLevelView();
    if (formMode != FormModes.newMode)
      getLevels(context, multipleLevelRepositoryID.toString());
    else
      isMultiLevelDataLoaded = true;
    igetMultiLevelDataView.updateMultiLevelView();
    //view.updateUDAWithRepoData()
  }

  @override
  void onLoadUDAObjectError(error) {
    // TODO: implement onLoadUDAObjectError
  }

  @override
  void onAddEditRecComplete(String response) {
    // TODO: implement onAddEditRecComplete
  }

  @override
  void onAddEditRecError(ErrorResponse errorResponse) {
    // TODO: implement onAddEditRecError
  }

  @override
  void onloadFirstLevelComplete(List<LevelDataModel> multiLevelResponse) {
    // TODO: implement onloadFirstLevelComplete
  }

  @override
  void onloadFirstLevelError(ErrorResponse errorResponse) {
    // TODO: implement onloadFirstLevelError
  }

  @override
  void onloadLevelByIdComplete(List<LevelDataModel> multiLevelResponse) {
    // TODO: implement onloadLevelByIdComplete
  }

  @override
  void onloadLevelByIdError(ErrorResponse errorResponse) {
    // TODO: implement onloadLevelByIdError
  }

  @override
  void onloadLevelsComplete(MultiLevelResponse multiLevelResponse) {
    // TODO: implement onloadLevelsComplete
    onLoadingLevelsSuccessfully(multiLevelResponse);
    igetMultiLevelDataView.updateMultiLevelView();
  }

  @override
  void onloadLevelsError(ErrorResponse errorResponse) {
    // TODO: implement onloadLevelsError
  }
}
