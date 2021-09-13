import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/ServiceUrls.dart';
import 'package:templets/Utilities/const.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';

class ReportUDAPresenter {
  Future<PDFDocument> getReportPDF(
      {int udaID,
      String moduleID,
      int objectRecID,
      BuildContext context}) async {
    String sessionToken = GetTokenFromSecure.getSessionToken();
    String url = ServiceUrls(context).openReportPDF +
        "$udaID/$moduleID/$objectRecID/$sessionToken";
    log(LogType.DEBUG, "report url ==== $url");
    return await PDFDocument.fromURL(url);
  }
}
