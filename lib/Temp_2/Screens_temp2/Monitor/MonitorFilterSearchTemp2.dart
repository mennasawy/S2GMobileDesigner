import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2BasicTextInputUDA.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBars.dart';
import 'package:templets/Utilities/WidgetsUtilites/RaisedButton.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/BasicButton.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/DecorationUtils.dart';
import 'package:templets/Utilities/WidgetsUtilites/buildTextFieldMethods.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/dropdownfield.dart';

class MonitorFilterSearchTemp2 extends StatefulWidget {
  @override
  _MonitorFilterSearchTemp2State createState() =>
      _MonitorFilterSearchTemp2State();
}

class _MonitorFilterSearchTemp2State extends State<MonitorFilterSearchTemp2> {
  List<String> list = ["item 1", "item2", "item3"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: WHITE,
        resizeToAvoidBottomPadding: true,
        resizeToAvoidBottomInset: true,
        appBar: Template2AppBars(
          appBarType: Template2AppBarType.secendary,
          screenName: "filter",
        ),
        body: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Stack(
            children: <Widget>[
              buildMonitorFilterSearchBody(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMonitorFilterSearchBody() {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        filterBodyWidget(),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(
                    left: getScreenWidth(context) * 0.11,
                    right: getScreenWidth(context) * 0.01),
                child: BasicButton(
                  buttonText: "filter",
                  buttonHeight: getScreenHeight(context) * 0.09,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(
                    left: getScreenWidth(context) * 0.01,
                    right: getScreenWidth(context) * 0.11),
                child: BasicButton(
                  buttonText: "find all data",
                  buttonHeight: getScreenHeight(context) * 0.09,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: getScreenHeight(context) * 0.0095,
        ),
        BlueRaisedButtonWidget(
          hinttext: "save",
        ),
        SizedBox(
          height: getScreenHeight(context) * 0.0095,
        ),
        BlueRaisedButtonWidget(
          hinttext: "delete template",
          color: "FFDC3B41",
        )
      ],
    );
  }

  Widget filterBodyWidget() {
    return Container(
      padding: EdgeInsets.only(top: 7, bottom: 7),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: getScreenHeight(context) * 0.61),
                filterQueryTextField(),
              ],
            ),
          ),
          drawOperatorAndAddQueryWidget(),
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: getScreenHeight(context) * 0.345),
                getParsedWidget(),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: getScreenHeight(context) * 0.08),
                Row(
                  children: <Widget>[
                    LabelTitle("filter by", context, true),
                    Spacer(),
                  ],
                ),
                SizedBox(height: getScreenHeight(context) * 0.1),
                LabelTitle("relation", context, true),
                buildFilterRelationListWidget(),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                SizedBox(height: getScreenHeight(context) * 0.12),
                filterByOptionsDropDownWidget(),
              ],
            ),
          ),
          getTemplatesWidget(),
        ],
      ),
    );
  }

  Widget getTemplatesWidget() {
    return DropDownField(
        context: context,
        items: list,
        dropDownInputDecoration: getTextFieldInputDecoration(
            hintText: "select template",
            isPrefixIcon: false,
            iconName: IC_DROPDOWN,
            iconColor: GREY));
  }

  Widget filterByOptionsDropDownWidget() {
    return DropDownField(
        context: context,
        items: list,
        dropDownInputDecoration: getTextFieldInputDecoration(
            hintText: "select option",
            isPrefixIcon: false,
            iconName: IC_DROPDOWN,
            iconColor: GREY));
  }

  Widget getParsedWidget() {
    return FilterByRelationAndValueWidget();
  }

  FilterByRelationAndValueWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        LabelTitle("label", context, true),
        FilterByRelationAndVal(),
      ],
    );
  }

  FilterByRelationAndVal() {
    return TextField(
      decoration: getTextFieldInputDecoration(),
    );
  }

  FilterByRelationAndMultiValues() {
    return DropDownField(
      context: context,
      dropDownInputDecoration: getTextFieldInputDecoration(
          hintText: "choose",
          isPrefixIcon: false,
          iconName: IC_DROPDOWN,
          iconColor: GREY),
      items: list,
    );
  }

  FilterByMultiChoice(String caption) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          LabelTitle(caption, context, true),
          DropDownField(
            context: context,
            items: list,
            dropDownInputDecoration: getTextFieldInputDecoration(
                hintText: "choose",
                isPrefixIcon: false,
                iconName: IC_DROPDOWN,
                iconColor: GREY),
          ),
        ],
      ),
    );
  }

  FilterByDate() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
//              DateUDA(
//                  name:"from",
////                  initialValue: _presenter.filter.filterBystartDateValue ?? '',
////                  dateType: _presenter.filter.filterDatetype,
//                  isMandatory: true,
//                  isVisible: true,
//                  dateInputDecoration: getDateInputDecoration(
//                    isPrefixIcon: true,
//                    icon: buildHeaderIcons(
//                        iconName: getDateIcon(), bgColor: WHITE, margin: 6),
//                  )),
            ],
          ),
        ),
        Center(child: Text('   -   ')),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
//              DateUDA(
//                name: AppLocalizations.of(context).translate("to"),
//                initialValue: _presenter.filter.filterByEndDateValue ?? '',
//                dateType: _presenter.filter.filterDatetype,
//                onValueChange: ((value) {
//                  setState(() {
//                    _presenter.filter.filterByEndDateValue = value;
//                  });
//                }),
//                isMandatory: true,
//                isVisible: true,
//                dateInputDecoration: getDateInputDecoration(
//                  isPrefixIcon: true,
//                  icon: buildHeaderIcons(
//                      iconName: getDateIcon(), bgColor: WHITE, margin: 6),
//                ),
//              )
            ],
          ),
        ),
      ],
    );
  }

  String getDateIcon() {
//    switch (_presenter.filter.filterDatetype) {
//      case DateType.dateAndTime:
//        return TEMP2_DATE_TIME;
//        break;
//      case DateType.timeOnly:
//        return TEMP2_TIME;
//        break;
//      case DateType.dateOnly:
    return TEMP2_DATE;
//        break;
//    }
  }

  Widget buildFilterRelationListWidget() {
    return Container(
      height: 40,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) => buildFilterSearchButtons(
            buttonText: list[index],
            width: 40,
            color: Colors.grey[300],
            textColor: BLACK),
      ),
    );
  }

  Widget filterQueryTextField() {
    return TextFormField(
//      title: "",
//      isVisible: true,
      decoration: getTextFieldInputDecoration(),
    );
  }

  Widget drawOperatorAndAddQueryWidget() {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          SizedBox(height: getScreenHeight(context) * 0.47),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: getScreenWidth(context) * 0.25,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      LabelTitle("operator", context, false),
                      Container(
                        width: getScreenWidth(context) * 0.30,
                        child: filterOperatorDropDownList(),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  width: getScreenWidth(context) * 0.30,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: getScreenHeight(context) * 0.035),
                      addQueryButton(),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget filterOperatorDropDownList() {
    List<String> operatorsList = ["AND", "OR"];
    return DropDownField(
        context: context,
        items: operatorsList,
        dropDownInputDecoration: getTextFieldInputDecoration(
            hintText: "save ",
            isPrefixIcon: false,
            iconName: IC_DROPDOWN,
            iconColor: GREY));
  }

  Widget addQueryButton() {
    return IconButton(
      icon: Image.asset(
        BTN_ADD_GRID_BLUEE,
      ),
    );
  }

  Widget setTemplateName(
      BuildContext context, getTemplateName, onSaveTemplateNameButtonAction) {
    return Container(
      width: getScreenWidth(context) * 0.9,
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset(IC_CLOSE_X)),
            ],
          ),
          Temp2BasicTextInputUDA(
            title: "template",
            isMandatory: true,
            isVisible: true,
//            inputDecoration: getTextFieldInputDecoration(
//                hintText: AppLocalizations.of(context).translate("temp_name")),
            onValueChange: getTemplateName,
          ),
          SizedBox(
            height: 7,
          ),
          BasicButton(
            buttonText: "save",
          )
        ],
      ),
    );
  }
}
