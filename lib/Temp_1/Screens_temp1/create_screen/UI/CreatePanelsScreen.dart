import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/SubPanelUda.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/Template1/Temp1UDAsPanelsWidgetsPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/UDAsPanelsWidgetsPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Utilities/FontUtils.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:flutter/material.dart';
import 'PanelUDAsWidgets.dart';

class CreatePanelsScreen extends StatefulWidget {
  final List<SubPanelUda> panels;
  final Function(List<UDAsWithValues>) onUDAsValueChange;
  final FormModes mode;
  final int objectRecId;
  final GenericObject genericObject;
  final String location;

  CreatePanelsScreen({
    Key key,
    this.panels,
    this.onUDAsValueChange,
    this.mode,
    this.objectRecId,
    this.genericObject,
    this.location,
  }) : super(key: key);

  @override
  _CreatePanelsScreenState createState() => _CreatePanelsScreenState();
}

class _CreatePanelsScreenState extends State<CreatePanelsScreen>
    implements PanelsViewInterface {
  Temp1UDAsPanelsWidgetsPresenter udasPanelsWidgetsPresenter;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePresenter();
    udasPanelsWidgetsPresenter.initializePanelItems();
  }

  @override
  void didUpdateWidget(covariant CreatePanelsScreen oldWidget) {
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

  Padding getUDAsListWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: PanelUDAsWidgets(
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

  Container getPanelTabsViewWidget() {
    return Container(
      height: 45,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: udasPanelsWidgetsPresenter.panelsLength(),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: getPanelTabViewCard(index),
                onTap: () {
                  udasPanelsWidgetsPresenter.onPanelSelectionAction(index);
                },
              );
            }),
      ),
    );
  }

  Container getPanelTabViewCard(int index) {
    return Container(
      width: 160,
      height: 45,
      child: Card(
        color: WHITE,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  udasPanelsWidgetsPresenter.panelTitle(index),
                  style: getTabTitleTextStyle(index),
                )),
          ),
        ),
        // Row(
        //   children: <Widget>[
        //     SizedBox(width: 10),
        //     Expanded(
        //         child: SingleChildScrollView(
        //             scrollDirection: Axis.horizontal,
        //             child: Text(
        //               udasPanelsWidgetsPresenter.panelTitle(index),
        //               style: getTabTitleTextStyle(index),
        //             )),
        //         flex: 7),
        //     Expanded(
        //       child: Icon(
        //         Icons.check_circle,
        //         color: Colors.grey[400],
        //       ),
        //       flex: 1,
        //     ),
        //     SizedBox(width: 15)
        //   ],
        //   crossAxisAlignment: CrossAxisAlignment.center,
        // ),
        elevation: 5,
      ),
    );
  }

  initializePresenter() {
    udasPanelsWidgetsPresenter = Temp1UDAsPanelsWidgetsPresenter();
    udasPanelsWidgetsPresenter.panels = widget.panels;
    udasPanelsWidgetsPresenter.mode = widget.mode;
    udasPanelsWidgetsPresenter.panelsView = this;
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
