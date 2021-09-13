import 'package:flutter/material.dart';
import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridCols.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridRow.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/Grid/AllRowsScreenPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/Grid/GridPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/ServiceUrls.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/const.dart';
import 'package:templets/Utilities/utility_methods.dart';

class Temp2GridRowItem extends StatefulWidget {
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

  Temp2GridRowItem({
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
  _Temp2GridRowItemState createState() => _Temp2GridRowItemState();
}

class _Temp2GridRowItemState extends State<Temp2GridRowItem>
    implements GridViewContract {
  GridPresenter _presenter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeAndUpdatePresenter();
  }

  @override
  void didUpdateWidget(covariant Temp2GridRowItem oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    initializeAndUpdatePresenter();
  }

  @override
  Widget build(BuildContext context) {
    return _presenter.isCardDeleted
        ? Container()
        : Container(
            decoration: BoxDecoration(
              color: WHITE,
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              border: Border.all(
                color: DARK_GREY,
              ),
            ),
            child: ConfigurableExpansionTile(
              initiallyExpanded: false,
              headerExpanded: Container(
                width: getScreenWidth(context) * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    firstRowInCard(),
                    ..._presenter.dataSource
                            .map<Widget>(
                                (value) => moreThanThreeItemsOfList(value))
                            .toList() ??
                        null,
                    SizedBox(height: 3),
                    Center(
                      child: IconButton(
                          icon: Icon(Icons.expand_less), onPressed: null),
                    ),
                  ],
                ),
              ),
              header: Container(
                width: getScreenWidth(context) * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
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
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _presenter.temp2EditIconWidget(30, TEMP2_EDIT),
          SizedBox(
            width: 10,
          ),
          _presenter.getDeleteIconWidget(TEMP2_DELETE),
        ],
      ),
    );
  }

  Widget moreThanThreeItemsOfList(GridCols value) {
    log(LogType.DEBUG, 'Grid moreThanThreeItemsOfList ====== ${value.name}');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(0.0),
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
    for (int index = 0; index < itemsCount; index++) {
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
