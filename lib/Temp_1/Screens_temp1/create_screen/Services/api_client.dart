import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/ChangePasswordModel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Form/FormListMapping.dart'
    as formListMapping;
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Form/FormUDAValues.dart'
    as formUDA;
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Form/FormUDAValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridRow.dart'
    as gridRowData;
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Help.dart'
    as helpUDA;
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Note/MentionNoteEmpInfo.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/ValueList/ValueList.dart'
    as valueListUDA;
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/SaveUserRepo.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/SubPanelUda.dart'
    as subPanelUda;
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart'
    as udas;
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart'
    as genericObject;
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/AssignmentInfo/AsignementInfoGetGroupModel.dart'
    as assignmentInfoGroup;
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/AssignmentInfoUDAModel/AssignmentInfoModel.dart'
    as assignmentInfoGroup;
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/AssignmentInfo/save_editAssaigmentInfoResponse.dart'
    as saveEditAssginmentInfo;
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridCols.dart'
    as gridColumns;
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MultipleLevel/getMultiLevelResponse.dart'
    as multiLevel;
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MultipleLevel/multiLevelResponseLevelModel.dart'
    as multiLevelRes;
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/Status.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/Types.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/RestExceptionResponse.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/ErrorResponse/error_data.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/MentionUsersModel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/ErrorResponse/error_data.dart'
    as errorData;
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUtils.dart';
import 'package:templets/Utilities/api_constant.dart';
import 'package:templets/Utilities/const.dart';
import 'package:http/http.dart' as http;
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MileStoneModel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Form/FormUDAValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Note/MentionNoteEmpInfo.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUtils.dart';
import 'package:templets/Utilities/const.dart';

enum RequestType {
  GETMILESTONE,
  CHANGEPASSWORDREQUEST,
  DELETESTICKYNOTE,
  ADDSTICKYNOTE,
  DELETEGRIDRECORD,
  CHECKANDUNCHECKSTICKYNOTE,
  LOGINREQUEST,
  LOGOREQUEST,
  GETPROFILEREQUEST,
  SAVEPROFILEREQUEST,
  GETDICTIONARYMODULE,
  GETCREATEPANELS,
  GETCREATEUDAS,
  GETUDAOBJECT,
  GETGENERICOBJECT,
  POSTGENERICOBJECT,
  DBINVOKERGENERICOBJECT,
  RULEINVOKERGENERICOBJECT,
  SOAPINVOKERGENERICOBJECT,
  GETHELPUDATASK,
  GETFORMUDADATA,
  MAPUDASONFORMUDA,
  GETVALUELISTUDAVALUES,
  GETDICTIONARYVALUELISTVALUES,
  ADDNOTEUDADATA,
  DELETENOTEUDA,
  GETMENTIONEMPINFO,
  GETMULTILEVELUDALEVELS,
  GETMULTILEVELUDAFIRSTLEVEL,
  GETMULTILEVELUDALEVELBYID,
  ADDEDITMULTILEVELUDAREC,
  DELETEMULTILEVELUDAREC,
  GETGRIDUDACOLUMNS,
  EDITGRIDUDAREC,
  UPLOADATTACHMENTUDAFILE,
  DELETEATTACHMENTUDAFILE,
  EDITATTACHMENTUDANOTE,
  GETASSIGNMENTINFOUDAGROUP,
  GETASSIGNMENTINFOUDALISTS,
  EDITASSIGNMENTINFOUDA,
  SAVEASSIGNMENTINFOUDA,
  ONLOADINGUDASRULES,
  APPLICATIONSREQUEST,
  APPMENUREQUEST,
  APPTYPESREQUEST,
  GETAPPDETAILS,
  GETMONITORRECORDSREQUEST,
  DELETEMONITORREQCORD,
  SEARCHMONITORRECORD,
  GETFILTERSEARCHTEMPLATE,
  GETFILTERSEARCHUDAS,
  FILTERSEARCHSATUS,
  FILTERSEARCHVALULISTDATA,
  DELETEFILTERSEARCHTEMPLATE,
  SAVEFILTERSEARCHTEMPLATE,
  PICKUPTASK,
  GETMANGEREMPLOYEES,
  REMOVEMEMBERFROMTASK,
  GETEMPLOYEEPOOLSTASKS,
  GETMYTASKSPOOL,
  GETARCHIVEDTASKS,
  SAVETASKOFARCH,
  ADDDONENOTIFICATION,
  ADDNEWTASK,
  UPDATETASK,
  EDITTASKINFO,
  MOVETASK,
  GETTASKWORKINGHOURS,
  ADDNEWPANEL,
  GETSUBSTATUSPANELS,
  GETURGENT,
  GETMEMBERBYIMAGE,
  GETNOTIFICATION,
  CHANGENOTIFICATIONSEEN,
  GETTYPESPRIVLLAGE,
  GETDRILLDOWNDETAILSVALUE,
  GETFORMUDADATAFORSEARC,
  GETDASHBOARDFREEMODULE,
  GETCHARTUDA,
  GETMONITORASSIGNMENTINFO,
  DELETESUBSTATUSPANEL,
  FINDTASKUDAS,
  TASKROUTS,
  GETMONITORLOGRECORDS,
  GETFILTEREDRECORDSBYWATCHEDLIST,
  GETMENTIONEDUSER,
  GETLASTNOTIFICATION,
  GETMYTODOLIST,
  RESETPASSWORD,
  GETMONITORRECORDS,
  GETDASHBOARDCHARTS,
  GETTHEMES,
  GETTHEMEVALUES,
  GETDASHBOARDDATA,
  ASSIGNMEMBERTOTASK,
  GETDONETASKSCOUNT,
  GETSHORTCUTS,
  GETMENTIONEDUSERLISTDATA,
  GETTASKBYID
}

dynamic getRequestBody(String requestBody) {
  return requestBody;
}

Future<dynamic> postCallService(String url, RequestType requestType,
    dynamic requestBody, String sessionToken, http.Client client) async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      try {
        final response = await http
            .post('$url',
                headers: {
                  'Cache-Control': 'no-cache',
                  'Content-Type': 'application/json',
                  'SessionToken': sessionToken,
                },
                body: getRequestBody(requestBody))
            .timeout(const Duration(seconds: 180));
        final statusCode = response.statusCode;
        if (statusCode != 200) {
          if (statusCode > 500 && statusCode < 599) {
            throw ErrorResponse(
                message: CODE_SERVER_ERROR,
                error: "statusCode:" + statusCode.toString());
          } else if (statusCode == 401) {
            var errorResponse = errorResponseFromJson(response.body);
            throw ErrorResponse(
                code: CODE_401,
                key: errorResponse.key,
                message: errorResponse.message,
                error: errorResponse.error);
          } else {
            var errorResponse = sucssessResponseChangePassword(response.body);
            throw ErrorResponse(
              code: errorResponse.errorCode,
              message: errorResponse.errorMessage,
            );
          }
        }
        String body = utf8.decode(response.bodyBytes);
        if (response.body.contains('restException')) {
          if (requestType == RequestType.SAVEPROFILEREQUEST) {
            SaveProfileRestExceptionResponse saveProfileRestExceptionResponse =
                parseProfileRestExceptionResponse(response.body);
            throw ErrorResponse(
                message: saveProfileRestExceptionResponse.massege,
                code: CODE_PROFILE_EXCEPTION);
          } else {
            RestExceptionResponse exceptionResponse =
                parseRestExceptionResponse(response.body);
            throw ErrorResponse(
                message: exceptionResponse.restException.errorMessage,
                code: exceptionResponse.restException.errorCode);
          }
        } else {
          switch (requestType) {
            case RequestType.POSTGENERICOBJECT:
            case RequestType.DBINVOKERGENERICOBJECT:
            case RequestType.RULEINVOKERGENERICOBJECT:
            case RequestType.SOAPINVOKERGENERICOBJECT:
            case RequestType.ONLOADINGUDASRULES:
              genericObject.GenericObject object;
              object = genericObject.parseGenericObject(body);
              log(LogType.DEBUG, "$requestType response ===== $body");
              return object;
              break;
            case RequestType.GETFORMUDADATA:
              log(LogType.DEBUG, "🌟🌟🌟🌟🌟Form UDA Values === $body");
              List<formUDA.FormUDAValues> formUDAValues;
              formUDAValues = formUDA.parseFormUDA(body);
              return formUDAValues;
              break;
            case RequestType.MAPUDASONFORMUDA:
              log(LogType.DEBUG, "🌟🌟🌟🌟🌟Mapped UDAs === $body");
              List<formListMapping.FormListMappingResponse> mappedUDAs;
              mappedUDAs = formListMapping.parseFormListMappingResponse(body);
              return mappedUDAs;
              break;
            case RequestType.GETVALUELISTUDAVALUES:
              log(LogType.DEBUG,
                  "🌟🌟🌟🌟🌟Dynamic Value List Response === $body");
              List<valueListUDA.ValueList> valueList =
                  List<valueListUDA.ValueList>();
              valueList = valueListUDA.parseValueList(body);
              return valueList;
              break;
            case RequestType.EDITGRIDUDAREC:
              List<gridRowData.GridRowData> rowsData =
                  List<gridRowData.GridRowData>();
              rowsData = gridRowData.parseGridRowData(body);
              return rowsData;
              break;
            case RequestType.ADDNOTEUDADATA:
              return 'succsses';
              break;
            case RequestType.GETASSIGNMENTINFOUDAGROUP:
              List<assignmentInfoGroup.AssignmentInfoGetGroupInfoModel>
                  groupList =
                  assignmentInfoGroup.parseGetGroupInfo(response.body);
              return groupList;
            case RequestType.GETASSIGNMENTINFOUDALISTS:
              List<assignmentInfoGroup.AssignmentInfoModel>
                  assignmentInfoMainList =
                  assignmentInfoGroup.parseAssignmentInfo(response.body);
              return assignmentInfoMainList;
            case RequestType.SAVEASSIGNMENTINFOUDA:
              saveEditAssginmentInfo.AssignmentInfoSaveEditResponse
                  saveAssignmnetResponse =
                  saveEditAssginmentInfo.parseAssignmentInfo(response.body);
              return saveAssignmnetResponse;
            case RequestType.EDITASSIGNMENTINFOUDA:
              saveEditAssginmentInfo.AssignmentInfoSaveEditResponse
                  editAssignmentResponse =
                  saveEditAssginmentInfo.parseAssignmentInfo(response.body);
              return editAssignmentResponse;
            case RequestType.EDITATTACHMENTUDANOTE:
              return "updated success";
            case RequestType.ADDEDITMULTILEVELUDAREC:
              log(LogType.DEBUG,
                  "Multiple level edit record response ==== ${response.body}");
              if (isNumeric(body))
                return 'success';
              else
                throw ErrorResponse();
              return;
            case RequestType.GETFORMUDADATAFORSEARC:
              List<FormUDAValues> formUDAValues = parseFormUDA(body);
              return formUDAValues;
            case RequestType.GETMENTIONEDUSERLISTDATA:
              var noteModelApi = parseNoteModelApi(response.body);
              return noteModelApi;
            default:
              {}
          }
        }
      } on NoSuchMethodError catch (e) {
        log(LogType.ERROR, 'API response no such method error here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.toString() + " NoSuchMethodError");
      } on SocketException catch (e) {
        log(LogType.ERROR, 'API response socket exception here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.message + " SocketException");
      } on TimeoutException catch (e) {
        log(LogType.ERROR, 'API response timeout exception here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.message + " TimeoutException");
      } on HandshakeException catch (e) {
        log(LogType.ERROR, 'API response handshake exception here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.message + " HandshakeException");
      } on TypeError catch (e) {
        log(LogType.ERROR, 'API response type error here $e');
        throw ErrorResponse(
            message: CODE_2, error: '${e.toString()} TypeError');
      } on FormatException catch (e) {
        log(LogType.ERROR, 'API response format exception here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.message + "formatException");
      }
    }
  } on SocketException catch (_) {
    throw ErrorResponse(message: CODE_1);
  }
}

String genericHandleErrorResponse(ErrorResponse errorResponse) {
  logD(errorResponse.message.toString() + errorResponse.key.toString());

  if (errorResponse.message == CODE_1) {
    return "There is no internet connection!";
  } else if (errorResponse.message == CODE_2) {
    return 'Server error check with Adminstrator! \n' + errorResponse.error;
  } else if (errorResponse.code != null && errorResponse.code == CODE_401) {
    return 'token Expired';
  } else {
    return 'Invalid error ,try Again later ';
  }
}

Future<dynamic> getCallService(
    String url, RequestType requestType, String sessionToken) async {
  logD('get url $url');
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      try {
        http.Response response = await http.get(url, headers: {
          // HttpHeaders.contentTypeHeader: 'application/json',
          // HttpHeaders.authorizationHeader: 'Bearer $sessionToken',
          'Content-Type': 'application/json',
          'SessionToken': sessionToken,
          // HttpHeaders.contentTypeHeader: 'application/json',
          // 'SessionToken': '$sessionToken',
        }).timeout(const Duration(seconds: 180));
        final statusCode = response.statusCode;
        logD('statusCode $statusCode');
        logD('response ${response.body}');
        if (statusCode != 200) {
          logD('error response ${response.body}');
          if (statusCode > 500 && statusCode < 599) {
            throw ErrorResponse(
                message: CODE_SERVER_ERROR,
                error: "statusCode:" + statusCode.toString());
          } else if (statusCode == 401) {
            var errorResponse = errorResponseFromJson(response.body);
            throw ErrorResponse(
                code: CODE_401,
                key: errorResponse.key,
                message: errorResponse.message,
                error: errorResponse.error);
          } else {
            var errorResponse = errorResponseFromJson(response.body);
            throw ErrorResponse(
                code: errorResponse.code,
                key: errorResponse.key,
                message: errorResponse.message,
                error: errorResponse.error);
          }
        }
        String body = utf8.decode(response.bodyBytes);
        if (response.body.contains('restException')) {
          RestExceptionResponse exceptionResponse =
              parseRestExceptionResponse(response.body);
          throw ErrorResponse(
              message: exceptionResponse.restException.errorMessage,
              code: exceptionResponse.restException.errorCode);
        } else {
          switch (requestType) {
            case RequestType.GETDICTIONARYMODULE:
              List<gridRowData.GridRowData> gridRows =
                  gridRowData.parseGridRowData(body);
              return gridRows;
              break;
            case RequestType.GETCREATEPANELS:
              List<subPanelUda.SubPanelUda> panels =
                  subPanelUda.parsePanels(body);
              panels.sort((a, b) => a.panelOrder.compareTo(b.panelOrder));
              return panels;
            case RequestType.GETCREATEUDAS:
              udas.UDAsObject obj = udas.UDAsObject();
              obj.udas = [];
              obj.udas = udas.parseUDAs(body);
              return obj;
            case RequestType.GETUDAOBJECT:
              udas.UDAsWithValues udaObject = udas.parseUDAObject(body);
              log(LogType.DEBUG,
                  'Get UDA object status code ====== ${response.statusCode}');
              log(LogType.DEBUG, 'Get UDA object body ====== ${response.body}');
              return udaObject;
            case RequestType.GETGRIDUDACOLUMNS:
              List<gridColumns.GridCols> columns =
                  gridColumns.parseGridCols(body);
              return columns;
            case RequestType.GETMULTILEVELUDALEVELS:
              log(LogType.DEBUG,
                  "Multiple level get levels response ==== $body");
              multiLevel.MultiLevelResponse multiLevelResponse =
                  multiLevel.parseMultiLevelResponse(body);
              return multiLevelResponse;
            case RequestType.GETMULTILEVELUDAFIRSTLEVEL:
              List<multiLevelRes.LevelDataModel> multiLevelResponse =
                  multiLevelRes.parseLevelsResponse(body);
              log(LogType.DEBUG,
                  "Multiple level get first level response ==== ${response.body}");
              return multiLevelResponse;
            case RequestType.GETMULTILEVELUDALEVELBYID:
              List<multiLevelRes.LevelDataModel> multiLevelResponse =
                  multiLevelRes.parseLevelsResponse(body);
              log(LogType.DEBUG, response.body);
              return multiLevelResponse;
            case RequestType.GETGENERICOBJECT:
              genericObject.GenericObject object =
                  genericObject.parseGenericObject(body);
              return object;
              break;
            case RequestType.GETHELPUDATASK:
              List<helpUDA.HelpUda> helpText = helpUDA.parseHelpTasks(body);
              return helpText;
              break;
            case RequestType.GETDICTIONARYVALUELISTVALUES:
              List<valueListUDA.ValueList> valueListValues =
                  valueListUDA.parseValueList(body);
              return valueListValues;
              break;
            case RequestType.APPTYPESREQUEST:
              var typesObj = parseTypes(body);
              return typesObj;
              break;
            case RequestType.GETFILTERSEARCHUDAS:
              var _udasOfSelectedType = parseUDAs(body);
              return _udasOfSelectedType;
              break;
            case RequestType.FILTERSEARCHSATUS:
              var list = parseStatus(body);
              return list;
            case RequestType.FILTERSEARCHVALULISTDATA:
              var data = jsonDecode(body);
              return data;
              break;
            case RequestType.DELETEFILTERSEARCHTEMPLATE:
              return "deleted";
              break;
            case RequestType.MOVETASK:
              return json.decode(body);
              break;
            case RequestType.CHANGENOTIFICATIONSEEN:
              return;
              break;
            case RequestType.GETMILESTONE:
              List<MilestoneObject> milestoneList = milestoneListFromJson(body);
              return milestoneList;
              break;
            case RequestType.GETMENTIONEDUSER:
              var empList = parseUsers(body);
              return empList;
            default:
              {}
          }
        }
      } on NoSuchMethodError catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.toString() + " NoSuchMethodError");
      } on SocketException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.message + " SocketException");
      } on TimeoutException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.message + " TimeoutException");
      } on HandshakeException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.message + " HandshakeException");
      } on TypeError catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: '${e.toString()} TypeError');
      } on FormatException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.message + "formatException");
      }
    }
  } on SocketException catch (_) {
    throw ErrorResponse(message: CODE_1);
  }
}

Future<dynamic> deleteCallService(
    String url, RequestType requestType, String sessionToken) async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      try {
        final response = await http
            //  .delete('$url $record',
            .delete(
          '$url',
          headers: {
            'Cache-Control': 'no-store',
            'Content-Type': 'application/json',
            'SessionToken': sessionToken,
          },
        ).timeout(const Duration(seconds: 60));
        final statusCode = response.statusCode;
        if (statusCode != 200) {
          if (statusCode > 500 && statusCode < 599) {
            throw ErrorResponse(
                message: CODE_2, error: "statusCode:" + statusCode.toString());
          } else if (statusCode == 401) {
            var errorResponse = errorResponseFromJson(response.body);
            throw ErrorResponse(
                code: CODE_401,
                key: errorResponse.key,
                message: errorResponse.message,
                error: errorResponse.error);
          } else {
            var errorResponse = errorResponseFromJson(response.body);
            throw ErrorResponse(
                code: errorResponse.code,
                key: errorResponse.key,
                message: errorResponse.message,
                error: errorResponse.error);
          }
        }
        String body = utf8.decode(response.bodyBytes);
        if (response.body.contains('restException')) {
          RestExceptionResponse exceptionResponse =
              parseRestExceptionResponse(response.body);
          throw ErrorResponse(
              message: exceptionResponse.restException.errorMessage,
              code: exceptionResponse.restException.errorCode);
        } else {
          switch (requestType) {
            case RequestType.DELETEGRIDRECORD:
              return statusCode;
              break;
            case RequestType.DELETEMONITORREQCORD:
            case RequestType.DELETEFILTERSEARCHTEMPLATE:
              return "";
              break;
            case RequestType.DELETEATTACHMENTUDAFILE:
              if (body == "[null]") return response.statusCode.toString();
              return body;
            case RequestType.DELETEMULTILEVELUDAREC:
              log(LogType.DEBUG,
                  "Delete multiple level record response ====== ${response.body}");
              if (body == "[null]") return response.statusCode.toString();
              return body;
            case RequestType.DELETENOTEUDA:
              return ' delete succsses';
            default:
              {}
          }
        }
      } on NoSuchMethodError catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.toString() + " NoSuchMethodError");
      } on SocketException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.message + " SocketException");
      } on TimeoutException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.message + " TimeoutException");
      } on HandshakeException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.message + " HandshakeException");
      } on TypeError catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: '${e.toString()} TypeError');
      } on FormatException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.message + "formatException");
      }
    }
  } on SocketException catch (_) {
    throw ErrorResponse(message: CODE_1);
  }
}

RestExceptionResponse parseRestExceptionResponse(String body) {
  final parsed = json.decode(body);
  return RestExceptionResponse.fromJson(parsed);
}
