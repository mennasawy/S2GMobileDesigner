import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Utilities/WidgetsUtilites/DateWidget.dart';
import 'package:templets/Utilities/WidgetsUtilites/RaisedButtonWidget.dart';
import 'package:templets/dropdownfield.dart';
import 'package:flutter/material.dart';

class AddNewtasklscreen2 extends StatelessWidget {
  static const routeName = '/taskscreen1';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              backgroundColor: WHITE,
              leading: InkWell(
                onTap: () {},
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black54,
                ),
              ),
              title: const Text(
                'Add New task',
                style: TextStyle(
                    fontFamily: 'Tahoma',
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              )),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: Column(
                children: <Widget>[
                  //Task Name Field
                  getTextFieldWithTitle(
                      'Task Name', 'Task Name Goes Here', false, context),
                  //Task Urgency Field
                  getDropDownFieldWithTitle(
                      'Task Urgency', 'Select Option', context),

                  SizedBox(
                    height: 6,
                  ),
//                Stack(
//                  children: <Widget>[
                  getTextFieldWithTitle(
                      'Assign Task', '@ name here', false, context),

                  getDropDownFieldWithTitle(
                      'Task Panel', 'Select Option', context),
                  SizedBox(
                    height: 10,
                  ),

                  getStartEndDateWidget(context),
                  //Task Description Field
                  getTextFieldWithTitle('Task Description',
                      'Task Description Goes Here', true, context),

                  SizedBox(
                    height: 10,
                  ),
                  NTGButton(
                    buttonText: 'Save Task',
                    onPressedButton: () {},
                  )
//                  ],
//                ),
                ],
              ),
            ),
          )),
    );
  }

  Widget getTextFieldWithTitle(
      String title, String hintText, bool hasMultipleLines, context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
              text: title,
              style: labelTextStyle,
            ),
            (title != 'Assign Task')
                ? TextSpan(text: ' *', style: labelMandatoryTextStyle)
                : TextSpan(
                    text: '',
                  )
          ])),
          SizedBox(
            height: 5,
          ),
          TextField(
            readOnly: true,
            decoration: getInputDecoration(context, hintText, null, null, null),
            maxLines: hasMultipleLines ? 6 : 1,
          )
        ],
      ),
    );
  }

  Widget getDropDownFieldWithTitle(String title, String hintText, context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
              text: title,
              style: labelTextStyle,
            ),
            title != 'Task Panel'
                ? TextSpan(text: ' *', style: labelMandatoryTextStyle)
                : TextSpan(text: '')
          ])),
          SizedBox(
            height: 5,
          ),
          DropDownField(
            enabled: false,
            hintText: hintText,
            context: context,
            items: [],
            required: false,
          )
        ],
      ),
    );
  }

  Widget getStartEndDateWidget(context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 10),
      width: getScreenWidth(context),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Start Date
              Container(
                  padding: EdgeInsets.only(right: 8),
                  width: (getScreenWidth(context) / 2) - 20,
                  child: getDateFieldWithTitle('Start Date', 'Pick Date')),
              Container(
                margin: EdgeInsets.only(top: 25),
                height: 1,
                width: 5,
                color: BLACK,
              ),
              //End Date
              Container(
                  padding: EdgeInsets.only(left: 8),
                  width: (getScreenWidth(context) / 2) - 20,
                  child: getDateFieldWithTitle('End Date', 'Pick Date')),
            ],
          ),
        ],
      ),
    );
  }

  Widget getDateFieldWithTitle(String title, String hintText) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RichText(
            text: TextSpan(children: <TextSpan>[
          TextSpan(
            text: title,
            style: labelTextStyle,
          ),
          TextSpan(text: ' *', style: labelMandatoryTextStyle)
        ])),
        SizedBox(
          height: 5,
        ),
        DateWidget(
          enabled: false,
          hintText: hintText,
        )
      ],
    );
  }
}
