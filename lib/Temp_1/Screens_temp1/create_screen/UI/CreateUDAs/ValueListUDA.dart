import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/ValueList/RepositoryUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/ValueList/ValueList.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/DynamicValueListPresenter.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:flutter/material.dart';
import 'package:templets/dropdownfield.dart';

class ValueListUDA extends StatefulWidget {
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
  final Function(List<UDAsWithValues>) onApplyingValueListRule;

  final bool isVisible;
  bool isReadOnly = false;
  bool isMandatory = false;
  bool isLocation = false;

  //Used as UDAsWithValues if UDA inside form && as GridCols if column inside grid
  final uda;
  final QueryInfo queryInfo;
  final GenericObject genericObject;
  final List<dynamic> valueListUDAsList;
  TextEditingController controller = TextEditingController();

  ValueListUDA({
    Key key,
    this.title,
    this.initialValue,
    this.validationMessage,
    this.isValidationMSGWarning,
    this.valueListConditionDB,
    this.udaDescription,
    this.staticValues,
    this.valListType,
    this.isLocation,
    this.onValueChange,
    this.labelColor,
    this.isVisible,
    this.isReadOnly,
    this.isMandatory,
    this.uda,
    this.queryInfo,
    this.valueListUDAsList,
    this.onDependentValueChange,
    this.onApplyingValueListRule,
    this.controller,
    this.genericObject,
  }) : super(key: key);

  @override
  _ValueListUDAState createState() => _ValueListUDAState();
}

class _ValueListUDAState extends State<ValueListUDA>
    implements ValueListViewContract {
  DynamicValueListPresenter valueListPresenter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePresenter();
  }

  @override
  void didUpdateWidget(ValueListUDA oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    valueListPresenter.updateValuesForFilter();
  }

  @override
  Widget build(BuildContext context) {
    valueListPresenter.checkValueListValuesLoading();
    return drawWidgetOrEmptyContainer(
      widget.isVisible == true && widget.isLocation != true,
      getUDAWithTitleWidget(
          context,
          getValueListWidget(),
          widget.title,
          widget.udaDescription,
          widget.validationMessage,
          widget.isValidationMSGWarning,
          widget.isMandatory,
          hexToColor(widget.labelColor)),
    );
  }

  DropDownField getValueListWidget() {
    return DropDownField(
      key: widget.key,
      context: context,
      hintText: "Choose " + widget.title,
      items: valueListPresenter.values,
      required: false,
      strict: false,
      controller: widget.controller,
      enabled: (widget.isReadOnly != null) ? !widget.isReadOnly : true,
      onValueChanged: valueListPresenter.onValueListValueChange,
    );
  }

  initializePresenter() {
    valueListPresenter = DynamicValueListPresenter(
      context: context,
      valListView: this,
      title: widget.title,
      initialValue: widget.initialValue,
      udaDescription: widget.udaDescription,
      validationMessage: widget.validationMessage,
      isValidationMSGWarning: widget.isValidationMSGWarning,
      valueListConditionDB: widget.valueListConditionDB,
      labelColor: widget.labelColor,
      staticValues: widget.staticValues,
      onValueChange: widget.onValueChange,
      onDependentValueChange: widget.onDependentValueChange,
      onApplyingValueListRules: widget.onApplyingValueListRule,
      uda: widget.uda,
      queryInfo: widget.queryInfo,
      valueListUDAsList: widget.valueListUDAsList,
      valListType: widget.valListType,
      genericObject: widget.genericObject,
    );
  }

  @override
  updateValueListUDAView() {
    setState(() {});
  }

  @override
  setFilteredValueListValues(List<ValueList> valueList) {
    // TODO: implement setFilteredValueListValues
    return null;
  }
}
