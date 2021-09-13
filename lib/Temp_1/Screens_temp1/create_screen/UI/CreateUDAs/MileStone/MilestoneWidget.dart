import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MileStoneModel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/MileStone/milestone.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/milestonePresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';

class MilestoneWidget extends StatefulWidget {
  final GenericObject genericObject;
  final UDAsWithValues uda;
  final FormModes mode;
  final int objectRecId;

  MilestoneWidget(
      {Key key, this.genericObject, this.uda, this.mode, this.objectRecId})
      : super(key: key);

  @override
  _MilestoneWidgetState createState() => _MilestoneWidgetState();
}

class _MilestoneWidgetState extends State<MilestoneWidget>
    implements MilestoneInterface {
  MileStonePresenter _presenter = MileStonePresenter();

  // _MilestoneWidgetState() {}
  intializePresenter() {
    _presenter = MileStonePresenter(
      milestoneInterface: this,
      context: context,
    );
  }

  @override
  void initState() {
    intializePresenter();
    _presenter.loadData(widget.mode, widget.objectRecId, widget.genericObject,
        widget.uda, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: !_presenter.isDataLoaded
          ? CircularProgressIndicator()
          : _presenter.canShowMileStone()
              ? buildMilestoneBody(context)
              : planUDAPlaceholder(context),
    );
  }

  Container planUDAPlaceholder(BuildContext context) {
    return Container(
      height: getScreenHeight(context) * 0.1,
      width: getScreenWidth(context) * 0.9,
      decoration: ShapeDecoration(
        shape: buildRoundedRectangleBorder(),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'Plan UDA',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildMilestoneBody(BuildContext context) {
    return Column(
      children: [
        ..._presenter.milestoneObjectList.map((element) {
          return Column(
            children: [
              MilestoneCard(
                  element, _presenter.milestoneObjectList.indexOf(element)),
              if (_presenter.milestoneObjectList.last != element)
                buildConnectingLine(element),
            ],
          );
        })
      ],
    );
  }

  Align buildConnectingLine(MilestoneObject element) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 50,
        width: 0,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
                color: Color(
                  int.parse(
                    '0xFF' + element.fkcolor.replaceAll('#', ''),
                  ),
                ),
                width: 2),
          ),
        ),
      ),
    );
  }

  RoundedRectangleBorder buildRoundedRectangleBorder() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: BorderSide(
        color: Colors.black.withOpacity(0.5),
        width: 1,
      ),
    );
  }

  @override
  void changeState() {
    setState(() {});
  }
}
