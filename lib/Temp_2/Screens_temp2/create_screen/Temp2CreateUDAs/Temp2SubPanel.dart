import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/SubPanelUda.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/createFunctions.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/Temp2WidgetsWithBorder.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2PanelUDAsWidgets.dart';

class Temp2SubPanel extends StatefulWidget {
  final String panelTitle;
  final FormModes mode;
  final GenericObject genericObject;
  final int objectRecId;
  final List<UDAsWithValues> udas;
  final List<UDAsWithValues> fullUDAs;
  final List<SubPanelUda> subPanels;
  final Function(List<UDAsWithValues>) onUDAsValueChange;

  const Temp2SubPanel({
    Key key,
    this.udas,
    this.onUDAsValueChange,
    this.panelTitle,
    this.subPanels,
    this.mode,
    this.objectRecId,
    this.fullUDAs,
    this.genericObject,
  }) : super(key: key);

  @override
  _Temp2SubPanelState createState() => _Temp2SubPanelState();
}

class _Temp2SubPanelState extends State<Temp2SubPanel> {
  @override
  Widget build(BuildContext context) {
    return drawWidgetOrEmptyContainer(
        arePanelUDAsVisible(widget.udas),
        getUDAWithTitleWidget(
            context, getSubPanelWidget(), "", null, null, false, false, null));
  }

  Temp2WidgetBorder getSubPanelWidget() {
    return Temp2WidgetBorder(
        isMandatoryUDA: false,
        title: widget.panelTitle,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Temp2PanelUDAsWidgets(
            mode: widget.mode,
            udas: widget.udas,
            objectRecId: widget.objectRecId,
            fullUDAsList: widget.fullUDAs,
            subPanels: widget.subPanels,
            onUDAsValueChange: widget.onUDAsValueChange,
            genericObject: widget.genericObject,
          ),
        ));
  }
}
