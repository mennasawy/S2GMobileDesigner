import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Attachment/attach_RowData.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/RestExceptionResponse.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/ErrorResponse/error_data.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/AttachmentUDA/AttachmentUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUtils.dart';
import 'package:templets/Utilities/api_constant.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/dependency_injection.dart';
import 'package:app_settings/app_settings.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:templets/Utilities/const.dart' as Logger;
import 'dart:io';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/AttachmentUDA/attachmentViewInterface/AttachUploadViewInterface.dart';
import 'package:path/path.dart' as fileUtil;
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AttachmentUDAPresenter implements AttachmentContract {
  BuildContext _context;
  AttachUploadViewInterface _view;
  AttachUploadRepositry _attachUploadRepositry;
  IEditAttachmentNoteRepository _iEditAttachmentNoteRepository;
  IDeleteAttachmentRepository _deleteAttachmentRepositry;

  UDAsWithValues uda;
  final Function onAttachmentListChange;
  Function(dynamic uploadedFiles) onUploadFiles;

  final int objectID;
  final bool isValid;
  final bool isVisible;
  final bool isReadOnly;
  final bool validationCondition;
  bool isMandatory;
  bool isLoading = false;

  final FormType mode;
  AttachmentMode attachmentMode;

  String filePath;
  final String validationMessage;
  String currentAttachmentName;
  String noteText;
  static File imageFile;
//  TextEditingController noteController= TextEditingController();

  List<AttachData> attachmentList = [];
  List<File> uploadedFilesList = [];

  AttachmentUDAPresenter(this._view, this._context,
      {this.onAttachmentListChange,
      this.validationMessage,
      this.objectID,
      this.isValid,
      this.isVisible,
      this.isReadOnly,
      this.validationCondition,
      this.mode,
      this.uda,
      this.isMandatory,
      this.attachmentMode}) {
    _attachUploadRepositry = new Injector().attachUploadRepositry;
    _iEditAttachmentNoteRepository =
        new Injector().editAttechmentNoteRepository;
    _deleteAttachmentRepositry = new Injector().deleteAttachmentReposatory;
    initializeItems();
  }
  void initializeItems() {
    attachmentMode != null
        ? attachmentMode
        : attachmentMode = AttachmentMode.UDAMode;
    attachmentList = uda?.attachments ?? [];
    isMandatory ??= false;
  }

  bool isVisibleWidget() {
    return isVisible == true && uda.location != true;
  }

  bool isAttachmentListEmpty() {
    return !isNotEmptyList(attachmentList);
  }

  bool isUploading() {
    return isLoading;
  }

  bool isButtonActive() {
    return isReadOnly == false || isLoading == false;
  }

  int attachmentListLength() {
    return attachmentList.length;
  }

  void ButtomSheetPickFileAction(String source) async {
    Navigator.pop(_context);
    uploadedFilesList = [];
    currentAttachmentName = '';
    switch (source) {
      case 'Camera':
      case 'Gallery':
        await _getImage(source);
        break;
      case 'File':
        await _chooseFile();
        break;
      default:
        _chooseFile();
    }
    (source == 'Camera') ? await _getImage(source) : await _chooseFile();
  }

//pick file operations
  Future<void> _getImage(
    String source,
  ) async {
    imageFile = await ImagePicker.pickImage(
        source: source == 'Camera' ? ImageSource.camera : ImageSource.gallery);
    uploadedFilesList.add(imageFile);
    currentAttachmentName = _getFileName(imageFile);
    addNewAttachment(
        _getFileName(imageFile), noteText, _getFilesType(imageFile));
    _view.changeState();
  }

  Future<void> _chooseFile() async {
    var fileName = await FilePicker.platform.pickFiles();
    imageFile = File(fileName.files.single.path);
    currentAttachmentName = _getFileName(imageFile);
    uploadedFilesList.add(imageFile);
//      uploadedFilesList.add(compressedFile);
    addNewAttachment(
        _getFileName(imageFile), noteText, _getFilesType(imageFile));
    _view.changeState();
  }

  // Future<void> _openGallery() {}

  String _getFilesType(File imageFile) {
    String getFileExtenstion = fileUtil.extension(imageFile.path);
    String getType = getFileExtenstion.substring(1).toUpperCase();
    return getType;
  }

  String _getFileName(File imageFile) {
    String filename = fileUtil.basename(imageFile.path);
    String fileTrimedName = trimText(filename, 20);
    return fileTrimedName;
  }

  // upload attachment methods
  void addNewAttachment(
    attachmentName,
    note,
    attachmenttype,
  ) async {
    // LoginUser userData = await Logger.GetUserDataFromSecure.getUserData();
    final attachment = AttachData(
      attachmentName: attachmentName,
      attachmentNote: note,
      attachmenttype: -1,
      objectid: objectID,
      recid: (mode == FormType.create) ? -1 : uda.recId,
      date: DateTime.now().millisecondsSinceEpoch,
      uploadedby: "User",
    );
    handleUpload(attachment);
  }

  handleUpload(
    AttachData attachment,
  ) {
    onUploadFiles = (dynamic getUploadedFiles) {
      if (getUploadedFiles is List<AttachData>) {
        onAddAttachmentItemToList(getUploadedFiles[0]);
//        getUploadedFiles.indexWhere(
//                (item) => item.attachmentName.contains(currentAttachmentName))
      }
      if (getUploadedFiles is RestExceptionResponse) {
        if (getUploadedFiles.restException.errorCode == CODE_EXPIRED_TOKEN)
          ShowExpiredTokenAlert(
              getUploadedFiles.restException.errorMessage, _context);
      }
    };
    uploadAttachmentFile(uploadedFilesList, onUploadFiles);
  }

  void onAddAttachmentItemToList(
    AttachData attachment,
  ) {
    attachmentList.add(attachment);
    onAttachmentListChange(attachmentList, uploadedFilesList);
    _view.changeState();
  }

  void uploadAttachmentFile(
      List<File> uploadedFilesList, Function onUploadedFiles) {
    isLoading = true;
    _view.changeState();
//  Future.forEach(uploadedFilesList, (element) {
//    attachUploadRepositry.fileUploadMultipart(file: element,context: context,attachmentName:attachmentName,attachmentID: attachmentID)
//            .then((c)=>_view.onLoadDataComplete(c))
//        .catchError((onError)=> _view.onLoadDataError());
//  });
    _attachUploadRepositry
        .fileUploadMultipart(
            files: uploadedFilesList,
            context: _context,
            attachmentName: uda.udaTableName,
            attachmentID: uda.recId.toString(),
            onUploadedFiles: onUploadedFiles,
            additionalUdaTableNames: uda.AdditionalUdaTableNames,
            objectID: objectID) //compressedFile
        .then((c) => this.onLoadDataComplete(c))
        .catchError((onError) => this.onLoadDataError(onError));
  }

  @override
  void onLoadDataComplete(attachRowList) {
    isLoading = false;
    _view.changeState();
  }

  @override
  void onLoadDataError(ErrorResponse errorResponse) {
    isLoading = false;
    _view.changeState();
  }

  // delete attachment methods
  deleteIconAction(int index) {
    _view.showDualAlert("delete_message",
        isLocalized: true, leftButtonAction: deleteDialogLeftAction(index));
  }

  deleteDialogLeftAction(int index) {
    mode == FormType.create
        ? deleteAttachmentItemFromList(index)
        : deleteAttachment(
            uda.udaName, attachmentList[index].recid.toString(), index);
  }

  void deleteAttachmentItemFromList(int index) {
    attachmentList.removeAt(index);
    onAttachmentListChange(attachmentList, uploadedFilesList);
    _view.changeState();
  }

  void deleteAttachment(String attachmentName, String attachmentId, int index) {
    isLoading = true;
    _view.changeState();
    _deleteAttachmentRepositry
        .deleteAttachment(_context, attachmentName, attachmentId)
        .then((c) => this.onLoadDataDeleteAttachmentComplete(c, index))
        .catchError((onError) =>
            this.onLoadDataDeleteAttachmentError(onError is FlutterError
                ? ErrorResponse(message: onError.message)
                : onError is AssertionError
                    ? ErrorResponse(message: onError.message)
                    : onError));
  }

  @override
  void onLoadDataDeleteAttachmentComplete(String statusCode, int index) {
    deleteAttachmentItemFromList(index);
    isLoading = false;
    _view.changeState();
    Logger.log(Logger.LogType.DEBUG, 'attachment deleted succssfully ====');
  }

  @override
  void onLoadDataDeleteAttachmentError(ErrorResponse errorResponse) {
    isLoading = false;
    _view.changeState();
    if (errorResponse.code == CODE_EXPIRED_TOKEN)
      ShowExpiredTokenAlert(errorResponse.message, _context);
    else
      _view.showSingleAlert("error_delete_message", isLocalized: true);
  }

  getAttachmentFileType(int index) {
    return attachmentList[index].attachmentName.split('.')[1].toUpperCase();
  }

  getImageFileName(int index) {
    return trimText(attachmentList[index].attachmentName.split('.')[0], 15);
  }

  updateNoteInCreate(AttachData attachmentList) {
    attachmentList.attachmentNote = attachmentList.noteController.text;
    _view.changeState();
//    checkIfAttachHadNote(note);
    Navigator.pop(_context);
    Logger.log(Logger.LogType.DEBUG,
        "Updated  note ====== $attachmentList.attachmentNote");
    _view.changeState();
  }

  void editAttachmentMonitorFile(AttachData attachment) {
    attachment.attachmentNote = attachment.noteController.text;
    onAttachmentListChange(attachmentList, uploadedFilesList);
    _iEditAttachmentNoteRepository
        .editAttachmentNote(_context, attachment, 0, uda.udaTableName,
            attachment.recid.toString())
        .then((c) => this.onLoadNoteAttachmentDataComplete(c))
        .catchError((onError) =>
            this.onLoadNoteAttachmentDataError(onError is FlutterError
                ? ErrorResponse(message: onError.message)
                : onError is AssertionError
                    ? ErrorResponse(message: onError.message)
                    : onError));
    Navigator.pop(_context);
//    checkIfAttachHadNote(note);
    _view.changeState();
  }

  void editAttachmentNote(
      AttachData attachData, int index, String note, String attachmentId) {}

  @override
  void onLoadNoteAttachmentDataComplete(String statusCode) {
    if (statusCode == '200') {
      Logger.log(Logger.LogType.DEBUG,
          "Attachment note successfully loaded ===== $statusCode");
    } else {
      Logger.log(Logger.LogType.ERROR, 'Attachment note fail');
    }
  }

  @override
  void onLoadNoteAttachmentDataError(ErrorResponse errorResponse) {
    if (errorResponse.code == CODE_EXPIRED_TOKEN)
      ShowExpiredTokenAlert(errorResponse.message, _context);
  }

  downloadButtonAction(int index) async {
    if (mode == FormType.create)
      _view.showSingleAlert("Ops! You Can't download befor save",
          isLocalized: false);
    else {
      isLoading = true;
      _view.changeState();
      if (await isPermissionGranted()) {
        _attachUploadRepositry
            .fileDownload(
                _context,
                uda.recId.toString(),
                attachmentList[index].recid,
                attachmentList[index].attachmentName)
            .then((value) => this.onDownloadComplete(value))
            .catchError((onError) => this.onDownLoadError(onError));
        _view.changeState();
      }
    }
  }

  Future<bool> isPermissionGranted() async {
    try {
      final status = await Permission.storage.request();
      PermissionStatus _permissionStatus = status;
      if (_permissionStatus.isGranted) {
        return true;
      } else if (_permissionStatus.isDenied) {
        throw ErrorResponse(
          message: "",
        );
      } else if (_permissionStatus.isPermanentlyDenied) {
        AppSettings.openAppSettings();
      }
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        throw ErrorResponse(
          code: CODE_OPEN_SETTING,
          message:
              'Permission denied - please ask the user to enable it from the app settings',
        );
      }
    } on SocketException catch (e) {
      throw ErrorResponse(
          message: CODE_2, error: e.message + " SocketException");
    } catch (_) {
//      if (Platform.isIOS)

    }
  }

  @override
  void onDownloadComplete(String filePath) {
    isLoading = false;
    _view.changeState();
  }

  @override
  void onDownLoadError(ErrorResponse errorResponse) {
    isLoading = false;
    _view.changeState();
    _view.showError(errorResponse.message);
  }
}

abstract class AttachmentContract {
  void onLoadDataComplete(dynamic attachRowList); //AttachData attachData
  void onLoadDataError(ErrorResponse errorResponse);
  void onLoadNoteAttachmentDataComplete(String statusCode);
  void onLoadNoteAttachmentDataError(ErrorResponse errorResponse);
  void onLoadDataDeleteAttachmentComplete(String statusCode, int index);
  void onLoadDataDeleteAttachmentError(ErrorResponse errorResponse);
  void onDownloadComplete(String filePath);
  void onDownLoadError(ErrorResponse errorResponse);
}
