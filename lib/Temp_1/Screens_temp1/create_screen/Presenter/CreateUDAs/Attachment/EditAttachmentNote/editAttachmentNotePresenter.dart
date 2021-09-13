import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Attachment/attach_RowData.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/ErrorResponse/error_data.dart';
import 'package:templets/dependency_injection.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/AttachmentUDA/attachmentViewInterface/IEditAttachmentNoteView.dart';
import 'package:flutter/material.dart';
import 'IeditAttachmentNotePresenter.dart';

class EditAttachmentNotePresenter implements IEditAttachmentNotePresenter {
  IEditAttachmentNoteView editAttachmentNoteViewInterface;
  IEditAttachmentNoteRepository iEditAttachmentNoteRepository;

  EditAttachmentNotePresenter(this.editAttachmentNoteViewInterface) {
    iEditAttachmentNoteRepository = new Injector().editAttechmentNoteRepository;
  }

  void loadData(BuildContext context, AttachData attachData, int index,
      String note, String attachmentId) {
    iEditAttachmentNoteRepository
        .editAttachmentNote(context, attachData, index, note, attachmentId)
        .then((c) =>
            editAttachmentNoteViewInterface.onLoadNoteAttachmentDataComplete(c))
        .catchError((onError) => editAttachmentNoteViewInterface
            .onLoadNoteAttachmentDataError(onError is FlutterError
                ? ErrorResponse(message: onError.message)
                : onError is AssertionError
                    ? ErrorResponse(message: onError.message)
                    : onError));
  }

  @override
  void editAttachmentNote(BuildContext context, attachData, int index,
      String note, String attachmentId) {
    // TODO: implement editAttachmentNote
    loadData(context, attachData, index, note, attachmentId);
  }

//  @override
//  void editAttachmentNote(BuildContext context, AttachData attachData) {
//    loadData(context, attachData);
//  }
}
