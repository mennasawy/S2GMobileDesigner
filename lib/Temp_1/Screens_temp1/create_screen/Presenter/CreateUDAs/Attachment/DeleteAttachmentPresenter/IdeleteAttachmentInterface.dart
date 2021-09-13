import 'package:flutter/material.dart';

abstract class IDeleteAttachmentPresenter {
  void deleteAttachment(BuildContext context,String attachmentName ,String attachmentId,int index,Function(bool isFileUpload) isFileUpload);
}