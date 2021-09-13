import 'package:flutter/material.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBarTemplate1/NTGAppBar.dart';
import 'package:templets/Utilities/WidgetsUtilites/RaisedButton.dart';
import 'package:templets/Utilities/WidgetsUtilites/RaisedButtonWidget.dart';
import 'package:templets/Utilities/WidgetsUtilites/buildTextFieldMethods.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/dropdownfield.dart';
import 'MonitorScreenWithRefactoring.dart';

class FilteredSearchAsWeb extends StatefulWidget {
  @override
  _FilteredSearchAsWebState createState() => _FilteredSearchAsWebState();
}

class _FilteredSearchAsWebState extends State<FilteredSearchAsWeb> {
  List<String> templatesNames = ["temp1,temp2"];
  List<String> relationList = ["=", ">"];

  @override
  Widget build(BuildContext context) {
//    why not init

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: true,
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Stack(
            children: <Widget>[
              monitorFilterSearchScreenBody(),
            ],
          ),
        ),
        backgroundColor: WHITE,
        appBar: NTGAppBar(
            appBarType: AppBarType.appBarWithBack, pageName: "filter"),
      ),
    );
  }

  Widget monitorFilterSearchScreenBody() {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Container(child: filterByListWidget()),
        SizedBox(
          height: getScreenHeight(context) * 0.02,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(
                    // left: getScreenWidth(context) * 0.11,
                    right: getScreenWidth(context) * 0.01),
                child: NTGButton(
                  buttonText: "filter data",
                  fontSizePercentage: 0.025,
                  onPressedButton: (){},
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(
                  left: getScreenWidth(context) * 0.01,
                  // right: getScreenWidth(context) * 0.11,
                ),
                child: NTGButton(
                  buttonText: "find all data",
                  fontSizePercentage: 0.025,
                  onPressedButton: (){},

                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: getScreenHeight(context) * 0.0095,
        ),
        BlueRaisedButtonWidget(
          hinttext: "save template",
          onpressed: (){},
        ),
        SizedBox(
          height: getScreenHeight(context) * 0.0095,
        ),
        deleteTempButton(context)
      ],
    );
  }

  Widget filterByListWidget() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 7, bottom: 7),
        child: filterByBody(),
      ),
    );
  }

  filterByBody() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(5),
          child: Column(
            children: <Widget>[
              SizedBox(height: getScreenHeight(context) * 0.49),
              getQueryTextField()
            ],
          ),
        ),
        drawOperatorAndAddQueryWidget(),
        Container(
          padding: EdgeInsets.all(5),
          child: Column(
            children: <Widget>[
              SizedBox(height: getScreenHeight(context) * 0.08),
              Row(
                children: <Widget>[
                  LabelTitle("filter by", context, true),
                  Spacer(),
                ],
              ),
              SizedBox(height: getScreenHeight(context) * 0.1),
              getParsedWidget(),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          child: Column(
            children: <Widget>[
              SizedBox(height: getScreenHeight(context) * 0.12),
              filterStelectOptionDropDownWidget(0),
            ],
          ),
        ),
        selectTemplateDropDownWidget(),
      ],
    );
  }

  Widget selectTemplateDropDownWidget() {
    return DropDownField(
      context: context,
      hintText: "select template",
      items: templatesNames,
    );
  }

  Widget drawOperatorAndAddQueryWidget() {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          SizedBox(height: getScreenHeight(context) * 0.36),
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
      hintText: "option",
      items: removeEmptyItem(operatorsList),
      // textStyle: FontUtils.dynamicHintsTextStyle(BLACK, 0.002, context),
    );
  }

  Widget getQueryTextField() {
    return TextFormField(
        decoration: getInputDecoration(
      context,
      'Enter Query',
      null,
      GREY,
      null,
    ));
  }

  Widget filterStelectOptionDropDownWidget(int position) {
    return DropDownField(
      context: context,
      hintText: "select option",
      items: templatesNames,
    );
  }

  Widget addQueryButton() {
    return IconButton(
      icon: Image.asset(
        BTN_ADD_GRID_BLUEE,
      ),
    );
  }

  Widget getParsedWidget() {
    return FilterByRelationAndValueWidget();
  }

  FilterByRelationAndValueWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: getScreenWidth(context) * 0.25,
//          height: getScreenHeight(context)*0.13,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                LabelTitle("relation", context, true),
                Container(
                  width: getScreenWidth(context) * 0.25,
                  child: DropDownField(
                    context: context,
                    hasIcon: false,
                    hintText: '',
                    items: relationList,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: getScreenWidth(context) * 0.06,
        ),
        Container(
            width: getScreenWidth(context) * 0.58,
//          height: getScreenHeight(context)*0.13,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                LabelTitle("equal to", context, true),
                FilterByRelationAndVal()
              ],
            )),
      ],
    );
  }

  FilterByRelationAndVal() {
    return TextFormField(
      decoration:
          getInputDecoration(context, '', IMG_PROFILE_PLACEHOLDER, GREY, () {}),
    );
  }

  FilterByRelationAndMultiValues() {
    // for setting filter value
    return DropDownField(
      context: context,
      hasIcon: true,
      hintText: "choose",
      items: templatesNames,
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
            hasIcon: false,
            hintText: "caption",
            items: templatesNames,
          ),
        ],
      ),
    );
  }

  Widget deleteTempButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: getScreenHeight(context) * 0.07,
      child: RaisedButton(
        onPressed: (){},
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(color: Main_Red)),
        elevation: 0.5,
        textColor: Main_Red,
        color: Colors.white,
//        disabledColor: Main_Red,
        child: Text("delete temp", style: normalTextStyle),
      ),
    );
  }
//  FilterByDate() {
//    return Row(
//      children: <Widget>[
//        Expanded(
//          flex: 1,
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              DateUDA(
//                isMandatory: true,
//                isVisible: true,
//              ),
//            ],
//          ),
//        ),
//        Center(child: Text('   -   ')),
//        Expanded(
//          flex: 1,
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              DateUDA(
//                isMandatory: true,
//                isVisible: true,
//              )
//            ],
//          ),
//        ),
//      ],
//    );
//  }

}
