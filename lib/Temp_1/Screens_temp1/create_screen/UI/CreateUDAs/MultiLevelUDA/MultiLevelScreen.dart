import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridCols.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MultipleLevel/MultipleLevelRowData.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/MultiLevelUDA/MLevelAllRecordsPresenter.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBarTemplate1/NTGAppBar.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/MultiLevelUDA/AddMultiLevelScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/MultiLevelUDA/MultiLevelItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MultiLevelScreen extends StatefulWidget {
  final Function(List<MultipleLevelRowData>) onAddRows;
  final Function onEditRefresh;
  final List<List<GridCols>> multiLevelRowsValues;
  final List<MultipleLevelRowData> rowListItems;
  final UDAsWithValues multiLevelUDA;
  final FormModes formMode;
  final int objectRecId;
  final int repositoryID;
  final bool isReadOnly;
  final bool isMandatory;

  const MultiLevelScreen(
      {Key key,
      this.onAddRows,
      this.onEditRefresh,
      this.multiLevelRowsValues,
      this.rowListItems,
      this.multiLevelUDA,
      this.formMode,
      this.objectRecId,
      this.repositoryID,
      this.isReadOnly,
      this.isMandatory})
      : super(key: key);
  // final GridVisibility gridValidation;

  @override
  _MultiLevelScreenState createState() => _MultiLevelScreenState();
}

class _MultiLevelScreenState extends State<MultiLevelScreen>
    implements MiltiLevelAllRowsViewInterface {
  MultiLevelAllRowsScreenPresenter allRowsPresenter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePresenter();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: NTGAppBar(
          appBarType: AppBarType.appBarWithBack,
          pageName: "Multi Level Screen",
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: 60,
              width: double.infinity,
              child: _buildIconActions(),
            ),
            widget.rowListItems.length == null ||
                    widget.rowListItems.length == 0
                ? Container()
                : Container(
                    margin: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: widget.rowListItems.length,
                      itemBuilder: (ctx, rowIndex) => MultiLevelItem(
                        dataSource: widget.multiLevelRowsValues[rowIndex],
                        isSortScreen: allRowsPresenter.sortButtonClicked,
                        multiLevelUDA: widget.multiLevelUDA,
                        multiLevelRowData: widget.rowListItems[rowIndex],
                        multiLevelRowIndex: rowIndex,
                        objectRecId: widget.objectRecId,
                        formMode: widget.formMode,
                        fullList: true,
                        repositoryID: widget.repositoryID,
                        ondelete: allRowsPresenter.refreshRowsListonDelete,
                        isReadOnly: widget.isReadOnly,
                        isMandatory: widget.isMandatory,
                        onEditRefresh: allRowsPresenter.refreshRowsList,
                      ),
                    ),
                  ),
            allRowsPresenter.sortButtonClicked
                ? Stack(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          allRowsPresenter.onSortButtonTapped();
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
                          color: allRowsPresenter.sortCardColor(),
                          width: double.infinity,
                        ),
                      ),
                    ],
                  )
                : Container(),
            allRowsPresenter.sortButtonClicked
                ? _buildSortButtonsWidget()
                : Container(height: 5, color: Colors.white),
            allRowsPresenter.isSortByStartDateClicked
                ? _buildStartDateContainer()
                : Container(),
            allRowsPresenter.isSortByAscendingClicked
                ? _buildAscendingContainer()
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget _buildIconActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.phone_iphone),
          onPressed: () {
            allRowsPresenter.onAddNewRowTapped();
          },
        ),
        IconButton(
            icon: Icon(Icons.phone_iphone),
            onPressed: () {
              allRowsPresenter.downloadAction();
            }),
        IconButton(
          icon: allRowsPresenter.sortButtonClicked
              ? Icon(Icons.phone_iphone)
              : Icon(Icons.phone_iphone),
          onPressed: () {
            if (isNotEmptyList(widget.rowListItems))
              allRowsPresenter.sortElements();
          },
        ),
      ],
    );
  }

  Widget showStartDateButton(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          allRowsPresenter.onShowStartDateTapped();
        },
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(4.0),
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Colors.grey,
              width: 0.8,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  child: Text(
                    allRowsPresenter.indexc == ""
                        ? "Select Value"
                        : allRowsPresenter.indexc + "    ",
                    style: new TextStyle(
                      fontSize: 8.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              )),
              Expanded(
                child: Icon(Icons.phone_iphone),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showAscendingButton(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          allRowsPresenter.onShowAscendingButtonTapped();
        },
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(8.0),
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Colors.grey,
              width: 0.8,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: FittedBox(
                    child: Text(allRowsPresenter.Sort ?? "Select Order",
                        style: dateTextStyle)),
              )),
              Expanded(
                child: Icon(Icons.phone_iphone),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStartDateContainer() {
    return Card(
      margin: EdgeInsets.fromLTRB(4.0, 155.0, 4.0, 20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        margin: EdgeInsets.fromLTRB(2.0, 15.0, 2.0, 0.0),
        height: 150,
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: allRowsPresenter.cn.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  allRowsPresenter.onSortBySelected(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 10),
                        Expanded(
                            child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Text(allRowsPresenter.cn[index])),
                            flex: 7),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  Widget _buildAscendingContainer() {
    return Card(
      margin: EdgeInsets.fromLTRB(4.0, 155.0, 4.0, 20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        margin: EdgeInsets.fromLTRB(2.0, 15.0, 2.0, 0.0),
        height: 100,
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: allRowsPresenter.SortType.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  allRowsPresenter.onAscendingDescendingSelected(index);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 10),
                      Expanded(
                          child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Text(allRowsPresenter.SortType[index])),
                          flex: 7),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
              );
            }),
      ),
    );
  }

  Widget _buildSortButtonsWidget() {
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 44.0, 0.0, 0.0),
      height: 130,
      width: double.infinity,
      child: Card(
        color: Colors.white,
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Sort By'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(child: showStartDateButton(context)),
                SizedBox(width: 0),
                Expanded(child: showAscendingButton(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  initializePresenter() {
    allRowsPresenter = MultiLevelAllRowsScreenPresenter(
      repositoryID: widget.repositoryID,
      onAddRows: widget.onAddRows,
      gridRowsValues: widget.multiLevelRowsValues,
      rowListItems: widget.rowListItems,
      multiLevelUDA: widget.multiLevelUDA,
      onEditRefresh: widget.onEditRefresh,
      formMode: widget.formMode,
      objectRecId: widget.objectRecId,
      context: context,
      view: this,
    );
  }

  @override
  updateAllGridRowsScreen() {
    setState(() {});
  }
}
