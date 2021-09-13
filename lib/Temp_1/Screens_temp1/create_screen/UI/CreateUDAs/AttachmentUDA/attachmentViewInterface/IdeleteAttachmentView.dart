import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/ErrorResponse/error_data.dart';

abstract class IDeleteAttachmentView {
  void onLoadDataDeleteAttachmentComplete(
      String statusCode, int index, Function(bool isFileUpload) isFileUpload);
  void onLoadDataDeleteAttachmentError(
      ErrorResponse errorResponse, Function(bool isFileUpload) isFileUpload);
}
