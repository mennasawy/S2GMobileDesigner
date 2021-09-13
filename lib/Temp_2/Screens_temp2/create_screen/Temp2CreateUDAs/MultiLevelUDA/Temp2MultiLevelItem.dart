import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridCols.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MultipleLevel/MultipleLevelRowData.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/MultiLevelUDA/MultiLevelDeletePresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class Temp2MultiLevelItem extends StatefulWidget {
  final dataSource;
  final bool isSortScreen;
  final UDAsWithValues multiLevelUDA;
  final MultipleLevelRowData multiLevelRowData;
  final int multiLevelRowIndex;
  final int objectRecId;
  final Function onEditRefresh;
  final Function ondelete;
  final FormModes formMode;
  final bool fullList;
  final int repositoryID;
  final bool isReadOnly;
  final bool isMandatory;

  Temp2MultiLevelItem({
    this.dataSource,
    this.isSortScreen,
    this.multiLevelUDA,
    this.multiLevelRowData,
    this.multiLevelRowIndex,
    this.objectRecId,
    this.formMode,
    this.onEditRefresh,
    this.fullList,
    this.repositoryID,
    this.ondelete,
    this.isReadOnly,
    this.isMandatory,
  });

  @override
  _Temp2MultiLevelItemState createState() => _Temp2MultiLevelItemState();
}

class _Temp2MultiLevelItemState extends State<Temp2MultiLevelItem>
    implements MultiLevelViewContract {
  MultiLevelDeletePresenter _levelDeletePresenter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePresenter();
  }

  @override
  Widget build(BuildContext context) {
    return _levelDeletePresenter.isCardDeleted
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
                    ..._levelDeletePresenter.dataSource
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
            ),
          );
  }

  Widget getDeleteIconWidget() {
    GestureDetector deleteIcon = GestureDetector(
      child: Icon(Icons.phone_iphone),
      onTap: () {
        setState(() {
          _levelDeletePresenter.deleteItem();
        });
      },
    );
    return drawWidgetOrEmptyContainer(widget.isReadOnly != true, deleteIcon);
  }

  Widget getEditIconWidget(double iconSize) {
    GestureDetector editIcon = GestureDetector(
      child: Icon(Icons.phone_iphone),
      onTap: _levelDeletePresenter.onEditIconTapped,
    );
    return drawWidgetOrEmptyContainer(widget.isReadOnly != true, editIcon);
  }

  Widget firstRowInCard() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          getEditIconWidget(30),
          SizedBox(
            width: 10,
          ),
          getDeleteIconWidget(),
        ],
      ),
    );
  }

  Widget moreThanThreeItemsOfList(GridCols value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              '${getTextOrEmptyString(value.caption)}: ',
              style: gridBoldedTextStyle(null),
            ),
            Text(
              '${getTextOrEmptyString(value.value)}',
              style: normalGridTextStyle(null),
            ),
          ],
        ),
      ],
    );
  }

  getFirstRowItems() {
    List<Widget> columnsValues = [];
    int itemsCount =
        (widget.dataSource.length <= 3) ? widget.dataSource.length : 3;
    for (int index = 0; index < itemsCount; index++) {
      columnsValues.add(Row(
        children: <Widget>[
          Text(
            getTextOrEmptyString(widget.dataSource[index].caption) + ": ",
            style: gridBoldedTextStyle(null),
          ),
          Text(
            getTextOrEmptyString(widget.dataSource[index].value),
            style: normalGridTextStyle(null),
          ),
        ],
      ));
    }
    return columnsValues;
  }

  initializePresenter() {
    _levelDeletePresenter = MultiLevelDeletePresenter(
      view: this,
      context: context,
      dataSource: widget.dataSource,
      isSortScreen: widget.isSortScreen,
      multiLevelUDA: widget.multiLevelUDA,
      multiLevelRowData: widget.multiLevelRowData,
      multiLevelRowIndex: widget.multiLevelRowIndex,
      objectRecId: widget.objectRecId,
      onEditRefresh: widget.onEditRefresh,
      ondelete: widget.ondelete,
      formMode: widget.formMode,
      fullList: widget.fullList,
      repositoryID: widget.repositoryID,
      isReadOnly: widget.isReadOnly,
      isMandatory: widget.isMandatory,
    );
  }

  @override
  void updateItemView() {
    setState(() {});
  }
}
