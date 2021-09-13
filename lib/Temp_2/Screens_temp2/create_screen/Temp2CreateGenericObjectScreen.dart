import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/AllValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/Types.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/Panels_UDAsPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/UDAsView.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBars.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/BasicButton.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreatePanelsScreen.dart';

TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

enum NavigationSource { sideMenu, monitor }

class Temp2CreateGenericObjectScreen extends StatefulWidget {
  final objectId;
  final AllValues object; //when route from monitor
  final Types type;
  final int typeID;
  FormModes mode;
  final int savedObjectID;
  final bool hasModifyPrivilage;
  String typeTitle = '';
  String moduleID;
  final NavigationSource navigationSource;
  Temp2CreateGenericObjectScreen({
    this.objectId,
    this.object,
    this.type,
    this.mode,
    this.typeTitle,
    this.moduleID,
    this.savedObjectID,
    this.typeID,
    this.hasModifyPrivilage,
    this.navigationSource,
  }) {
    createState();
  }
  @override
  _Temp2CreateGenericObjectState createState() {
    return _Temp2CreateGenericObjectState();
  }
}

class _Temp2CreateGenericObjectState
    extends State<Temp2CreateGenericObjectScreen> implements UDAsView {
  PanelsUDAsPresenter _udaPresenter;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  ScrollController panelListScrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePresenter();
    _udaPresenter.initializeGenericObject();
  }

  @override
  Widget build(BuildContext context) {
    _udaPresenter.loadFormDataOnFormType();
    return SafeArea(
        child: (_udaPresenter.mode != FormModes.freeModuleFromDashboardMode)
            ? Scaffold(
                key: _scaffoldKey,
                appBar: Template2AppBars(
                  screenName: widget.typeTitle,
                  appBarType: Template2AppBarType.secendary,
                ),
                backgroundColor: GREY,
                // ThemeManager.themeColor(
                //     ThemeSection.mainScreenBackground, ThemeProperty.backgroundColor),
                extendBody: true,
                body: getCreateGenericObjectScreen(),
              )
            : getCreateGenericObjectScreen());
  }

  initializePresenter() {
    _udaPresenter = PanelsUDAsPresenter(
      type: widget.type,
      moduleID: widget.moduleID,
      typeID: widget.typeID,
      object: widget.object,
      objectId: widget.objectId,
      savedObjectID: widget.savedObjectID,
      mode: widget.mode,
      hasModifyPrivilage: widget.hasModifyPrivilage,
      context: context,
      typeRecId: widget.type?.recId ?? widget.typeID,
      view: this,
      rowID: widget.savedObjectID ?? widget.object?.recid,
      objectRecID: int.parse(widget.moduleID) ?? widget.object?.recid,
    );
  }

  Stack getCreateGenericObjectScreen() {
    return Stack(
      children: <Widget>[
        drawWidgetOrEmptyContainer(
            _udaPresenter.isPanelsWithUDAsLoaded &&
                !_udaPresenter.isPanelsWithUDAsLoadFailed,
            createScreenContent()),
        drawWidgetOrEmptyContainer(
            _udaPresenter.isSavingObject ||
                (!_udaPresenter.isPanelsWithUDAsLoaded &&
                    !_udaPresenter.isPanelsWithUDAsLoadFailed),
            Center(
              child: DrawProgressBar(),
            )),
      ],
    );
  }

  Widget createScreenContent() {
    return Container(
      height: (_udaPresenter.mode != FormModes.freeModuleFromDashboardMode)
          ? getScreenHeight(context)
          : getScreenHeight(context) * 0.6,
      child: ListView(
        controller: panelListScrollController,
        children: <Widget>[
          SizedBox(height: 10),
          getPanelsWithUDAsWidget(),
          SizedBox(height: 20),
          //Separate Done..
          drawWidgetOrEmptyContainer(
              _udaPresenter.shouldShowSaveButton(), getSaveButtonWidget())
        ],
      ),
    );
  }

  getPanelsWithUDAsWidget() {
    return Temp2CreatePanelsScreen(
      panels: _udaPresenter.panelsWithUDAs,
      //Separate Done..
      objectRecId: _udaPresenter.getObjectRecID(),
      mode: _udaPresenter.mode,
      onUDAsValueChange: (udasValues) {},
      genericObject: _udaPresenter.genericObject,
      location: _udaPresenter.location,
    );
  }

  getSaveButtonWidget() {
    double sidePadding = getScreenWidth(context) * 0.25;
    return Padding(
        padding: EdgeInsets.fromLTRB(sidePadding, 20, sidePadding, 30),
        child: BasicButton(
            buttonWidth: getScreenWidth(context) * 0.4,
            buttonText: _udaPresenter.getSaveButtonText(),
            onPressedButton: () {}));
  }

  @override
  void updateGenericObjectView() {
    setState(() {});
  }
}
