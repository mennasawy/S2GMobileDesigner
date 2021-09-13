import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/AllValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/Panels_UDAsPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/UDAsView.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreatePanelsScreen.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBarTemplate1/NTGAppBar.dart';
import 'package:templets/Utilities/WidgetsUtilites/RaisedButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/Types.dart';
import 'package:templets/Utilities/utility_methods.dart';

TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

enum FormModes {
  newMode,
  cloneMode,
  editMode,
  viewMode,
  freeModuleMode,
  freeModuleFromDashboardMode,
  dictionaryModule,
}

class CreateGenericObjectScreen extends StatefulWidget {
  final objectId;
  final AllValues object; //when route from monitor
  final Types type;
  final int typeID;
  FormModes mode;
  final int savedObjectID;
  final bool hasModifyPrivilage;
  String typeTitle = '';
  String moduleID;
  CreateGenericObjectScreen({
    this.objectId,
    this.object,
    this.type,
    this.mode,
    this.typeTitle,
    this.moduleID,
    this.savedObjectID,
    this.typeID,
    this.hasModifyPrivilage,
  }) {
    createState();
  }
  @override
  _CreateGenericObjectState createState() {
    return _CreateGenericObjectState();
  }
}

class _CreateGenericObjectState extends State<CreateGenericObjectScreen>
    implements UDAsView {
  PanelsUDAsPresenter _udaPresenter;
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
                appBar: NTGAppBar(
                  appBarType: AppBarType.appBarWithBack,
                  pageName: widget.typeTitle,
                ),
                extendBody: true,
                body: getCreateGenericObjectScreen())
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

  Container createScreenContent() {
    return Container(
      height: (_udaPresenter.mode != FormModes.freeModuleFromDashboardMode)
          ? getScreenHeight(context)
          : getScreenHeight(context) * 0.55,
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
    return CreatePanelsScreen(
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
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 30),
        child: NTGButton(
            buttonText: _udaPresenter.getSaveButtonText(),
            onPressedButton: () {}));
  }

  @override
  void updateGenericObjectView() {
    setState(() {});
  }
}
