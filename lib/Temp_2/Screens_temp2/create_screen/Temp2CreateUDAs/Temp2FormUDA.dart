import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Form/FormListMapping.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridCols.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/FormUDAPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Utilities/Temp2UtilMethods.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/Temp2WidgetsWithBorder.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/dropdownfield.dart';

class Temp2FormUDA extends StatefulWidget {
  final String title;
  final String labelColor;
  final dynamic initialValue;
  final String udaDescription;
  final String validationMessage;
  final bool isValidationMSGWarning;

  final FormModes fomMode;
  final GenericObject genericObject;
  final Function(dynamic) onValueChange;
  final Function(List<GridCols>) setGridMappedColumns;

  final bool isVisible;
  final bool isReadOnly;
  final bool isMandatory;
  bool isLocation = false;
  final dynamic uda;
  final List<GridCols> columns;
  final List<FormUDAOptions> udaOptions;

  //For grid columns
  final int gridID;
  final int formTypeId;
  final int formListUdaId;
  final String gridUDAName;
  final String selectedFieldsNames;
  final List<FormListMappingDTO> formListMappingDTOList;

  Temp2FormUDA({
    Key key,
    this.title,
    this.labelColor,
    this.initialValue,
    this.udaDescription,
    this.validationMessage,
    this.isValidationMSGWarning,
    this.fomMode,
    this.genericObject,
    this.onValueChange,
    this.setGridMappedColumns,
    this.isVisible,
    this.isReadOnly,
    this.isMandatory,
    this.uda,
    this.columns,
    this.udaOptions,
    this.formTypeId,
    this.formListUdaId,
    this.selectedFieldsNames,
    this.formListMappingDTOList,
    this.isLocation,
    this.gridID,
    this.gridUDAName,
  }) : super(key: key);

  @override
  _Temp2FormUDAState createState() => _Temp2FormUDAState();
}

class _Temp2FormUDAState extends State<Temp2FormUDA>
    implements FormUDAViewContract {
  FormUDAPresenter formUDAPresenter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePresenter();
    formUDAPresenter.initializeItems();
  }

  @override
  Widget build(BuildContext context) {
    formUDAPresenter.checkLoadingFormUDAValues();
    return drawWidgetOrEmptyContainer(
      widget.isVisible == true && widget.isLocation != true,
      getUDAWithTitleWidget(
          context,
          getFormUDAWidget(),
          "",
          widget.udaDescription,
          widget.validationMessage,
          widget.isValidationMSGWarning,
          widget.isMandatory,
          hexToColor(widget.labelColor)),
    );
  }

  initializePresenter() {
    formUDAPresenter = FormUDAPresenter(
      formUDAView: this,
      context: context,
      isReadOnly: widget.isReadOnly,
      gridID: widget.gridID,
      formTypeId: widget.formTypeId,
      formListUdaId: widget.formListUdaId,
      selectedFieldsNames: widget.selectedFieldsNames,
      genericObject: widget.genericObject,
      uda: widget.uda,
      columns: widget.columns,
      udaOptions: widget.udaOptions,
      gridUDAName: widget.gridUDAName,
      onValueChange: widget.onValueChange,
      formListMappingDTOList: widget.formListMappingDTOList,
      setGridMappedColumns: widget.setGridMappedColumns,
      title: widget.title,
    );
  }

  Row getFormUDAWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //Form List Widget
        Expanded(
          flex: 8,
          child: Temp2WidgetBorder(
            isMandatoryUDA: widget.isMandatory,
            title: widget.title,
            child: DropDownField(
              key: widget.key,
              context: context,
              hintText: "Choose " + widget.title,
              items: formUDAPresenter.values,
              required: false,
              strict: false,
              controller: formUDAPresenter.controller,
              enabled: (widget.isReadOnly != null) ? !widget.isReadOnly : true,
              onValueChanged: null,
              dropDownInputDecoration: temp2InputDecoration(context,
                  "Choose " + widget.title, IC_DROPDOWN, DARK_GREY, null),
            ),
          ),
        ),
        //Options button widget
        drawWidgetOrEmptyContainer(
            isNotEmptyList(widget.udaOptions), getOptionsButtonWidget()),
      ],
    );
  }

  Expanded getOptionsButtonWidget() {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTapUp: formUDAPresenter.onOptionsIconTapped,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Icon(Icons.settings, color: DARK_GREY, size: 30),
        ),
      ),
    );
  }

  @override
  updateFormUDAWidgetView() {
    setState(() {});
  }
}
