import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Form/FormListMapping.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridCols.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/FormUDAPresenter.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/dropdownfield.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormUDA extends StatefulWidget {
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

  FormUDA({
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
  _FormUDAState createState() => _FormUDAState();
}

class _FormUDAState extends State<FormUDA> implements FormUDAViewContract {
  FormUDAPresenter formUDAPresenter;
  // List<String> values = [];
  // List<int> recIDs = [];
  // bool isValuesLoaded = false;
  // List<FormUDAValues> formUDAValues;
  // List<MenuItem> formOptionsItems = [];
  // TextEditingController _controller = new TextEditingController();

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
    // if (isValuesLoaded == false &&
    //     !widget.udaOptions.contains(FormUDAOptions.search)) loadFormUDAValues();
    return
        // isValuesLoaded || widget.fomMode == FormModes.newMode
        // ?
        drawWidgetOrEmptyContainer(
      widget.isVisible == true && widget.isLocation != true,
      getUDAWithTitleWidget(
          context,
          getFormUDAWidget(),
          widget.title,
          widget.udaDescription,
          widget.validationMessage,
          widget.isValidationMSGWarning,
          widget.isMandatory,
          hexToColor(widget.labelColor)),
    );
    // : LinearProgressIndicator();
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

  // initializeItems() {
  //   widget.udaOptions.forEach((option) {
  //     switch (option) {
  //       case FormUDAOptions.view:
  //         formOptionsItems.add(MenuItem(
  //             title: "View", image: Icon(Icons.remove_red_eye, color: WHITE)));
  //         break;
  //       case FormUDAOptions.search:
  //         formOptionsItems.add(MenuItem(
  //             title: "Search", image: Icon(Icons.search, color: WHITE)));
  //         break;
  //       case FormUDAOptions.modify:
  //         formOptionsItems.add(
  //             MenuItem(title: "Modify", image: Icon(Icons.edit, color: WHITE)));
  //         break;
  //       case FormUDAOptions.create:
  //         formOptionsItems.add(MenuItem(
  //             title: "Create", image: Icon(Icons.add_box, color: WHITE)));
  //         break;
  //       default:
  //     }
  //   });
  //   _controller.text = widget.uda.udaFormValueString ?? "";
  // }

  Row getFormUDAWidget() {
    // PopupMenu.context = context;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //Form List Widget
        Expanded(
          flex: 8,
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
            // (String val) {
            //   log(LogType.DEBUG,
            //       "${widget.title} form UDA string value ====== $val");
            //   int selectedValueIndex;
            //   if (!isEmptyText(val)) {
            //     selectedValueIndex = formUDAPresenter.formUDAValues
            //         .firstWhere((value) => value.objTitle == val)
            //         .recID;
            //     mapUDAsAction(selectedValueIndex);
            //   } else
            //     selectedValueIndex = null;
            //   if (widget.uda is GridCols) widget.uda.udaFormValueString = val;
            //   widget.onValueChange(selectedValueIndex != null
            //       ? selectedValueIndex.toString()
            //       : null);
            // },
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
        // (widget.isReadOnly != true)
        //     ? (TapUpDetails details) {
        //         PopupMenu menu = PopupMenu(
        //           maxColumn: widget.udaOptions.length,
        //           items: formUDAPresenter.formOptionsItems,
        //           onClickMenu: onClickMenu,
        //           context: context,
        //         );
        //         menu.show(
        //             rect: Rect.fromPoints(
        //                 details.globalPosition, details.globalPosition));
        //       }
        //     : null,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Icon(Icons.settings, color: DARK_GREY, size: 30),
        ),
      ),
    );
  }

  // void onClickMenu(MenuItemProvider item) {
  //   log(LogType.DEBUG, 'Form UDA options click menu -> ${item.menuTitle}');
  //   Navigator.push(
  //       context,
  //       CupertinoPageRoute(
  //           builder: (context) =>
  //               handleOptionSelectionNavigation(item.menuTitle))).then(
  //       (value) => {
  //             if (value != null)
  //               handleAfterNavigationAction(value, item.menuTitle)
  //           });
  // }

  // Widget handleOptionSelectionNavigation(String optionType) {
  //   FormModes mode = FormModes.newMode;
  //   switch (optionType) {
  //     case "View":
  //       if (!isEmptyText(widget.uda.udaValue)) mode = FormModes.viewMode;
  //       return getCreateGenericObjectWidget(mode);
  //     case "Create":
  //       mode = FormModes.newMode;
  //       return getCreateGenericObjectWidget(mode);
  //     case "Modify":
  //       if (!isEmptyText(widget.uda.udaValue)) mode = FormModes.editMode;
  //       return getCreateGenericObjectWidget(mode);
  //     case "Search":
  //       if (!isEmptyText(widget.uda.udaValue)) mode = FormModes.editMode;
  //       return getFilteredSearchWidget();
  //     default:
  //       return getCreateGenericObjectWidget(mode);
  //   }
  // }

  // handleAfterNavigationAction(value, String optionType) {
  //   if (optionType == "Search") {
  //     setState(() {
  //       formUDAPresenter.controller.text = value.selectedUDAsValues;
  //     });
  //     mapUDAsAction(value.selectedObjectRecID);
  //     widget.uda.udaFormValueString = value.selectedUDAsValues;
  //     widget.onValueChange(value.selectedObjectRecID != null
  //         ? value.selectedObjectRecID.toString()
  //         : null);
  //   }
  // }

  // String getFormUdaTitleWithValue() {
  //   log(LogType.DEBUG, "###### Form list value ${widget.uda.udaValue}");
  //   String value;
  //   if (formUDAPresenter.formUDAValues != null)
  //     formUDAPresenter.formUDAValues.forEach((form) {
  //       if ("${form.recID}" == widget.uda.udaValue) {
  //         value = form.objTitle;
  //       }
  //     });
  //   return value;
  // }

  // //Navigation for (View, Creata and Modify) options
  // CreateGenericObjectScreen getCreateGenericObjectWidget(FormModes mode) {
  //   return CreateGenericObjectScreen(
  //     objectId: widget.uda.object_id,
  //     savedObjectID:
  //         widget.uda.udaValue != null ? int.parse(widget.uda.udaValue) : null,
  //     mode: mode,
  //     typeID: widget.uda.formTypeId,
  //     moduleID: widget.uda.object_id.toString(),
  //   );
  // }

  // //Navigation for Search option
  // FilteredSearchAsWeb getFilteredSearchWidget() {
  //   return FilteredSearchAsWeb(
  //     objectId: widget.uda.object_id.toString(),
  //     typeRecId: widget.uda.formTypeId,
  //     filterType: FilterFrom.Other,
  //     selectedBusinessTypeTitle: "",
  //     formlistUDASelectedFields: widget.uda.formUdaSelectedFields,
  //     isFormlistSearchRecs: true,
  //   );
  // }

  // loadFormUDAValues() {
  //   GridRowData gridRowData = getformUDAGridRowData();
  //   FormUDAValuesRequest formRequestBody = FormUDAValuesRequest(
  //       formListUdaId: widget.uda?.recId ??
  //           widget.formListUdaId, //Use grid data instead of UDA data if null
  //       selectedFieldsNames: widget.uda?.formUdaSelectedFields ??
  //           widget
  //               .selectedFieldsNames, //Use grid data instead of UDA data if null
  //       selectedTypeId: widget.uda?.formTypeId ??
  //           widget.formTypeId, //Use grid data instead of UDA data if null
  //       genericObject: widget.genericObject,
  //       gridRowData: gridRowData,
  //       gridId: widget.gridID);
  //   formUDAPresenter.loadFormUDAValues(formRequestBody);
  // }

  // GridRowData getformUDAGridRowData() {
  //   List<GridCols> gridRowDataColumns = [];
  //   if (isNotEmptyList(widget.columns))
  //     widget.columns.forEach((column) {
  //       gridRowDataColumns.add(GridCols(
  //           name: "{{uda.${widget.gridUDAName}.${column.name}}}",
  //           value: column.value));
  //     });
  //   return GridRowData(columnsList: gridRowDataColumns);
  // }

  // mapUDAsAction(int selectedRowRecId) {
  //   // formUDAPresenter = FormUDAPresenter(formUDAView: this, context: context);
  //   FormListMappingRequest formMappingRequestBody = FormListMappingRequest(
  //       selectedRowRecId: selectedRowRecId,
  //       formListMappingDTOList: widget.uda?.formListMappingDTOList ??
  //           widget
  //               .formListMappingDTOList, //Use grid data instead of UDA data if null
  //       targetUDAList: widget.genericObject.udasValues);
  //   formUDAPresenter.mapFormUDAs(formMappingRequestBody);
  // }

  @override
  updateFormUDAWidgetView() {
    // TODO: implement setFormUDAValues
    setState(() {});
  }
}
