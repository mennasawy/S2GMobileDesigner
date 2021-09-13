import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MultipleLevel/MultipleLevelRowData.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/MultiLevelUDA/multiLevelPresenter.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/MultiLevelUDA/MultiLevelUDAViewInterface/IGetMultiLevelsView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum MultiLevelVisibility { normal, readOnly, addOnly, editOnly, mandatory }

class MultiLevelTable extends StatefulWidget {
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

  MultiLevelTable(
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
  _MultiLevelTableState createState() => _MultiLevelTableState();
}

class _MultiLevelTableState extends State<MultiLevelTable>
    implements IGetMultiLevelView {
  // int multipleLevelRepositoryID;
  // bool isMultiLevelDataLoaded = false;
  // bool isUDAObjectLoaded = false;
  MultiLevelPresenter multiLevelPresenter;
  // UDAObjectPresenter udaObjectPresenter;
  // List<List<GridCols>> gridRowListItems = [];
  // List<MultipleLevelRowData> multiLevelRowData = [];
  // List<String> levelsCaptions = [];

  @override
  void initState() {
    super.initState();
    //Separate Done..
    initializePresenter();
    multiLevelPresenter.initializeItems();
  }

  @override
  Widget build(BuildContext context) {
    //Separate Done..
    multiLevelPresenter.checkLoadingUDAObject();
    // if (isUDAObjectLoaded == false) {
    //   loadUDAObject();
    // }

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
                      // padding: EdgeInsets.symmetric(vertical: 10),
                      child: getUDATitleWidget(
                          context,
                          widget.isMandatory,
                          widget.gridName,
                          widget.udaDescription,
                          hexToColor(widget.labelColor)),
                    ),
                    drawWidgetOrEmptyContainer(
                        !multiLevelPresenter
                            .isListEmpty(multiLevelPresenter.gridRowListItems),
                        getAddButtonWidget()),
                  ],
                ),
                (multiLevelPresenter
                        .isListEmpty(multiLevelPresenter.gridRowListItems))
                    ? getClickToAddNewWidget()
                    : getAppreviatedRowsListWidget(),
                drawWidgetOrEmptyContainer(
                    !multiLevelPresenter
                        .isListEmpty(multiLevelPresenter.gridRowListItems),
                    getSeeAllListWidget(context)),
              ],
            )
          : DrawProgressBar(),
    );
  }

  //Separate Done..
  // bool isListEmpty(List list) {
  //   if (list == null || list.isEmpty) return true;
  //   return false;
  // }

  Widget getAddButtonWidget() {
    return (widget.isReadOnly != true)
        ? IconButton(
            icon: Icon(Icons.add),
            onPressed: multiLevelPresenter.onAddNewRecordTapped
            //Separate Done..
            // (widget.gridValidation != MultiLevelVisibility.editOnly)
            //     ? () {
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (BuildContext context) =>
            //                     AddMultiLevelScreen(
            //                       repositoryID: multipleLevelRepositoryID,
            //                       multiLevelUDA: widget.multiLevelUDA,
            //                       mode: AddMultiLevelMode.newMode,
            //                       formMode: widget.formMode,
            //                       objectRecId: widget.objectRecId,
            //                       multiLevelRecID:
            //                           widget.multiLevelUDA.recId,
            //                     ))).then((value) async {
            //           if (value != null) await refreshRowsList(value);
            //         });
            //       }
            //     : null
            )
        : Container();
  }

  Widget getClickToAddNewWidget() {
    return (widget.isReadOnly != true)
        ? Center(
            child: FlatButton(
              onPressed: () {},
              child: Column(
                children: <Widget>[
                  getAddButtonWidget(),
                  Text(
                    "Click to add new",
                    style: TextStyle(color: BLUE),
                  ),
                ],
              ),
            ),
          )
        : Container();
  }

  Container getAppreviatedRowsListWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          multiLevelPresenter.getGridRowItem(0),
          (multiLevelPresenter.gridRowListItems.length == 1)
              ? Container()
              : multiLevelPresenter.getGridRowItem(1),
        ],
      ),
    );
  }

  //Separate Done..
  // Widget getGridRowItem(int rowIndex) {
  //   return MultiLevelItem(
  //     dataSource: gridRowListItems[rowIndex],
  //     multiLevelUDA: widget.multiLevelUDA,
  //     multiLevelRowData: multiLevelRowData[rowIndex],
  //     multiLevelRowIndex: rowIndex,
  //     objectRecId: widget.objectRecId,
  //     onEditRefresh: refreshRowsList,
  //     formMode: widget.formMode,
  //     fullList: false,
  //     repositoryID: multipleLevelRepositoryID,
  //     // gridValidation: widget.gridValidation,
  //     ondelete: refreshRowsListonDelete,
  //     isReadOnly: widget.isReadOnly,
  //     isMandatory: widget.isMandatory,
  //   );
  // }

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
              onPressed: multiLevelPresenter.navigateToAllRowsScreen
              //Separate Done..
              //   () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (BuildContext context) => MultiLevelScreen(
              //               multiLevelRowsValues: gridRowListItems,
              //               multiLevelUDA: widget.multiLevelUDA,
              //               rowListItems: widget.rowListItems,
              //               objectRecId: widget.objectRecId,
              //               formMode: widget.formMode,
              //               onAddRows: widget.onAddRows,
              //               onEditRefresh: refreshRowsList,
              //               repositoryID: multipleLevelRepositoryID,
              //               // gridValidation: widget.gridValidation,
              //               isReadOnly: widget.isReadOnly,
              //               isMandatory: widget.isMandatory,
              //             ))).then((value) async {
              //   refreshList();
              // });
              //Navigator.pushNamed(context, GRID_ROWS_SCREEN);
              // },
              ),
        ),
      ],
    );
  }

  //Separate Done..
  // loadMultiLevelData() {
  //   multiLevelPresenter = MultiLevelPresenter(igetMultiLevelDataView: this);
  //   multiLevelPresenter.getLevels(
  //       context, multipleLevelRepositoryID.toString());
  // }

  //Separate Done..
  // loadUDAObject() {
  //   udaObjectPresenter = UDAObjectPresenter(context, this);
  //   udaObjectPresenter.loadUDAObject(widget.multiLevelUDA.recId);
  // }

  //Separate Done..
  // Future<void> refreshRowsList(rowList) async {
  //   setState(() {
  //     if (rowList.gridRowDataMode == AddMultiLevelMode.newMode) {
  //       gridRowListItems.add(rowList.columnsList);
  //       multiLevelRowData.add(rowList);
  //       widget.onAddRows(multiLevelRowData);
  //     } else {
  //       gridRowListItems[rowList.rowIndex] = rowList.columnsList;
  //       multiLevelRowData[rowList.rowIndex] = rowList;
  //       widget.onAddRows(multiLevelRowData);
  //     }
  //   });
  // }

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

  // @override
  // void onAddEditRecComplete(String response) {
  //   // TODO: implement onAddEditRecComplete
  // }

  // @override
  // void onAddEditRecError(ErrorResponse errorResponse) {
  //   // TODO: implement onAddEditRecError
  // }

  // @override
  // void onloadFirstLevelComplete(List<LevelDataModel> multiLevelResponse) {
  //   // TODO: implement onloadFirstLevelComplete
  // }

  // @override
  // void onloadFirstLevelError(ErrorResponse errorResponse) {
  //   // TODO: implement onloadFirstLevelError
  // }

  // @override
  // void onloadLevelByIdComplete(List<LevelDataModel> multiLevelResponse) {
  //   // TODO: implement onloadLevelByIdComplete
  // }

  // @override
  // void onloadLevelByIdError(ErrorResponse errorResponse) {
  //   // TODO: implement onloadLevelByIdError
  // }

  // @override
  // void onloadLevelsComplete(MultiLevelResponse multiLevelResponse) {
  //   // TODO: implement onloadLevelsComplete
  //   //Separate Done..
  //   // levelsCaptions = !isEmptyText(multiLevelResponse.tiresNames)
  //   //     ? multiLevelResponse.tiresNames.split(",")
  //   //     : [];
  //   // if (isListEmpty(levelsCaptions)) {
  //   //   for (int i = 0; i < multiLevelResponse.numberOfLevels; i++) {
  //   //     levelsCaptions.add("Tier " + (i + 1).toString());
  //   //   }
  //   // }

  //   // setState(() {
  //   //   gridRowListItems.forEach((gridRow) {
  //   //     for (var i = 0; i < gridRow.length; i++) {
  //   //       gridRow[i].caption = levelsCaptions[i];
  //   //     }
  //   //   });
  //   //   isMultiLevelDataLoaded = true;
  //   // });

  //   // levelsCaptions.forEach((caption) {
  //   //   gridRowListItems.forEach((row) {
  //   //     if (!listContainsColumn(caption, row)) {
  //   //       row.add(GridCols(caption: caption));
  //   //     }
  //   //   });
  //   // });
  // }

  // @override
  // void onloadLevelsError(ErrorResponse errorResponse) {
  //   // TODO: implement onloadLevelsError
  // }

  // //Separate Done..
  // // initializeItems() {
  // //   (widget.rowListItems != null)
  // //       ? widget.rowListItems
  // //           .forEach((row) => {gridRowListItems.add(row.columnsList)})
  // //       : gridRowListItems = [];
  // //   multiLevelRowData = widget.rowListItems;
  // //   // if(widget.formMode == FormModes.newMode) isMultiLevelDataLoaded = true;
  // // }

  // //Separate Done..
  // // bool listContainsColumn(String columCaption, List<GridCols> list) {
  // //   bool containsItem = false;
  // //   list.forEach((listItem) {
  // //     if (listItem.caption == columCaption) containsItem = true;
  // //   });
  // //   return containsItem;
  // // }

  // @override
  // void updateUDAWithRepoData(MultipleLevelModel multipleLevelRepository) {
  //   // TODO: implement updateUDAWithRepoData
  //   //Separate Done..
  //   // setState(() {
  //   //   multipleLevelRepositoryID = multipleLevelRepository.recId;
  //   //   isUDAObjectLoaded = true;
  //   // });
  //   // if (widget.formMode != FormModes.newMode)
  //   //   loadMultiLevelData();
  //   // else
  //   //   setState(() {
  //   //     isMultiLevelDataLoaded = true;
  //   //   });
  // }

  @override
  void updateMultiLevelView() {
    setState(() {});
  }

  //Separate Done..
  // Future<void> refreshRowsListonDelete(int index) async {
  //   log(LogType.ERROR, '############ inside refresh Rows List on Delete');
  //   await Future.delayed(Duration(seconds: 0));
  //   setState(() {
  //     gridRowListItems.removeAt(index);
  //     multiLevelRowData.removeAt(index);
  //   });
  //   //  return null;
  // }

  //Separate Done..
  // Future<Null> refreshList() async {
  //   setState(() {
  //     isMultiLevelDataLoaded = false;
  //   });
  //   await Future.delayed(Duration(seconds: 0));
  //   setState(() {
  //     loadMultiLevelData();
  //   });
  //   return null;
  // }
}
