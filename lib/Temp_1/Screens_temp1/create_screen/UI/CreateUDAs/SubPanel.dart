import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/SubPanelUda.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/PanelUDAsWidgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/createFunctions.dart';

class SubPanel extends StatefulWidget {
  final String panelTitle;
  final FormModes mode;
  final int objectRecId;
  final GenericObject genericObject;
  final List<UDAsWithValues> udas;
  final List<UDAsWithValues> fullUDAs;
  final List<SubPanelUda> subPanels;
  final Function(List<UDAsWithValues>) onUDAsValueChange;

  const SubPanel({
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
  _SubPanelState createState() => _SubPanelState();
}

class _SubPanelState extends State<SubPanel> {
  @override
  Widget build(BuildContext context) {
    return drawWidgetOrEmptyContainer(
        arePanelUDAsVisible(widget.udas),
        getUDAWithTitleWidget(context, getSubPanelWidget(), widget.panelTitle,
            null, null, false, false, null));
  }

  DottedBorder getSubPanelWidget() {
    return DottedBorder(
        borderType: BorderType.RRect,
        dashPattern: [7, 3],
        strokeWidth: 2,
        radius: Radius.circular(TEXTFIELD_BORDER_RADUIS),
        color: DARK_GREY.withOpacity(0.25),
        padding: EdgeInsets.all(1),
        child: Container(
          child: PanelUDAsWidgets(
            mode: widget.mode,
            udas: widget.udas,
            objectRecId: widget.objectRecId,
            fullUDAsList: widget.fullUDAs,
            subPanels: widget.subPanels,
            genericObject: widget.genericObject,
            onUDAsValueChange: widget.onUDAsValueChange,
          ),
        ));
  }
}
