import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Attachment/attach_RowData.dart';
import 'package:flutter/material.dart';

abstract class IEditAttachmentNotePresenter {
  void editAttachmentNote(BuildContext context, AttachData attachData,
      int index, String note, String attachmentId);
}
