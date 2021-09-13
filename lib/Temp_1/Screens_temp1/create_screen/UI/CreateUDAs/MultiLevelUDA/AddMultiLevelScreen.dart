import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridCols.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/MultiLevelUDA/AddEditMultiLevelPresenter.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBarTemplate1/NTGAppBar.dart';
import 'package:templets/Utilities/WidgetsUtilites/RaisedButtonWidget.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/dropdownfield.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/MultiLevelUDA/MultiLevelUDAViewInterface/IGetMultiLevelsView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddMultiLevelScreen extends StatefulWidget {
  final int repositoryID;
  final AddMultiLevelMode mode;
  final int multiLevelRecID;
  final UDAsWithValues multiLevelUDA;
  final int editRowIndex;
  final int objectRecId;
  final FormModes formMode;
  final List<GridCols> rowListItems;

  const AddMultiLevelScreen(
      {Key key,
      this.repositoryID,
      this.mode,
      this.multiLevelRecID,
      this.multiLevelUDA,
      this.editRowIndex,
      this.objectRecId,
      this.formMode,
      this.rowListItems})
      : super(key: key);

  @override
  AddMultiLevelScreenState createState() => AddMultiLevelScreenState();
}

class AddMultiLevelScreenState extends State<AddMultiLevelScreen>
    implements IGetMultiLevelView {
  AddEditMultiLevelPresenter addEditMultiLevelPresenter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePresenter();
    addEditMultiLevelPresenter.initializeItems();
  }

  @override
  Widget build(BuildContext context) {
    addEditMultiLevelPresenter.checkLoadingLevels();
    return SafeArea(
      child: Scaffold(
        appBar: NTGAppBar(
          appBarType: AppBarType.appBarWithBack,
          pageName: widget.multiLevelUDA.udaCaption,
        ),
        body: addEditMultiLevelPresenter.hasValidDataToShow()
            ? Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Expanded(
                        child: lists(),
                      ),
                      NTGButton(
                          buttonText: "Save",
                          onPressedButton:
                              addEditMultiLevelPresenter.onSubmitButtonClicked),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                  drawWidgetOrEmptyContainer(
                      addEditMultiLevelPresenter.isEditingRecord,
                      DrawProgressBar())
                ],
              )
            : DrawProgressBar(),
      ),
    );
  }

  Widget lists() {
    if (addEditMultiLevelPresenter.listCount_tiresName.numberOfLevels != null)
      return Container(
        child: ListView.separated(
            padding: EdgeInsets.all(10.0),
            itemCount:
                addEditMultiLevelPresenter.listCount_tiresName.numberOfLevels,
            separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 30,
                ),
            itemBuilder: (BuildContext context, int index) {
              return Visibility(
                visible: addEditMultiLevelPresenter.visibleList[index],
                child: DropDownField(
                  context: context,
                  enabled: true,
                  items: addEditMultiLevelPresenter
                      .getnameList(addEditMultiLevelPresenter.level[index]),
                  hintText: addEditMultiLevelPresenter.listAddress[index],
                  value: addEditMultiLevelPresenter.levelValueAtIndex(index),
                  setter: (String item) {
                    addEditMultiLevelPresenter.setLevelValue(index, item);
                  },
                  onValueChanged: (String value) {
                    addEditMultiLevelPresenter.onLevelValueChanged(
                        value, index);
                  },
                ),
              );
            }),
      );
    else {
      return Text(addEditMultiLevelPresenter.listCount_tiresName.numberOfLevels
          .toString());
    }
  }

  initializePresenter() {
    addEditMultiLevelPresenter = AddEditMultiLevelPresenter(
      repositoryID: widget.repositoryID,
      mode: widget.mode,
      multiLevelRecID: widget.multiLevelRecID,
      multiLevelUDA: widget.multiLevelUDA,
      editRowIndex: widget.editRowIndex,
      objectRecId: widget.objectRecId,
      formMode: widget.formMode,
      rowListItems: widget.rowListItems,
      context: context,
      igetMultiLevelDataView: this,
    );
  }

  @override
  void updateMultiLevelView() {
    setState(() {});
  }
}

class LevelMultiLevel {
  String tireName;
  String id;

  LevelMultiLevel(this.tireName, this.id);
}
