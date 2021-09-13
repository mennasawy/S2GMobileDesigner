import 'dart:io';
import 'dart:ui';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Attachment/attach_RowData.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/Attachment/AttachUploadPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUtils.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/WidgetsUtilites/Alerts/dual_action_alert.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/AttachmentUDA/attachmentViewInterface/AttachUploadViewInterface.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:intl/intl.dart';

enum AttachmentMode { UDAMode, GridMode }

class AttachmentUDA extends StatefulWidget {
  final UDAsWithValues uda;
  final Function onAttachmentListChange;
  final String validationMessage;
  bool isMandatory;
  final int objectID;
  final FormType mode;
  final bool isValid;
  final bool isVisible;
  final bool isReadOnly;
  final bool validationCondition;
  AttachmentMode attachmentMode;
//  final String attachmentId;
  AttachmentUDA(
      {Key key,
      this.mode,
      this.onAddAttachment,
      this.validationMessage,
      this.isMandatory,
      this.onAttachmentListChange,
      this.isValid,
      this.isVisible,
      this.isReadOnly,
      this.validationCondition,
      this.attachmentMode,
      this.uda,
      this.objectID});

  final Function onAddAttachment;

  @override
  _AttachmentUDAState createState() => _AttachmentUDAState();
}

class _AttachmentUDAState extends State<AttachmentUDA>
    implements AttachUploadViewInterface {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController listWidgetController = ScrollController();

  AttachmentUDAPresenter _presenter;

  @override
  void initState() {
    presenterInitiallization();
  }

  presenterInitiallization() {
    _presenter = AttachmentUDAPresenter(this, context,
        uda: widget.uda,
        onAttachmentListChange: widget.onAttachmentListChange,
        objectID: widget.objectID,
        isVisible: widget.isVisible,
        isReadOnly: widget.isReadOnly,
        isValid: widget.isValid,
        mode: widget.mode,
        validationMessage: widget.validationMessage,
        validationCondition: widget.validationCondition,
        isMandatory: widget.isMandatory,
        attachmentMode: widget.attachmentMode);
  }

  @override
  Widget build(BuildContext context) {
    return drawWidgetOrEmptyContainer(
        _presenter.isVisibleWidget(), getAttachmentBody());
  }

  Widget getAttachmentBody() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          getUDAWithTitleWidget(
              context,
              _presenter.isAttachmentListEmpty()
                  ? newAttachmentWidget()
                  : attachmentListWidget(),
              '    ' + _presenter.uda.udaCaption,
              _presenter.uda.udaDescription,
              _presenter.validationMessage,
              _presenter.uda.isValidationCondMsgWarn,
              _presenter.isMandatory,
              hexToColor(_presenter.uda.labelColor))
        ],
      ),
    );
  }

  Widget newAttachmentWidget() {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: getDottedBorderWidget(),
    );
  }

  Widget getDottedBorderWidget() {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: DottedBorder(
          borderType: BorderType.RRect,
          dashPattern: [7, 3],
          strokeWidth: 2,
          radius: Radius.circular(TEXTFIELD_BORDER_RADUIS),
          color: DARK_GREY.withOpacity(0.40),
          child: uploadAttachmentWidget()),
    );
  }

  Widget uploadAttachmentWidget() {
    return Container(
        padding: EdgeInsets.all(0),
        color: LITE_GREY.withOpacity(OPACITY),
        height: getScreenHeight(context) * 0.2,
        width: getScreenWidth(context) * 0.7, //0.7
        child: GestureDetector(
          onTap: _presenter.isButtonActive() ? () => pickFileCheck() : null,
          //   widget.onAddAttachment(context);
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Icon(Icons.file_upload),
              Stack(
                children: <Widget>[
                  Center(
                      child: Text(
                    "Upload Attachment",
                    style: normalGreyTextStyle,
                  )),
                  _presenter.isUploading() ? DrawProgressBar() : Container()
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }

  Widget attachmentListWidget() {
    return Container(
      decoration: containerDecoration(),
      width: getScreenWidth(context),
      // height: getScreenHeight(context) * 0.2, //0.45
      child: SingleChildScrollView(
        controller: listWidgetController,
        child: Column(
          children: <Widget>[
            UploadedListItemsWidget(),
            Divider(
              thickness: 1,
              endIndent: 10,
              indent: 10,
            ),
            Stack(
              children: <Widget>[
                (_presenter.attachmentMode == AttachmentMode.UDAMode)
                    ? uploadButton()
                    : Container(),
                _presenter.isUploading() ? DrawProgressBar() : Container()
              ],
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration containerDecoration() {
    return BoxDecoration(
      color: LITE_GREY.withOpacity(OPACITY),
      border: Border(
        top: BorderSide(
            color: Colors.grey[300], width: 3.0, style: BorderStyle.solid),
        bottom: BorderSide(
            color: Colors.grey[300], width: 3.0, style: BorderStyle.solid),
      ),
    );
  }

  Widget UploadedListItemsWidget() {
    return ListView.separated(
        controller: listWidgetController,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _presenter.attachmentListLength(),
        separatorBuilder: (BuildContext context, int index) => Divider(
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Column(
              children: <Widget>[
                ListTile(
//                onTap: null,
                  leading: iconWidget(_presenter.getAttachmentFileType(index)),
                  title: titleWidget(_presenter.getImageFileName(index)),
                  subtitle: subTitleUser(
                      _presenter.attachmentList[index].uploadedby,
                      _presenter.attachmentList[index].date),
                ),
                Wrap(
                  spacing: 10,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.phone_iphone),
                        onPressed: () {
                          if (_presenter.isButtonActive())
                            _presenter.downloadButtonAction(index);
                        }),
                    IconButton(
                        icon: Icon(Icons.phone_iphone),
                        onPressed: () {
                          if (_presenter.isButtonActive())
                            _presenter.deleteIconAction(index);
                        }),
                    if (_presenter.attachmentMode == AttachmentMode.UDAMode)
                      IconButton(
                        icon: noteIcon(
                            _presenter.attachmentList[index].attachmentNote),
                        onPressed: () => (_presenter.isButtonActive())
                            ? editNoteButtonAction(
                                index, _presenter.attachmentList[index])
                            : null,
                      ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  Widget titleWidget(String Title) {
    return Text(
      trimText('$Title', 14),
      style: subtitlesTextStyle, //titletextstyle
    );
  }

  Widget subTitleUser(String name, int date) {
    return Text(
      'Uploaded by : $name - ${new DateFormat("dd-MM-yyyy").format(DateTime.fromMillisecondsSinceEpoch(date, isUtc: true))}',
      style: normalGreyTextStyle,
    );
  }

  Widget uploadButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, top: 4.0),
      child: Center(
        child: Container(
          height: 30,
          child: GestureDetector(
            child: FlatButton(
                onPressed: () {
                  (_presenter.isButtonActive()) ? pickFileCheck() : null;
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min, // to center content
                  children: <Widget>[
                    Icon(Icons.phone_iphone),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Upload Attachment",
                      style: normalBlueTextStyle,
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  void pickFileCheck() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: WHITE,
        context: context,
        builder: (builder) {
          return Platform.isIOS
              ? iOSPickFileBottomSheet()
              : androidPickFileBottomSheet();
          // Container(
          //   height: getScreenHeight(context) * 0.25,
          //   padding: EdgeInsets.all(10),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       ListTile(
          //         title: Text(
          //           AppLocalizations.of(context).translate('gallery_photo'),
          //           style: normalTextStyle,
          //         ),
          //         onTap: () => _presenter.ButtomSheetPickFileAction('File'),
          //       ),
          //       ListTile(
          //         title: Text(
          //           AppLocalizations.of(context).translate('take_photo'),
          //           style: normalTextStyle,
          //         ),
          //         onTap: () => _presenter.ButtomSheetPickFileAction('Camera'),
          //       ),
          //     ],
          //   ),
          // );
        });
  }

  Widget androidPickFileBottomSheet() {
    return Container(
      height: getScreenHeight(context) * 0.25,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListTile(
            title: Text(
              'Choose from gallery',
              style: normalTextStyle,
            ),
            onTap: () => _presenter.ButtomSheetPickFileAction('File'),
          ),
          ListTile(
            title: Text(
              'Take photo',
              style: normalTextStyle,
            ),
            onTap: () => _presenter.ButtomSheetPickFileAction('Camera'),
          ),
        ],
      ),
    );
  }

  Widget iOSPickFileBottomSheet() {
    return Container(
      height: getScreenHeight(context) * 0.3,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListTile(
            title: Text(
              'Choose document',
              style: normalTextStyle,
            ),
            onTap: () => _presenter.ButtomSheetPickFileAction('File'),
          ),
          ListTile(
            title: Text(
              'Choose from gallery',
              style: normalTextStyle,
            ),
            onTap: () => _presenter.ButtomSheetPickFileAction('Gallery'),
          ),
          ListTile(
            title: Text(
              'Take photo',
              style: normalTextStyle,
            ),
            onTap: () => _presenter.ButtomSheetPickFileAction('Camera'),
          ),
        ],
      ),
    );
  }

  Widget noteIcon(String attachmentNote) {
    return Container(child: Icon(Icons.phone_iphone));
  }

  editNoteButtonAction(
      /*List<AttachData> attachmentList,*/ int index,
      AttachData attachData) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => alertView(index),
    );
  }

  Widget alertView(int index) {
    return Container(
      height: 300,
      width: 300,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        title: Icon(Icons.phone_iphone),
        content: alertContent(index),
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 5),
      ),
    );
  }

  SingleChildScrollView alertContent(int index) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          AlertFile(index),
          SizedBox(
            height: 10,
          ),
          alertMessage(index),
          SizedBox(height: 10),
          alertActions(index),
        ],
      ),
    );
  }

  Row AlertFile(int index) {
    return Row(
      children: <Widget>[
        iconWidget(_presenter.getAttachmentFileType(index)),
        SizedBox(
          width: 15,
        ),
        Text(_presenter.getImageFileName(index)),
      ],
    );
  }

  TextField alertMessage(int index) {
    return TextField(
      maxLines: 6,
      decoration: InputDecoration(
//            labelText: text ?? '',
        hintText: "Write Comment here",
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: DARK_GREY,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: GREY,
          ),
        ),
      ),
      controller: _presenter.attachmentList[index].noteController,
    );
  }

  Widget alertActions(int index) {
    return FlatButton(
      child: Text(
        "OK",
        style: normalBlueTextStyle,
      ),
      onPressed: () {
        widget.mode == FormType.create
            ? _presenter.updateNoteInCreate(_presenter.attachmentList[index])
            : _presenter
                .editAttachmentMonitorFile(_presenter.attachmentList[index]);
      },
    );
  }

  @override
  void changeState() {
    setState(() {});
  }

  @override
  void showDualAlert(String message,
      {bool isLocalized, Function leftButtonAction}) {
    DualActionAlert(
            context: context,
            message: message,
            leftButtonAction: () {
              leftButtonAction();
            },
            rightButtonAction: null,
            rightButtonTitle: 'Cancel',
            leftButtonTitle: 'Yes')
        .showAlert();
  }

  @override
  void showSingleAlert(String message, {bool isLocalized}) {
    ShowAlertMessage(message, context);
  }

  @override
  void showError(String errorMessage) {
    scaffoldKey.currentState.hideCurrentSnackBar();
    scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          errorMessage,
          textAlign: TextAlign.center,
        ),
      ),
    );
    // TODO: implement showError
  }
}
