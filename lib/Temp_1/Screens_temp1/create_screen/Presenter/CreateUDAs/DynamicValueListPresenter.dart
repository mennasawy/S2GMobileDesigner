import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Invokers.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/ValueList/RepositoryUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/ValueList/ValueList.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/createFunctions.dart';
import 'package:templets/Utilities/api_constant.dart';
import 'package:templets/Utilities/const.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/dependency_injection.dart';
import 'package:flutter/material.dart';

enum ValueListType {
  staticValList,
  dynamicValList,
  dictionaryValList,
}

abstract class DynamicValueListContract {
  void onLoadValueListComplete(List<ValueList> valueList, valueListUDA);
  void onLoadValueListError(error);

  void onLoadFilteredValueListComplete(List<ValueList> valueList, valueListUDA);
  void onLoadFilteredValueListError();

  void onRuleLoadGenericObjectComplete(GenericObject genericObject);
  void onRuleLoadGenericObjectError(error);
}

abstract class ValueListViewContract {
  updateValueListUDAView();
  setFilteredValueListValues(List<ValueList> valueList);
}

class DynamicValueListPresenter implements DynamicValueListContract {
  InvokersRepository _invokerUDARepository;
  DynamicValueListRepository _dynamicValueListRepository;
  DictionaryValueListRepository _dictionaryValueListRepository;
  ValueListViewContract valListView;
  BuildContext context;

  //##########View related parameters//##########
  final String title;
  final String initialValue;
  final String udaDescription;
  final String validationMessage;
  final bool isValidationMSGWarning;
  final String valueListConditionDB;
  final String labelColor;
  final List<String> staticValues;
  final ValueListType valListType;
  final Function(String) onValueChange;
  final Function(List<UDAsWithValues>) onDependentValueChange;
  final Function(List<UDAsWithValues>) onApplyingValueListRules;

  //Used as UDAsWithValues if UDA inside form && as GridCols if column inside grid
  final uda;
  final QueryInfo queryInfo;
  final GenericObject genericObject;
  final List<dynamic> valueListUDAsList;
  TextEditingController controller = TextEditingController();

  DynamicValueListPresenter valueListPresenter;

  String selectedItem;

  List<String> values = [];

  List<UDAsWithValues> dependentValueLists = [];

  bool isValuesLoaded = false;

  DynamicValueListPresenter({
    this.title,
    this.initialValue,
    this.udaDescription,
    this.validationMessage,
    this.isValidationMSGWarning,
    this.valueListConditionDB,
    this.labelColor,
    this.staticValues,
    this.onValueChange,
    this.onDependentValueChange,
    this.onApplyingValueListRules,
    this.uda,
    this.queryInfo,
    this.valueListUDAsList,
    this.valListView,
    this.context,
    this.valListType,
    this.genericObject,
  }) {
    _invokerUDARepository = new Injector().invokerUDARepo;
    _dynamicValueListRepository = new Injector().dynamicValueListRepo;
    _dictionaryValueListRepository = new Injector().dictionaryValueListRepo;
  }

  checkValueListValuesLoading() {
    if (isValuesLoaded == false) initializeValueListItems();
  }

  initializeValueListItems() {
    switch (valListType) {
      case ValueListType.dynamicValList:
        loadDynamicValueList(queryInfo, uda, uda.recId);
        break;
      case ValueListType.dictionaryValList:
        loadDictionaryValueList(uda.columnName, uda.tableGridName, uda);
        break;
      case ValueListType.staticValList:
        values = staticValues;
        break;
      default:
    }
  }

  updateValuesForFilter() {
    if (!isEmptyText(queryInfo?.filter)) {
      loadDynamicValueList(queryInfo, uda, uda.recId);
    }
  }

  onValueListValueChange(String val) {
    log(LogType.DEBUG, "Value list value ====== $val");
    onValueChange(val);
    if (isNotEmptyList(valueListUDAsList)) checkValueListDependency();
    if (uda is UDAsWithValues) checkUDARules();
  }

  checkValueListDependency() {
    valueListUDAsList.forEach((valListUDA) {
      if (!isEmptyText(valListUDA.valueListConditionDB) &&
          valListUDA.valueListConditionDB.contains(uda.udaName)) {
        valListUDA.valueListConditionDBValue =
            replaceConditionUDAValue(valListUDA.valueListConditionDB);
        dependentValueLists.add(valListUDA);
        onDependentValueChange(dependentValueLists);
      }
    });
  }

  checkUDARules() {
    if (uda.hasRule == 1) executeRule();
  }

  void executeRule() {
    _invokerUDARepository
        .getGenericObjectOnRuleInvoker(context, genericObject, uda.recId)
        .then((c) => this.onRuleLoadGenericObjectComplete(c))
        .catchError((onError) => this.onRuleLoadGenericObjectError(onError));
  }

  //valueListUDA maybe UDA or Grid column
  void loadDynamicValueList(QueryInfo queryInfo, valueListUDA, recId) {
    _dynamicValueListRepository
        .getDynamicValueList(context, queryInfo, recId)
        .then((c) => this.onLoadValueListComplete(c, valueListUDA))
        .catchError((onError) => this.onLoadValueListError(onError));
  }

  void loadDynamicValueListWithFilter(
      QueryInfo queryInfo, valueListUDA, recId) {
    _dynamicValueListRepository
        .getDynamicValueList(context, queryInfo, recId)
        .then((c) => this.onLoadFilteredValueListComplete(c, valueListUDA))
        .catchError((onError) => this.onLoadFilteredValueListError());
  }

  void loadDictionaryValueList(
      String columnName, String tableGridName, valueListUDA) {
    _dictionaryValueListRepository
        .getDictionaryValueList(context, columnName, tableGridName)
        .then((values) => this.onLoadValueListComplete(values, valueListUDA))
        .catchError((onError) => this.onLoadValueListError(onError));
  }

  @override
  void onLoadValueListComplete(List<ValueList> valueList, valueListUDA) {
    // TODO: implement onLoadValueListComplete
    valueList.removeWhere((value) => value.name == null);
    valueListUDA.valueListValues = valueList;
    isValuesLoaded = true;
    values = valueList.map((listValue) => listValue.name).toList();
    valListView.updateValueListUDAView();
  }

  @override
  void onLoadValueListError(error) {
    isValuesLoaded = true;
    if (error.code == CODE_EXPIRED_TOKEN)
      ShowExpiredTokenAlert(
          "Error loading $title values: ${error.message}", context);
    else
      ShowAlertMessage(
          "Error loading $title values: ${error.message}", context);
  }

  @override
  void onLoadFilteredValueListComplete(
      List<ValueList> valueList, valueListUDA) {
    // TODO: implement onLoadFilteredValueListComplete
    valueList.removeWhere((value) => value.name == null);
    valueListUDA.valueListValues = valueList;
    valListView.setFilteredValueListValues(valueList);
  }

  @override
  void onLoadFilteredValueListError() {
    // TODO: implement onLoadFilteredValueListError
  }

  @override
  void onRuleLoadGenericObjectComplete(GenericObject genericObject) {
    onApplyingValueListRules(genericObject.udasValues);
  }

  @override
  void onRuleLoadGenericObjectError(error) {
    // TODO: implement onRuleLoadGenericObjectError
  }
}
