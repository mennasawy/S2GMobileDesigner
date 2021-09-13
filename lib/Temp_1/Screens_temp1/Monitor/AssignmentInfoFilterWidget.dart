import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Utilities/WidgetsUtilites/RaisedButtonWidget.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/dropdownfield.dart';

class FilterAssignmentInfo extends StatefulWidget {
  @override
  _FilterAssignmentInfoState createState() => _FilterAssignmentInfoState();
}

class _FilterAssignmentInfoState extends State<FilterAssignmentInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.7),
      body: Center(
        child: Container(
          width: getScreenWidth(context) * 0.8,
          height: getScreenHeight(context) * 0.86,
          color: WHITE,
          child: Padding(
              padding: EdgeInsets.all(7), child: drawAssignmentInfoLists()),
        ),
      ),
    );
  }

  Widget drawAssignmentInfoLists() {
    return ListView(shrinkWrap: true, children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
          )
        ],
      ),
      Container(
        decoration: getAssignmentInfoDecoration(),
        padding: const EdgeInsets.all(8.0),
        child: getAssignmentInfoBody(),
      ),
      NTGButton(
        buttonText: "ADD",
      )
    ]);
  }

  Widget getAssignmentInfoBody() {
    return Column(
      children: <Widget>[
        getUDAWithTitleWidget(context, getAssignmentInfoListWidget(), "company",
            "", "", false, false, null),
        SizedBox(
          height: 10,
        ),
        getUDAWithTitleWidget(context, getAssignmentInfoListWidget(),
            "organization", "", "", false, false, null),
        SizedBox(
          height: 10,
        ),
        getUDAWithTitleWidget(context, getAssignmentInfoListWidget(), "group",
            "", "", false, false, null),
        SizedBox(
          height: 10,
        ),
        getUDAWithTitleWidget(context, getAssignmentInfoListWidget(), "member",
            "", "", false, false, null),
      ],
    );
  }

  BoxDecoration getAssignmentInfoDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.black12,
        width: 1,
      ),
    );
  }

  DropDownField getAssignmentInfoListWidget() {
    List<String> assignmentInfoList = ["1", "2"];
    return DropDownField(
      context: context,
      hintText: "Select ..",
      items: assignmentInfoList,
    );
  }
}
