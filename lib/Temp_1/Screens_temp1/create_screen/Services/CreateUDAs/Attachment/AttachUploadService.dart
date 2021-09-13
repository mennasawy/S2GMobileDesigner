import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Attachment/attach_RowData.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/RestExceptionResponse.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/ServiceUrls.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/api_client.dart';

import 'package:templets/Utilities/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as fileUtil;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:templets/Utilities/const.dart' as Logger;

class AttachUploadService extends AttachUploadRepositry {
  dynamic rowData = [];

  //Check Session token
  @override
  Future<List<AttachData>> fileUploadMultipart(
      {List<File> files,
      context,
      attachmentID,
      attachmentName,
      additionalUdaTableNames,
      Function onUploadedFiles,
      int objectID}) async {
    assert(files != null);
    List<MultipartFile> multipartFileList = [];
    final url = ServiceUrls(context).multipleSave +
        '/' +
        "$objectID" +
        '/' +
        "$attachmentID" +
        '/' +
        "$attachmentName" +
        "/" +
        "false" +
        "/" +
        "$additionalUdaTableNames";
    log(LogType.DEBUG, "upload attachment url ===== $url");
    final httpClient = getHttpClient();
    final request = await httpClient.postUrl(Uri.parse(url));
    int byteCount = 0;
    var requestMultipart = http.MultipartRequest("", Uri.parse(url));
    var fileStreamFile;
    var multipartFileSign;

//    fileStreamFile = file.openRead();
//    multipartFileSign = new http.MultipartFile("file", fileStreamFile, file.lengthSync(), filename: fileUtil.basename(file.path));
//    requestMultipart.files.add(multipartFileSign);
    // incase of sending more than file
    files.forEach((file) => {
          fileStreamFile = file.openRead(),
          multipartFileSign = new http.MultipartFile(
              "file", fileStreamFile, file.lengthSync(),
              filename: fileUtil.basename(file.path)),
          requestMultipart.files.add(multipartFileSign)
        });

    var msStream = requestMultipart.finalize();
    var totalByteLength = requestMultipart.contentLength;

    request.contentLength = totalByteLength;
    String boundary =
        "------------------------" + DateTime.now().toIso8601String();
    request.headers.add(HttpHeaders.contentTypeHeader,
        requestMultipart.headers[HttpHeaders.contentTypeHeader]);
    final sessionToken = GetTokenFromSecure.getSessionToken();
    request.headers.add('SessionToken', sessionToken);
    log(LogType.DEBUG, "attachments headears ======= ${request.headers}");
    Stream<List<int>> streamUpload = msStream.transform(
      new StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          sink.add(data);
          byteCount += data.length;
        },
        handleError: (error, stack, sink) {
          throw error;
        },
        handleDone: (sink) {
          sink.close();
          // UPLOAD DONE;
        },
      ),
    );

    await request.addStream(streamUpload);
    bool isExceptionThrown = false;
    RestExceptionResponse exceptionResponse;
//    var res = await request.send();
    final httpResponse = await request.close();
    httpResponse.transform(utf8.decoder).listen((contents) {
      log(LogType.DEBUG, "Contents ======= ${contents.toString()}");
      if (!contents.toString().contains('restException')) {
        log(LogType.DEBUG, "zzzzzzzzzzz.......attachmentttttt");
        rowData = parseAttachData(contents);
        log(LogType.DEBUG,
            "Attachment name 1 ======= ${rowData[0].attachmentName}");
      } else {
        isExceptionThrown = true;
        rowData = parseRestExceptionResponse(contents);
      }
      return rowData;
    }).onDone(() {
      onUploadedFiles(rowData);
    });
  }

  static HttpClient getHttpClient() {
    bool trustSelfSigned = true;
    HttpClient httpClient = new HttpClient()
      ..connectionTimeout = const Duration(seconds: 10)
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    return httpClient;
  }

  static Future<String> readResponseAsString(
      HttpClientResponse response) async {
    log(LogType.DEBUG, "*************Uploaded successfully************");
    var completer = new Completer<String>();
    var contents = new StringBuffer();
    response.transform(utf8.decoder).listen((String data) {
      contents.write(data);
    }, onDone: () => completer.complete(contents.toString()));
    return completer.future;
  }

  List<AttachData> parseAttachData(String body) {
    final parsed = json.decode(body);
    log(LogType.DEBUG, 'Parsed parseAttachData $parsed');
    return parsed.map<AttachData>((json) => AttachData.fromJson(json)).toList();
  }

  @override
  Future<String> fileDownload(BuildContext context, attachmentObjectID,
      attachmentUDAId, attachmentName) async {
    final sessionToken = GetTokenFromSecure.getSessionToken();
    String downloadableUrl =
        "${ServiceUrls(context).downloadImage}/$attachmentObjectID/$sessionToken/$attachmentUDAId";

    var dir;
    if (Platform.isAndroid) {
      dir = (await getExternalStorageDirectory()).path;
    } else {
      dir = (await getApplicationDocumentsDirectory()).path;
    }
    var filePath = "$dir/$attachmentName";
    Logger.log(Logger.LogType.DEBUG, '########## File name is $filePath');
    File file = new File(filePath);
    var isExist = await file.exists();
    if (isExist) {
      downloadFile(downloadableUrl, filePath);
      await OpenFile.open(filePath);
//      setState(() {
//        isDownloadContainerVisible = false;
//        isBtnVisible = false;
//      });
    } else {
      downloadFile(downloadableUrl, filePath);
    }
  }

  Future<void> downloadFile(String url, String filePath) async {
    Dio dio = Dio();
    try {
      await dio.download(url, filePath, onReceiveProgress: (
        rec,
        total,
      ) {
        Logger.log(Logger.LogType.DEBUG, "Rec: $rec , Total: $total");
      });
    } catch (e) {
      Logger.log(
          Logger.LogType.ERROR, "Download file error ====== ${e.toString()}");
    }
    Logger.log(Logger.LogType.DEBUG, "Download completed");
    await OpenFile.open(filePath);
  }
}

AttachData parseAttachUploadData(String body) {
  final parsed = json.decode(body);
  return AttachData.fromJson(parsed);
}
