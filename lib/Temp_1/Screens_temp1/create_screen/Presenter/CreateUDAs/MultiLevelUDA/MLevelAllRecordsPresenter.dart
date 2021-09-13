import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridCols.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MultipleLevel/MultipleLevelRowData.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/MultiLevelUDA/AddEditMultiLevelPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/MultiLevelUDA/AddMultiLevelScreen.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/const.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/MultiLevelUDA/Temp2AddMultiLevelScreen.dart';

abstract class MiltiLevelAllRowsViewInterface {
  updateAllGridRowsScreen();
}

class MultiLevelAllRowsScreenPresenter {
  final Function(List<MultipleLevelRowData>) onAddRows;
  final List<List<GridCols>> gridRowsValues;
  final List<MultipleLevelRowData> rowListItems;
  final UDAsWithValues multiLevelUDA;
  final Function onEditRefresh;
  final FormModes formMode;
  final int repositoryID;
  final int objectRecId;

  final BuildContext context;
  final MiltiLevelAllRowsViewInterface view;

  TextEditingController editingController = TextEditingController();
  String searchTyping = "";
  bool isInSearch = false;
  bool isSortByStartDateClicked = false;
  bool isSortByAscendingClicked = false;
  bool sortButtonClicked = false;
  List<String> cn = [];
  String indexc = "";
  String selectedtype = "";
  String Sort;
  List SortType = ["Ascending", "Descending"];

  MultiLevelAllRowsScreenPresenter({
    this.repositoryID,
    this.onAddRows,
    this.gridRowsValues,
    this.rowListItems,
    this.multiLevelUDA,
    this.onEditRefresh,
    this.formMode,
    this.objectRecId,
    this.context,
    this.view,
  });

  sortElements() {
    getCaption();
    sortButtonClicked = !sortButtonClicked;
    if (!sortButtonClicked) {
      isSortByStartDateClicked = false;
      isSortByAscendingClicked = false;
    }
    view.updateAllGridRowsScreen();
  }

  List<String> getCaption() {
    cn.clear();
    if (gridRowsValues.length != null || gridRowsValues.length != 0) {
      List<GridCols> sorttypesname = gridRowsValues[0];

      for (int x = 0; x < sorttypesname.length; x++) {
        GridCols gridCols = new GridCols();
        String s = sorttypesname[x].caption;
        cn.add(s);
      }
      return cn;
    } else {
      cn = ["no values"];
      return cn;
    }
  }

  onSortButtonTapped() {
    sortButtonClicked = !sortButtonClicked;
    isSortByAscendingClicked = false;
    isSortByStartDateClicked = false;
    view.updateAllGridRowsScreen();
  }

  sortCardColor() {
    return sortButtonClicked ? Colors.black54 : Colors.white;
  }

  onAddNewRowTapped() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => AddMultiLevelScreen(
                  repositoryID: repositoryID,
                  mode: AddMultiLevelMode.newMode,
                  multiLevelRecID: multiLevelUDA.recId,
                  multiLevelUDA: multiLevelUDA,
                  formMode: formMode,
                  objectRecId: objectRecId,
                  // rowListItems: gridRowsValues,
                ))).then((value) async {
      if (value != null) await refreshRowsList(value);
    });
  }

  temp2OnAddNewRowTapped() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => Temp2AddMultiLevelScreen(
                  repositoryID: repositoryID,
                  mode: AddMultiLevelMode.newMode,
                  multiLevelRecID: multiLevelUDA.recId,
                  multiLevelUDA: multiLevelUDA,
                  formMode: formMode,
                  objectRecId: objectRecId,
                  // rowListItems: gridRowsValues,
                ))).then((value) async {
      if (value != null) await refreshRowsList(value);
    });
  }

  Future<void> refreshRowsList(rowList) async {
    if (rowList.gridRowDataMode == AddMultiLevelMode.newMode) {
      gridRowsValues.add(rowList.columnsList);
      rowListItems.add(rowList);
      onAddRows(rowListItems);
    } else {
      gridRowsValues[rowList.rowIndex] = rowList.columnsList;
      rowListItems[rowList.rowIndex] = rowList;
      onAddRows(rowListItems);
    }
    view.updateAllGridRowsScreen();
    return null;
  }

  void downloadAction() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        backgroundColor: WHITE,
        context: context,
        builder: (builder) {
          return Container(
            height: getScreenHeight(context) * 0.25,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  title: Center(
                    child: Text(
                      'Save as Excel (.xlsx)',
                      //  AppLocalizations.of(context).translate('save_as_excel'),
                      style: normalTextStyle,
                    ),
                  ),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  title: Center(
                    child: Text(
                      'Save as PDF (.pdf)',
                      //  AppLocalizations.of(context).translate('save_as_pdf'),
                      style: normalTextStyle,
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          );
        });
  }

  onCloseOrSortIconTapped() {
    return gridRowsValues.length == null || gridRowsValues.length == 0
        ? Container()
        : sortElements();
  }

  onShowStartDateTapped() {
    isSortByStartDateClicked = !isSortByStartDateClicked;
    isSortByAscendingClicked = false;
    view.updateAllGridRowsScreen();
  }

  onShowAscendingButtonTapped() {
    isSortByAscendingClicked = !isSortByAscendingClicked;
    isSortByStartDateClicked = false;
    view.updateAllGridRowsScreen();
  }

  onSortBySelected(int index) {
    selectedtype = cn[index];
    indexc = selectedtype;
    sortRows(Sort);
    log(LogType.ERROR, "Selected type ====== $selectedtype");
    if (!isEmptyText(Sort)) {
      sortButtonClicked = !sortButtonClicked;
    }
    isSortByStartDateClicked = !isSortByStartDateClicked;
    view.updateAllGridRowsScreen();
  }

  sortRows(String s) {
    if (s == "Ascending") {
      gridRowsValues.sort((a, b) {
        return a
            .firstWhere((item) => item.caption == selectedtype)
            .value
            .compareTo(
                b.firstWhere((item) => item.caption == selectedtype).value);
      });
    } else {
      gridRowsValues.sort((b, a) {
        return a
            .firstWhere((item) => item.caption == selectedtype)
            .value
            .compareTo(
                b.firstWhere((item) => item.caption == selectedtype).value);
      });
    }
    view.updateAllGridRowsScreen();
  }

  onAscendingDescendingSelected(int index) {
    Sort = SortType[index];
    if (!isEmptyText(selectedtype)) {
      sortRows(Sort);
      sortButtonClicked = !sortButtonClicked;
    }
    isSortByAscendingClicked = !isSortByAscendingClicked;
    view.updateAllGridRowsScreen();
  }

  Future<void> refreshRowsListonDelete(int index) async {
    await Future.delayed(Duration(seconds: 0));
    gridRowsValues.removeAt(index);
    rowListItems.removeAt(index);
    view.updateAllGridRowsScreen();
  }
}
