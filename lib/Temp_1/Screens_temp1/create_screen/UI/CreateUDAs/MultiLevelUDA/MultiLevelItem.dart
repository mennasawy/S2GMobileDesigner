import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MultipleLevel/MultipleLevelRowData.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/MultiLevelUDA/MultiLevelDeletePresenter.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridCols.dart';

class MultiLevelItem extends StatefulWidget {
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

  MultiLevelItem({
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
  _MultiLevelItemState createState() => _MultiLevelItemState();
}

class _MultiLevelItemState extends State<MultiLevelItem>
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
        : Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: ConfigurableExpansionTile(
              initiallyExpanded: false,
              headerExpanded: Container(
                width: (widget.fullList == true)
                    ? getScreenWidth(context) - 40
                    : getScreenWidth(context) * 0.80,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      ...widget.dataSource
                              .map<Widget>(
                                  (value) => moreThanThreeItemsOfList(value))
                              .toList() ??
                          null,
                      SizedBox(height: 3),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.start, // spaceEvenly
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: getEditIconWidget(30),
                          ),
                          Expanded(
                            flex: 1,
                            child: getDeleteIconWidget(),
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
                width: (widget.fullList == true)
                    ? getScreenWidth(context) - 40
                    : getScreenWidth(context) * 0.80,
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
            ),
          );
  }

  Widget getDeleteIconWidget() {
    return drawWidgetOrEmptyContainer(
        widget.isReadOnly != true,
        _iconButton(IC_DELETE, () {
          setState(() {
            _levelDeletePresenter.deleteItem();
          });
        }));
  }

  Widget getEditIconWidget(double iconSize) {
    IconButton editIcon = IconButton(
      icon: Icon(Icons.phone_iphone),
      onPressed: _levelDeletePresenter.onEditIconTapped,
    );
    return drawWidgetOrEmptyContainer(widget.isReadOnly != true, editIcon);
  }

  _iconButton(String image, Function onTap) {
    return IconButton(
      icon: Icon(Icons.phone_iphone),
      onPressed: onTap,
    );
  }

  Widget firstRowInCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          getTextOrEmptyString(widget.dataSource[0].caption) + " :",
          style: gridBoldedTextStyle(null),
        ),
        Text(
          getTextOrEmptyString(widget.dataSource[0].value),
          style: normalGridTextStyle(null),
        ),
        Spacer(),
        getEditIconWidget(30),
      ],
    );
  }

  Widget moreThanThreeItemsOfList(GridCols value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: Row(
            children: <Widget>[
              Text(
                '${getTextOrEmptyString(value.caption)}:',
                style: gridBoldedTextStyle(null),
              ),
              Text(
                '${getTextOrEmptyString(value.value)}',
                style: normalGridTextStyle(null),
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
        (widget.dataSource.length <= 3) ? widget.dataSource.length : 3;
    for (int index = 1; index < itemsCount; index++) {
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
