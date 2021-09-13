import 'dart:convert';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/TextUDAsPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/BasicTextInputUDA.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBarTemplate1/NTGAppBar.dart';
import 'package:templets/Utilities/WidgetsUtilites/RaisedButtonWidget.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'RichTextUtils.dart';

enum RichTextMode { ViewOnly, ViewAndEdit }

class EditRichText extends StatefulWidget {
  final RichTextMode richTextMode;
  final UDAsWithValues richTextUda;
  String richText;
  final Function onValueChange;
  final TextEditingController textController;
  final FormModes mode;
  EditRichText({
    Key key,
    this.richTextMode,
    this.richText,
    this.onValueChange,
    this.textController,
    this.mode,
    this.richTextUda,
  }) : super(key: key);

  @override
  _EditRichTextState createState() => _EditRichTextState();
}

class _EditRichTextState extends State<EditRichText> {
  String oldRichText;
  WebViewController _controller;

  @override
  void initState() {
    super.initState();
    widget.richText ??= "";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            resizeToAvoidBottomPadding: false,
//            backgroundColor: WHITE,
            appBar: widget.richTextMode == RichTextMode.ViewOnly
                ? NTGAppBar(
                    pageName: "",
                    appBarType: AppBarType.appBarWithClose,
                  )
                : null,
            body: Container(
              margin: EdgeInsets.all(7),
              child: widget.richTextMode == RichTextMode.ViewOnly
                  ? ViewRichTextWidget()
                  : ViewAndEditRichTextWidget(),
            )));
  }

  Widget ViewAndEditRichTextWidget() {
    return Column(
      children: <Widget>[
        ReadOnlyRichText(),
        SizedBox(
          height: 5,
        ),
        EditableRichText(),
        Center(
            child: NTGButton(
                buttonText: "OK", onPressedButton: onSubmitButtonPressed)),
      ],
    );
  }

  Widget ViewRichTextWidget() {
    return Column(
      children: <Widget>[
        ReadOnlyRichText(),
      ],
    );
  }

  Widget ReadOnlyRichText() {
    final Set<Factory> gestureRecognizers = [
      Factory(() => EagerGestureRecognizer()),
    ].toSet();
    return Expanded(
      flex: 1,
      child: Container(
        child: WebView(
          gestureRecognizers: gestureRecognizers,
          // initialUrl: 'about:blank',
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
            _controller.loadUrl(Uri.dataFromString(
              widget.richText,
              mimeType: 'text/html',
              encoding: Encoding.getByName('utf-8'),
            ).toString());
          },
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
    //        child: Container(color: WHITE, child: richTextWidget(widget.richText)),
  }

  Widget EditableRichText() {
    return Expanded(
      flex: 1,
      child: SingleChildScrollView(
        child: BasicTextInputUDA(
          textController: widget.textController,
          inputType: InputType.text,
          isMandatory: true,
          maxLines: 10,
          labelColor: null,
          isVisible: true,
//      isReadOnly: _isLoading,
//      onValueChange: widget.onValueChange,
        ),
      ),
    );
  }

  onSubmitButtonPressed() {
    (widget.richTextMode == RichTextMode.ViewOnly)
        ? popScreen(context)
        : editRichTextSubmittionAction();
  }

  editRichTextSubmittionAction() {
    updateRichText();
    Navigator.of(context).pop(updateRichTextValue(
        widget.richText ?? "", widget.textController.text ?? ""));
  }

  updateRichText() {
    setState(() {
      widget.onValueChange(widget.textController.text);
    });
  }
}
