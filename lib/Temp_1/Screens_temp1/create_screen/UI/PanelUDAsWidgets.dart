import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/SubPanelUda.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/Template1/Temp1UDAsPanelsWidgetsPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/UDAsPanelsWidgetsPresenter.dart';
import 'package:templets/Utilities/const.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:flutter/material.dart';

enum UDA {
  numeric,
  textFiels,
  memo,
  valueList,
  date,
  note,
  checkBox,
  calculatedField,
  autoID,
  helpUDA,
}

class PanelUDAsWidgets extends StatefulWidget {
  final FormModes mode;
  final int objectRecId;
  final List<UDAsWithValues> udas; //Current panel UDAs
  final List<UDAsWithValues>
      fullUDAsList; //Current form whole UDAs -for all panels-
  final List<SubPanelUda> subPanels;
  final Function(List<UDAsWithValues>) onUDAsValueChange;
  final GenericObject genericObject;
  final String location;
  PanelUDAsWidgets({
    this.mode,
    this.udas,
    this.onUDAsValueChange,
    this.objectRecId,
    this.subPanels,
    this.fullUDAsList,
    this.genericObject,
    this.location,
  });

  @override
  _PanelUDAsWidgetsState createState() => _PanelUDAsWidgetsState();
}

class _PanelUDAsWidgetsState extends State<PanelUDAsWidgets>
    implements PanelsViewInterface {
  Temp1UDAsPanelsWidgetsPresenter udasPanelsWidgetsPresenter;

  @override
  void initState() {
    super.initState();
    initializePresenter();
    udasPanelsWidgetsPresenter.initializeUDAsItems();
    udasPanelsWidgetsPresenter.getUDAsListWidgets(true);
  }

  @override
  void didUpdateWidget(PanelUDAsWidgets oldWidget) {
    super.didUpdateWidget(oldWidget);
    updatePresenter();
    udasPanelsWidgetsPresenter.fullUDAsList.forEach((uda) {
      log(LogType.DEBUG, "${uda.udaCaption} UDA Value ==== ${uda.udaValue}");
    });

    udasPanelsWidgetsPresenter.getUDAsListWidgets(false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: udasPanelsWidgetsPresenter.udasWidgets);
  }

  //Initializations
  initializePresenter() {
    udasPanelsWidgetsPresenter = Temp1UDAsPanelsWidgetsPresenter();
    udasPanelsWidgetsPresenter.udasView = this;
    udasPanelsWidgetsPresenter.objectRecId = widget.objectRecId;
    udasPanelsWidgetsPresenter.udas = widget.udas;
    udasPanelsWidgetsPresenter.subPanels = widget.subPanels;
    udasPanelsWidgetsPresenter.onUDAsValueChange = widget.onUDAsValueChange;
    udasPanelsWidgetsPresenter.genericObject = widget.genericObject;
    udasPanelsWidgetsPresenter.location = widget.location;
    udasPanelsWidgetsPresenter.fullUDAsList = widget.fullUDAsList;
    udasPanelsWidgetsPresenter.mode = widget.mode;
  }

  updatePresenter() {
//    udasPanelsWidgetsPresenter.mode = widget.mode;
    udasPanelsWidgetsPresenter.udas = widget.udas;
    udasPanelsWidgetsPresenter.subPanels = widget.subPanels;
    udasPanelsWidgetsPresenter.location = widget.location;
  }

  @override
  void updateWidgetOfPanelsAndUDAs() {
    setState(() {});
  }
}
