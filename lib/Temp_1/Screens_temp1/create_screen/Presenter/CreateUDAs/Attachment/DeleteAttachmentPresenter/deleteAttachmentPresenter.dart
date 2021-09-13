import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Attachment/attach_RowData.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/ErrorResponse/error_data.dart';
import 'package:templets/dependency_injection.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/AttachmentUDA/attachmentViewInterface/IdeleteAttachmentView.dart';
import 'package:flutter/cupertino.dart';

import 'IdeleteAttachmentInterface.dart';

class DeleteAttachmentPresenter implements IDeleteAttachmentPresenter {
  IDeleteAttachmentView deleteAttachmentViewInterface;
  IDeleteAttachmentRepository deleteAttachmentRepositry;

  DeleteAttachmentPresenter(this.deleteAttachmentViewInterface) {
    deleteAttachmentRepositry = new Injector().deleteAttachmentReposatory;
  }

  void loadData(
      BuildContext context,
      String attachmentName,
      String attachmentId,
      int index,
      Function(bool isFileUpload) isFileUpload) {
    deleteAttachmentRepositry
        .deleteAttachment(context, attachmentName, attachmentId)
        .then((c) => deleteAttachmentViewInterface
            .onLoadDataDeleteAttachmentComplete(c, index, isFileUpload))
        .catchError((onError) =>
            deleteAttachmentViewInterface.onLoadDataDeleteAttachmentError(
                onError is FlutterError
                    ? ErrorResponse(message: onError.message)
                    : onError is AssertionError
                        ? ErrorResponse(message: onError.message)
                        : onError,
                isFileUpload));
  }

  @override
  void deleteAttachment(
      BuildContext context,
      String attachmentName,
      String attachmentId,
      int index,
      Function(bool isFileUpload) isFileUpload) {
    loadData(context, attachmentName, attachmentId, index, isFileUpload);
  }
}
