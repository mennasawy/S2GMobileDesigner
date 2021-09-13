import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Temp_2/Models/BottomNavigationModel.dart';
import 'package:templets/Temp_2/Screens_temp2/ApplicationsLevels/AppsTempScreen.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBars.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/BottomBarFloatingButton.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/DecorationUtils.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/custom_bottomnav.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/floatingactionbutton_customloc.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class MonitorScreen2 extends StatefulWidget {
  @override
  _MonitorScreen2State createState() => _MonitorScreen2State();
}

enum SearchMode { edit, view }

class _MonitorScreen2State extends State<MonitorScreen2> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
//        resizeToAvoidBottomPadding: true,
        resizeToAvoidBottomInset: true,
        key: _scaffoldKey,
        backgroundColor: GREY,
        // ThemeManager.themeColor(
        //     ThemeSection.mainScreenBackground, ThemeProperty.backgroundColor),
        appBar: Template2AppBars(
          appBarType: Template2AppBarType.secendary,
          screenName: "monitor",
        ),
//        drawer: Consumer<SelectedAppScreenProvider>(
//            builder: (context, selectedAppScreen, child) {
//          return AppModulesCustomDrawer();
//        }),
        body: Container(margin: EdgeInsets.all(5), child: buildMonitorBody()),
        bottomNavigationBar: BottomNavigatioBar(
          context: context,
          screenType: ScreenType.apps,
        ),
        floatingActionButton: BottomBarFloatingbutton(
          onFloatingButtonAction: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return AppsTempScreen(
                  onAppSelection: () {
                    Navigator.of(context, rootNavigator: true).pop();
                    _scaffoldKey.currentState.openDrawer();
                  },
                );
              },
            );
          },
        ),
        floatingActionButtonAnimator: NoScalingAnimation(),
        floatingActionButtonLocation: CustomFloatingActionButtonLocation(0, 25),
      ),
    );
  }

  Widget monitorContent() {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
      key: _scaffoldKey,
      backgroundColor: GREY,
      // ThemeManager.themeColor(
      //     ThemeSection.mainScreenBackground, ThemeProperty.backgroundColor),
      appBar: Template2AppBars(
        appBarType: Template2AppBarType.main,
        screenName: "monitor",
      ),
      body: Container(margin: EdgeInsets.all(5), child: buildMonitorBody()),
    );
  }

  Widget buildMonitorBody() {
    return Column(
      children: <Widget>[
        monitorHeaderIcons(),
        buildCreateNavigationCardWidget(),
        monitorRecordsList(),
      ],
    );
  }

  Widget buildCreateNavigationCardWidget() {
    return Container(
      width: getScreenWidth(context) * 0.92,
      height: getScreenHeight(context) * 0.12,
      decoration: drawContainerBorder(WHITE),
      child: ListTile(
        title: Text(
          "Create here",
          style: normalBoldedTextStyle,
        ),
        subtitle: Text(
          "hello",
          style: normalTextStyle,
        ),
        trailing: GestureDetector(
          child: Image.asset(
            BTN_ADD,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget monitorHeaderIcons() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 3),
      child: Column(
        children: <Widget>[
          Row(
//        crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              searchMonitorRecordsTextFieldWidget(),
              buildHeaderIcons(
                  iconName: TEMP2_IC_SEACH_2, bgColor: WHITE, padding: 0),
              buildHeaderIcons(
                  iconName: TEMP2_IC_FILTER,
                  bgColor: WHITE,
                  borderColor: BLACK26,
                  margin: 3),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 5),
            width: getScreenWidth(context) * 0.95,
            height: getScreenHeight(context) * 0.15,
            decoration: drawContainerBorder(WHITE),
            child: buildSearchList(),
          )
        ],
      ),
    );
  }

  Widget searchMonitorRecordsTextFieldWidget() {
    return Expanded(
      child: Container(
        height: getScreenHeight(context) * 0.06,
        child: TextField(
            decoration: getTextFieldInputDecoration(
          isPrefixIcon: true,
          icon: searchItemCard(),
        )),
      ),
    );
  }

  Widget buildSearchList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Container(
            padding: EdgeInsets.all(4),
            width: getScreenWidth(context) - 35,
            child: Row(
              children: <Widget>[
                Text(
                  'caption :',
                  style: normalLightBlueTextStyle,
                ),
                Text(
                  'value',
                  style: normalTextStyle,
                ),
              ],
            ),
          ),
//                          )
        );
      },
    );
  }

  Widget searchItemCard() {
    return Container(
      height: 35,
      width: 120,
      padding: EdgeInsets.only(left: 3),
      margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      decoration: drawSearchContainerBorder(Colors.grey[100]),
      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                "caption:value",
                style: normalTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
                child: Icon(
              Icons.clear,
              size: 17,
            )),
          ),
        ],
      ),
    );
  }

  BoxDecoration drawSearchContainerBorder(Color color) {
    return BoxDecoration(
        color: color,
        border: Border.fromBorderSide(BorderSide(
          color: LITE_BLUE_ACCENT,
        )),
        borderRadius: BorderRadius.circular(8));
  }

  Widget monitorRecordsList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, position) => moniorRecordCradWidget(position),
          itemCount: 1,
        ),
      ),
    );
  }

  Widget moniorRecordCradWidget(int position) {
    return GestureDetector(
      child: Container(
        height: getScreenHeight(context) * 0.21,
        width: getScreenWidth(context) * 0.9,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        decoration: drawContainerBorder(WHITE),
        child: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            buildUDAWithValueWidget(position),
            getMonitorRecordCardIcons(position),
          ],
        ),
      ),
    );
  }

  Widget buildUDAWithValueWidget(int index) {
    return Expanded(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, position) => Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 2.0),
            child: Text(
              "age : 10",
              style: normalTextStyle,
              overflow: TextOverflow.ellipsis,
            )),
      ),
    );
  }

  Widget getMonitorRecordCardIcons(int position) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        drawDottedIconWidget(
          IC_DUPLICATE_FIELD,
        ),
        drawDottedIconWidget(
          IC_DELETE,
        ),
        drawDottedIconWidget(
          IC_EDIT_GRID,
        ),
        drawDottedIconWidget(
          IC_EDIT_GRID,
        ),
      ],
    );
  }

  Widget drawDottedIconWidget(String iconName, {Function onIconTapped}) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(3),
//        child: Image.asset(iconName,width: 15,height: 15,),
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(12),
          padding: EdgeInsets.all(5),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: Image.asset(
              iconName,
              width: 15,
              height: 15,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
