import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MileStoneModel.dart';

import 'package:templets/Utilities/utility_methods.dart';
import 'package:flutter/material.dart';

class MilestoneCard extends StatefulWidget {
  final MilestoneObject milestoneObject;
  final int milestoneSeq;

  MilestoneCard(this.milestoneObject, this.milestoneSeq);

  @override
  _MilestoneCardState createState() => _MilestoneCardState();
}

class _MilestoneCardState extends State<MilestoneCard> {
  @override
  Widget build(BuildContext context) {
    String status = widget.milestoneObject.statusname.split("[").first;
    Color borderColor = Color(
      int.parse(
        '0xFF' + widget.milestoneObject.fkcolor.replaceAll('#', ''),
      ),
    );

    return Stack(
      children: [
        Card(
          margin: EdgeInsets.only(top: 0, left: 10),
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: borderColor,
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
            child: Container(
              width: getScreenWidth(context),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildStatus(status, borderColor),
                  SizedBox(
                    height: 10,
                  ),
                  buildDataRow(
                    title: 'Milestone caption :  ',
                    value: widget.milestoneObject.name,
                  ),
                  buildDataRow(
                    title: 'Task name :  ',
                    value: widget.milestoneObject.assignMillstone,
                  ),
                  buildDataRow(
                    title: 'Description :  ',
                    value: widget.milestoneObject.description,
                  ),
                  buildDataRow(
                      title: 'Plan Name :  ',
                      value: widget.milestoneObject.planname),
                  buildDataRow(
                      title: 'Status Name :  ',
                      value: widget.milestoneObject.statusname),
                ],
              ),
            ),
          ),
        ),
        buildSequenceBadge(borderColor),
      ],
    );
  }

  Positioned buildSequenceBadge(Color borderColor) {
    return Positioned(
      top: 0,
      left: 0,
      child: Material(
        // elevation: 10,
        shape: CircleBorder(side: BorderSide(color: borderColor)),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 20,
          child: Text(
            (widget.milestoneSeq + 1).toString(),
            // widget.milestoneObject.seq,
            style: TextStyle(fontWeight: FontWeight.bold, color: borderColor),
          ),
        ),
      ),
    );
  }

  Widget buildDataRow({String title, String value}) {
    return FittedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Container(
            width: getScreenWidth(context) * 0.5,
            child: Text(
              // 'mmmmmmmmmm iihiojio ljjlkjlkjl',
              value ?? '',
              textAlign: TextAlign.start,
              softWrap: true,
              // textWidthBasis: TextWidthBasis.longestLine,
              // overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }

  Widget buildStatus(String status, Color borderColor) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 0, bottom: 5),
        child: Text(
          status,
          style: TextStyle(
              color: borderColor, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
