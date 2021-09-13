import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Note/savedNote.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/ServiceUrls.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/api_client.dart';
import 'package:templets/Utilities/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class NoteUDAServices implements NoteRepository {
  @override
  Future<String> addNote(BuildContext context, String noteName, int objectRecId,
      int noteId, savedNote noteBody) async {
    log(LogType.DEBUG, '$noteName +++ $objectRecId ++ $noteId ++');
    log(LogType.DEBUG, postToJsonMobileSubmitRequest(noteBody));
    final sessionToken = GetTokenFromSecure.getSessionToken();
    String url =
        ServiceUrls(context).addNote + '/$noteName/$objectRecId/4/$noteId';
    return await postCallService(url, RequestType.ADDNOTEUDADATA,
        postToJsonMobileSubmitRequest(noteBody), sessionToken, http.Client());
  }
}

class DeleteNoteServices implements DeleteNoteRepository {
  //Test Service
  @override
  Future<String> deleteNote(
      BuildContext context, String noteTableName, int objectRecId) async {
    log(LogType.DEBUG, '$noteTableName --- $objectRecId ---');
    final sessionToken = GetTokenFromSecure.getSessionToken();
    String url = ServiceUrls(context).deleteNoteUda;
    log(LogType.DEBUG, url + '/$noteTableName/$objectRecId');
    return await deleteCallService(url + '/$noteTableName/$objectRecId',
        RequestType.DELETENOTEUDA, sessionToken);
    // final response = await http.delete(url + '/$noteTableName/$objectRecId',
    //     headers: headers);
    // log(LogType.DEBUG, response.statusCode);
    // if (response.statusCode == 200) {
    //   if (!response.body.contains('restException')) {
    //     return ' delete succsses';
    //   } else {
    //     RestExceptionResponse exceptionResponse =
    //         parseRestExceptionResponse(response.body);
    //     throw ErrorResponse(
    //         message: exceptionResponse.restException.errorMessage,
    //         code: exceptionResponse.restException.errorCode);
    //   }
    // }
  }
}
