import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridCols.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/Grid/EditGridUDAPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/Grid/Template2/Temp2EditGridUDAPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBars.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/BasicButton.dart';
import 'package:templets/Utilities/utility_methods.dart';

class Temp2AddGridScreen extends StatefulWidget {
  final int gridRecID;
  final int editRowIndex;
  final int objectRecId;

  final AddGridMode mode;
  final FormModes formMode;

  final List<int> rowsRecIDs;
  final UDAsWithValues gridUDA;
  final GenericObject genericObject;
  final List<GridCols> rowListItems;

  Temp2AddGridScreen({
    Key key,
    this.gridUDA,
    this.mode,
    this.rowListItems,
    this.gridRecID,
    this.editRowIndex,
    this.objectRecId,
    this.formMode,
    this.genericObject,
    this.rowsRecIDs,
  }) : super(key: key);

  @override
  _Temp2AddGridScreenState createState() => _Temp2AddGridScreenState();
}

class _Temp2AddGridScreenState extends State<Temp2AddGridScreen>
    implements EditGridUDAViewInterface {
  Temp2EditGridUDAPresenter editGridRowPresenter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePresenter();
    editGridRowPresenter.initializeItems();
  }

  @override
  void didUpdateWidget(covariant Temp2AddGridScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    editGridRowPresenter.updateColumnsWidgets();
  }

  @override
  Widget build(BuildContext context) {
    editGridRowPresenter.loadGridData();
    editGridRowPresenter.updateColumnsWidgets();
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: Template2AppBars(
            appBarType: Template2AppBarType.secendary,
            screenName: widget.gridUDA.udaCaption ?? widget.gridUDA.udaName,
          ),
          body: editGridRowPresenter.isGridDataLoaded
              ? getScreenContentWidget(context)
              : DrawProgressBar()),
    );
  }

  Stack getScreenContentWidget(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(child: getColumnsWidget(context), flex: 8),
            Expanded(child: getSubmitButtonWidget(context), flex: 1),
          ],
        ),
        drawWidgetOrEmptyContainer(
            editGridRowPresenter.isEditingRecord, DrawProgressBar()),
      ],
    );
  }

  Container getColumnsWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      height: getScreenHeight(context) * 0.8,
      child: KeyboardAvoider(
        autoScroll: true,
        child: ListView.builder(
          shrinkWrap: true,
          controller: editGridRowPresenter.columnsListController,
          itemCount: editGridRowPresenter.columnsWidgets.length,
          itemBuilder: (context, index) {
            return editGridRowPresenter.columnsWidgets[index];
          },
        ),
      ),
    );
  }

  Widget getSubmitButtonWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
      child: BasicButton(
        buttonText: 'Save',
        onPressedButton: !editGridRowPresenter.isEditingRecord
            ? () {
                editGridRowPresenter.onSubmitClicked();
              }
            : null,
      ),
    );
  }

  //Initializations
  initializePresenter() {
    editGridRowPresenter = Temp2EditGridUDAPresenter(
      view: this,
      context: context,
      gridRecID: widget.gridRecID,
      editRowIndex: widget.editRowIndex,
      objectRecId: widget.objectRecId,
      mode: widget.mode,
      formMode: widget.formMode,
      rowsRecIDs: widget.rowsRecIDs,
      gridUDA: widget.gridUDA,
      genericObject: widget.genericObject,
      rowListItems: widget.rowListItems,
    );
  }

  @override
  void updateAddRowsView() {
    setState(() {});
  }
}
