import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/SubPanelUda.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/UDAsPanelsWidgetsPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Utilities/WidgetsUtilites/FontUtils.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2PanelUDAsWidgets.dart';
import 'package:flutter/material.dart';

class Temp2CreatePanelsScreen extends StatefulWidget {
  final List<SubPanelUda> panels;
  final Function(List<UDAsWithValues>) onUDAsValueChange;
  final FormModes mode;
  final int objectRecId;
  final GenericObject genericObject;
  final String location;

  Temp2CreatePanelsScreen({
    Key key,
    this.panels,
    this.onUDAsValueChange,
    this.mode,
    this.objectRecId,
    this.genericObject,
    this.location,
  }) : super(key: key);

  @override
  _Temp2CreatePanelsScreenState createState() =>
      _Temp2CreatePanelsScreenState();
}

class _Temp2CreatePanelsScreenState extends State<Temp2CreatePanelsScreen>
    implements PanelsViewInterface {
  UDAsPanelsWidgetsPresenter udasPanelsWidgetsPresenter;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePresenter();
    udasPanelsWidgetsPresenter.initializePanelItems();
  }

  @override
  void didUpdateWidget(covariant Temp2CreatePanelsScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    udasPanelsWidgetsPresenter.separateUDAsListFromPanels();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        drawWidgetOrEmptyContainer((widget.mode != FormModes.dictionaryModule),
            getPanelTabsViewWidget()),
        getUDAsListWidget()
      ],
    );
  }

  Widget getPanelTabsViewWidget() {
    return SizedBox(
      height: 40,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: udasPanelsWidgetsPresenter.panelsLength(),
            itemBuilder: (BuildContext context, int index) {
              return getPanelTabViewCard(index);
            }),
      ),
    );
  }

  Widget getPanelTabViewCard(int index) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      constraints: BoxConstraints(
        minHeight: 30,
        maxHeight: 40,
        maxWidth: 250,
        minWidth: 80,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: BLACK.withOpacity(0.15),
            offset: Offset(5, 0),
            blurRadius: 2,
            spreadRadius: 0,
          )
        ],
      ),
      child: FlatButton(
//        minWidth: 80,
//        height: 40,
        onPressed: () =>
            udasPanelsWidgetsPresenter.onPanelSelectionAction(index),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: DARK_GREY, width: 1),
        ),
        color: WHITE,
        child: Text(
          udasPanelsWidgetsPresenter.panelTitle(index),
          textAlign: TextAlign.center,
          style: getTabTitleTextStyle(index),
        ),
      ),
    );
  }

  Padding getUDAsListWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Temp2PanelUDAsWidgets(
        udas: udasPanelsWidgetsPresenter.selectedPanel?.udas,
        fullUDAsList: udasPanelsWidgetsPresenter.fullUDAsList,
        objectRecId: widget.objectRecId,
        onUDAsValueChange: (udasWithValues) {
          widget.onUDAsValueChange(udasWithValues);
        },
        mode: widget.mode,
        subPanels: udasPanelsWidgetsPresenter.selectedPanel?.subPanels,
        genericObject: widget.genericObject,
        location: widget.location,
      ),
    );
  }

  // Container getPanelTabsViewWidget() {
  //   return Container(
  //     height: 45,
  //     child: Padding(
  //       padding: const EdgeInsets.only(left: 10.0),
  //       child: ListView.builder(
  //           controller: _scrollController,
  //           scrollDirection: Axis.horizontal,
  //           itemCount: udasPanelsWidgetsPresenter.panelsLength(),
  //           itemBuilder: (BuildContext context, int index) {
  //             return GestureDetector(
  //               child: getPanelTabViewCard(index),
  //               onTap: () {
  //                 udasPanelsWidgetsPresenter.onPanelSelectionAction(index);
  //               },
  //             );
  //           }),
  //     ),
  //   );
  // }

  // Container getPanelTabViewCard(int index) {
  //   return Container(
  //     width: 160,
  //     height: 45,
  //     child: Card(
  //       shape: RoundedRectangleBorder(
  //         side: BorderSide(color: DARK_GREY, width: 1),
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       color: ThemeManager.themeColor(
  //           ThemeSection.tabs, ThemeProperty.tabHeaderBackgroundColor),
  //       child: Center(
  //         child: SingleChildScrollView(
  //             scrollDirection: Axis.horizontal,
  //             child: Text(
  //               udasPanelsWidgetsPresenter.panelTitle(index),
  //               style: getTabTitleTextStyle(index),
  //             )),
  //       ),
  //       elevation: 5,
  //     ),
  //   );
  // }

  initializePresenter() {
    udasPanelsWidgetsPresenter = UDAsPanelsWidgetsPresenter(
        panels: widget.panels, panelsView: this, mode: widget.mode);
  }

  TextStyle getTabTitleTextStyle(int index) {
    return (widget.panels[index].isPanelSelected == true)
        ? FontUtils.boldNormalTextStyle(BLACK)
        : FontUtils.normalTextStyle(BLACK);
  }

  @override
  void updateWidgetOfPanelsAndUDAs() {
    setState(() {});
  }
}
