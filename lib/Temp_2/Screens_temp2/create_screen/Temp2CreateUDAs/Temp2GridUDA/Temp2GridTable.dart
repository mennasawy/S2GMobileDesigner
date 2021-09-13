import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridRow.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/Grid/AllRowsScreenPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/Grid/GridUDAPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/Temp2BoxedBlueButtonWidget.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/Temp2WidgetsWithBorder.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2GridUDA/Temp2GridItem.dart';

class Temp2GridTable extends StatefulWidget {
  final String gridName;
  final int objectRecId;
  final String labelColor;
  final FormModes formMode;
  final UDAsWithValues gridUDA;
  final GenericObject genericObject;

  List<GridRowData> rowListItems;
  final Function(List<GridRowData>) onAddRows;

  final bool isVisible;
  bool isLocation = false;
  final String udaDescription;
  final String validationMessage;
  final bool isValidationMSGWarning;
  final GridVisibility gridValidation;

  Temp2GridTable(
      {Key key,
      this.gridName,
      this.rowListItems,
      this.gridUDA,
      this.onAddRows,
      this.objectRecId,
      this.formMode,
      this.isVisible,
      this.isLocation,
      this.validationMessage,
      this.isValidationMSGWarning,
      this.gridValidation,
      this.udaDescription,
      this.labelColor,
      this.genericObject})
      : super(key: key);

  @override
  _Temp2GridTableState createState() => _Temp2GridTableState();
}

class _Temp2GridTableState extends State<Temp2GridTable>
    implements GridUDAViewContract {
  GridUDAPresenter gridPresenter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePresenter();
    gridPresenter.initializeItems();
  }

  @override
  void didUpdateWidget(Temp2GridTable oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (widget.rowListItems != oldWidget.rowListItems &&
        widget.formMode != FormModes.dictionaryModule)
      gridPresenter.updateGridValues();
  }

  @override
  Widget build(BuildContext context) {
    gridPresenter.loadGridData();

    return Column(
      children: [
        drawWidgetOrEmptyContainer(
            widget.isVisible == true && widget.isLocation != true,
            getGridUDAWithTitleWidget()),
        getValidationMessageWidget(
            widget.validationMessage, widget.isValidationMSGWarning)
      ],
    );
  }

  Container getGridUDAWithTitleWidget() {
    return Container(
      key: widget.key,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: gridPresenter.hasDataToShow()
          ? (gridPresenter.isListEmpty(gridPresenter.gridRowListItems))
              ? getClickToAddNewWidget()
              : getAppreviatedRowsListWidget()
          : DrawProgressBar(),
    );
  }

  //Widgets Drawing Methods
  Widget getClickToAddNewWidget() {
    return (widget.gridValidation != GridVisibility.readOnly)
        ? Center(
            child: BoxedButtonWidget(
              isMandatory: widget.gridValidation == GridVisibility.mandatory,
              title: widget.gridName,
              onButtonTapped: gridPresenter.temp2OnAddGridRowAction,
              buttonTitle: "Click To Add New",
              buttonLogo: TEMP2_ADD_NEW,
            ),
          )
        : Container();
  }

  Widget getAddButtonWidget(String iconName) {
    return (widget.gridValidation != GridVisibility.readOnly)
        ? IconButton(
            icon: Icon(Icons.phone_iphone),
            onPressed: gridPresenter.temp2OnAddGridRowAction,
          )
        : Container();
  }

  Temp2WidgetBorder getAppreviatedRowsListWidget() {
    return Temp2WidgetBorder(
      isMandatoryUDA: widget.gridValidation == GridVisibility.mandatory,
      title: widget.gridName,
      decoration: BoxDecoration(
        color: WHITE,
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        border: Border.all(
          color: DARK_GREY,
        ),
        boxShadow: [
          BoxShadow(
              blurRadius: 5.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 3.0),
              color: DARK_GREY)
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            getAddButtonWidget(TEMP2_ADD_BLUE),
            Column(
              children: <Widget>[
                getGridRowItem(0),
                SizedBox(
                  height: 10,
                ),
                (gridPresenter.gridRowListItems.length == 1)
                    ? Container()
                    : getGridRowItem(1),
                getSeeAllListWidget(context)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getSeeAllListWidget(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: FlatButton(
            shape: Border(),
            child: Text(
              "See All List",
              style: TextStyle(color: BLUE),
            ),
            onPressed: gridPresenter.temp2NavigateToAllRowsScreen,
          ),
        ),
      ],
    );
  }

  Widget getGridRowItem(int rowIndex) {
    return Temp2GridRowItem(
      dataSource: gridPresenter.gridRowListItems[rowIndex],
      gridUDA: widget.gridUDA,
      gridRowData: widget.rowListItems[rowIndex],
      gridRowIndex: rowIndex,
      objectRecId: widget.objectRecId,
      onEditRefresh: gridPresenter.refreshRowsList,
      formMode: widget.formMode,
      gridValidation: widget.gridValidation,
      ondelete: gridPresenter.refreshRowsListonDelete,
      genericObject: widget.genericObject,
    );
  }

  initializePresenter() {
    gridPresenter = GridUDAPresenter(
      context: context,
      gridView: this,
      gridName: widget.gridName,
      objectRecId: widget.objectRecId,
      labelColor: widget.labelColor,
      formMode: widget.formMode,
      gridUDA: widget.gridUDA,
      genericObject: widget.genericObject,
      rowListItems: widget.rowListItems,
      onAddRows: widget.onAddRows,
      isVisible: widget.isVisible,
      udaDescription: widget.udaDescription,
      validationMessage: widget.validationMessage,
      isValidationMSGWarning: widget.isValidationMSGWarning,
      gridValidation: widget.gridValidation,
    );
  }

  @override
  void updateGridView() {
    setState(() {});
  }
}
