import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/ReportUDAPresenter.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBarTemplate1/NTGAppBar.dart';
import 'package:templets/Utilities/WidgetsUtilites/RaisedButton.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';

class ReportUDA extends StatefulWidget {
  final String title;
  final String labelColor;
  final int objectRecId;

  final UDAsWithValues uda;
  final GenericObject genericObject;

  final bool isVisible;
  final bool isReadOnly;

  const ReportUDA(
      {Key key,
      this.title,
      this.uda,
      this.labelColor,
      this.isVisible,
      this.isReadOnly,
      this.objectRecId,
      this.genericObject})
      : super(key: key);
  @override
  _ReportUDAState createState() => _ReportUDAState();
}

class _ReportUDAState extends State<ReportUDA> {
  PDFDocument _document;
  ReportUDAPresenter _reportPresenter = ReportUDAPresenter();
  @override
  Widget build(BuildContext context) {
    return drawWidgetOrEmptyContainer(
        widget.isVisible, getInvokerButtonWidget());
  }

  Widget getInvokerButtonWidget() {
    return BlueRaisedButtonWidget(
      hinttext: widget.title ?? "",
      onpressed: widget.isReadOnly
          ? null
          : () {
              reportButtonAction();
            },
      color: widget.labelColor,
    );
  }

  reportButtonAction() async {
    _document = await _reportPresenter.getReportPDF(
        udaID: widget.uda.recId,
        objectRecID: widget.objectRecId,
        moduleID: widget.genericObject.typeObjectId.toString(),
        context: context);
    openPDFView();
  }

  openPDFView() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => (PDFView(
                  document: _document,
                ))));
  }
}

class PDFView extends StatelessWidget {
  final PDFDocument document;

  const PDFView({Key key, this.document}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NTGAppBar(
        appBarType: AppBarType.appBarWithClose,
      ),
      body: PDFViewer(
        document: document,
        showPicker: true,
        showIndicator: true,
        indicatorBackground: RED,
      ),
    );
  }
}
