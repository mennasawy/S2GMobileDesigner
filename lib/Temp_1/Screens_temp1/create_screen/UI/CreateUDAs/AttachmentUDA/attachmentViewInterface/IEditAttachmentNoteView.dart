import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/ErrorResponse/error_data.dart';

abstract class IEditAttachmentNoteView {
  void onLoadNoteAttachmentDataComplete(String statusCode);
  void onLoadNoteAttachmentDataError(ErrorResponse errorResponse);
}
