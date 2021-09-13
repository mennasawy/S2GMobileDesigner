import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MultipleLevel/MultipleLevelRowData.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/MultiLevelUDA/multiLevelPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/MultiLevelUDA/MultiLevelUDAViewInterface/IGetMultiLevelsView.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/MultiLevelUDA/multilevelTable.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/Temp2BoxedBlueButtonWidget.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/Temp2WidgetsWithBorder.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class Temp2MultiLevelTable extends StatefulWidget {
  final bool isVisible;
  bool isLocation = false;

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

  Temp2MultiLevelTable(
      {Key key,
      this.gridName,
      this.rowListItems,
      this.multiLevelUDA,
      this.onAddRows,
      this.objectRecId,
      this.formMode,
      this.isVisible,
      this.validationMessage,
      this.isValidationMSGWarning,
      this.gridValidation,
      this.udaDescription,
      this.repositoryID,
      this.isReadOnly,
      this.isLocation,
      this.isMandatory,
      this.labelColor})
      : super(key: key);

  @override
  _Temp2MultiLevelTableState createState() => _Temp2MultiLevelTableState();
}

class _Temp2MultiLevelTableState extends State<Temp2MultiLevelTable>
    implements IGetMultiLevelView {
  MultiLevelPresenter multiLevelPresenter;

  @override
  void initState() {
    super.initState();
    initializePresenter();
    multiLevelPresenter.initializeItems();
  }

  @override
  Widget build(BuildContext context) {
    multiLevelPresenter.checkLoadingUDAObject();

    return Column(
      children: [
        Container(
          key: widget.key,
          decoration: BoxDecoration(
              color: LITE_GREY.withOpacity(OPACITY),
              border: Border(
                  top: BorderSide(width: 3.0, color: GREY),
                  bottom: BorderSide(width: 3.0, color: GREY))),
          child: drawWidgetOrEmptyContainer(
              widget.isVisible == true && widget.isLocation != true,
              getMultiLevelUDAWithTitleWidget()),
        ),
        getValidationMessageWidget(
            widget.validationMessage, widget.isValidationMSGWarning)
      ],
    );
  }

  Container getMultiLevelUDAWithTitleWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: multiLevelPresenter.isMultiLevelDataLoaded ||
              multiLevelPresenter
                  .isListEmpty(multiLevelPresenter.gridRowListItems)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: getUDATitleWidget(context, widget.isMandatory, "",
                          widget.udaDescription, hexToColor(widget.labelColor)),
                    ),
                  ],
                ),
                (multiLevelPresenter
                        .isListEmpty(multiLevelPresenter.gridRowListItems))
                    ? getClickToAddNewWidget()
                    : getAppreviatedRowsListWidget(),
              ],
            )
          : DrawProgressBar(),
    );
  }

  Widget getAddButtonWidget() {
    return (widget.isReadOnly != true)
        ? IconButton(
            icon: Icon(Icons.add),
            onPressed: multiLevelPresenter.temp2OnAddNewRecordTapped)
        : Container();
  }

  Widget getClickToAddNewWidget() {
    return (widget.isReadOnly != true)
        ? Center(
            child: BoxedButtonWidget(
              isMandatory: widget.isMandatory,
              title: widget.gridName,
              onButtonTapped: multiLevelPresenter.temp2OnAddNewRecordTapped,
              buttonTitle: "Click To Add New",
              buttonLogo: TEMP2_ADD_NEW,
            ),
          )
        : Container();
  }

  Widget getAppreviatedRowsListWidget() {
    return Temp2WidgetBorder(
      isMandatoryUDA: widget.isMandatory,
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
            getAddButtonWidget(),
            Column(
              children: <Widget>[
                multiLevelPresenter.temp2GetGridRowItem(0),
                SizedBox(
                  height: 10,
                ),
                (multiLevelPresenter.gridRowListItems.length == 1)
                    ? Container()
                    : multiLevelPresenter.temp2GetGridRowItem(1),
                getSeeAllListWidget(context)
              ],
            ),
          ],
        ),
      ),
    );

    // Container(
    //   child: Column(
    //     children: <Widget>[
    //       multiLevelPresenter.temp2GetGridRowItem(0),
    //       (multiLevelPresenter.gridRowListItems.length == 1)
    //           ? Container()
    //           : multiLevelPresenter.temp2GetGridRowItem(1),
    //     ],
    //   ),
    // );
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
              onPressed: multiLevelPresenter.temp2NavigateToAllRowsScreen),
        ),
      ],
    );
  }

  initializePresenter() {
    multiLevelPresenter = MultiLevelPresenter(
      isVisible: widget.isVisible,
      objectRecId: widget.objectRecId,
      repositoryID: widget.repositoryID,
      gridName: widget.gridName,
      udaDescription: widget.udaDescription,
      validationMessage: widget.validationMessage,
      isValidationMSGWarning: widget.isValidationMSGWarning,
      labelColor: widget.labelColor,
      formMode: widget.formMode,
      multiLevelUDA: widget.multiLevelUDA,
      gridValidation: widget.gridValidation,
      rowListItems: widget.rowListItems,
      onAddRows: widget.onAddRows,
      isReadOnly: widget.isReadOnly,
      isMandatory: widget.isMandatory,
      context: context,
      igetMultiLevelDataView: this,
    );
  }

  @override
  void updateMultiLevelView() {
    setState(() {});
  }
}
