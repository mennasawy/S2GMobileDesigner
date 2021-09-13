import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridCols.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridRow.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/Grid/AllRowsScreenPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/Grid/GridPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/ServiceUrls.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/const.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:flutter/material.dart';
import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';

class GridNameItem extends StatefulWidget {
  bool isSortScreen = false;
  UDAsWithValues gridUDA;
  List<GridCols> dataSource = [];
  bool areGridCaptionsLoaded = false;
  GridRowData gridRowData;
  Function onEditRefresh;
  Function ondelete;
  int gridRowIndex;
  int objectRecId;
  FormModes formMode;
  GridVisibility gridValidation;
  GenericObject genericObject;

  GridNameItem({
    this.isSortScreen,
    this.dataSource,
    this.gridUDA,
    this.areGridCaptionsLoaded,
    this.gridRowData,
    this.gridRowIndex,
    this.objectRecId,
    this.onEditRefresh,
    this.formMode,
    this.gridValidation,
    this.ondelete,
    this.genericObject,
  });

  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridNameItem> implements GridViewContract {
  GridPresenter _presenter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeAndUpdatePresenter();
  }

  @override
  void didUpdateWidget(covariant GridNameItem oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    initializeAndUpdatePresenter();
  }

  @override
  Widget build(BuildContext context) {
    return _presenter.isCardDeleted
        ? Container()
        : Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: ConfigurableExpansionTile(
              initiallyExpanded: false,
              headerExpanded: Container(
                width: getScreenWidth(context) * 0.80,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      ..._presenter.dataSource
                              .map<Widget>(
                                  (value) => moreThanThreeItemsOfList(value))
                              .toList() ??
                          null,
                      SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child:
                                _presenter.getEditIconWidget(30, IC_EDIT_GRID),
                          ),
                          Expanded(
                            flex: 1,
                            child: _presenter.getDeleteIconWidget(IC_DELETE,
                                iconSize: 20),
                          ),
                          Expanded(flex: 4, child: Text('')),
                        ],
                      ),
                      Center(
                        child: IconButton(
                            icon: Icon(Icons.expand_less), onPressed: null),
                      ),
                    ],
                  ),
                ),
              ),
              header: Container(
                width: getScreenWidth(context) * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    firstRowInCard(),
                    Column(children: getFirstRowItems()),
                    Center(
                      child: IconButton(
                          icon: Icon(Icons.expand_more), onPressed: null),
                    ),
                  ],
                ),
              ),
            ));
  }

  Widget firstRowInCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          getTextOrEmptyString(_presenter.dataSource[0].headerName) + " :  ",
          style: gridBoldedTextStyle(null),
        ),
        _presenter.isValidImageRow(_presenter.dataSource[0])
            ? Image.network(
                ServiceUrls(context).baseUrl + _presenter.dataSource[0].value,
                fit: BoxFit.fill,
                height: 30,
                width: 30,
              )
            : Expanded(
                child: Text(
                  getTextOrEmptyString((_presenter.dataSource[0].type == 6)
                      ? _presenter.dataSource[0].udaFormValueString
                      : _presenter.dataSource[0].value),
                  style: normalGridTextStyle(null),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
        Spacer(),
        _presenter.getEditIconWidget(30, IC_EDIT_GRID),
      ],
    );
  }

  Widget moreThanThreeItemsOfList(GridCols value) {
    log(LogType.DEBUG, 'Grid moreThanThreeItemsOfList ====== ${value.name}');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: Row(
            children: <Widget>[
              Text(
                _presenter.columnHeaderText(value),
                style: gridBoldedTextStyle(null),
              ),
              _presenter.isValidImageRow(value)
                  ? Image.network(
                      ServiceUrls(context).baseUrl + value.value,
                      fit: BoxFit.fill,
                      height: 30,
                      width: 30,
                    )
                  : Expanded(
                      child: Text(
                        _presenter.columnValueText(value),
                        style: normalGridTextStyle(null),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }

  getFirstRowItems() {
    List<Widget> columnsValues = [];
    int itemsCount =
        (_presenter.dataSource.length <= 3) ? _presenter.dataSource.length : 3;
    for (int index = 1; index < itemsCount; index++) {
      columnsValues.add(Row(
        children: <Widget>[
          Text(
            _presenter.columnHeaderText(_presenter.dataSource[index]),
            style: gridBoldedTextStyle(null),
          ),
          _presenter.isValidImageRow(_presenter.dataSource[index])
              ? Image.network(
                  ServiceUrls(context).baseUrl +
                      _presenter.dataSource[index].value,
                  fit: BoxFit.fill,
                  height: 30,
                  width: 30,
                )
              : Expanded(
                  child: Text(
                    _presenter.columnValueText(_presenter.dataSource[index]),
                    style: normalGridTextStyle(null),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
        ],
      ));
    }
    return columnsValues;
  }

  initializeAndUpdatePresenter() {
    _presenter = GridPresenter(
      view: this,
      context: context,
      gridUDA: widget.gridUDA,
      gridRowData: widget.gridRowData,
      onEditRefresh: widget.onEditRefresh,
      ondelete: widget.ondelete,
      gridRowIndex: widget.gridRowIndex,
      objectRecId: widget.objectRecId,
      formMode: widget.formMode,
      gridValidation: widget.gridValidation,
      genericObject: widget.genericObject,
      dataSource: widget.dataSource,
      isSortScreen: widget.isSortScreen,
      areGridCaptionsLoaded: widget.areGridCaptionsLoaded,
    );
  }

  @override
  updateGridItemView() {
    setState(() {});
  }
}
