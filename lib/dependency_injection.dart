import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/AssignmentInfoUDAModel/AssignmentInfoModel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/AssignmentInfo/AsignementInfoGetGroupModel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/AssignmentInfo/save_editAssaigmentInfoResponse.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Attachment/attach_RowData.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Form/FormListMapping.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Form/FormUDAValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/DeleteGridModel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridRow.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Help.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MultipleLevel/getMultiLevelResponse.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Note/MentionNoteEmpInfo.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Note/savedNote.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/ValueList/ValueList.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/MentionUsersModel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/Rules.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/CreateUDAs/AssignmentInfo/AssignmentInfoService.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/CreateUDAs/Attachment/AttachUploadService.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/CreateUDAs/AssignmentInfo/AssignementInfoGetGroupInfoService.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/CreateUDAs/AssignmentInfo/saveAssignmentInfoService.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/CreateUDAs/Attachment/deleteAttachmentService.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/CreateUDAs/Attachment/editAttachmentNote.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/CreateUDAs/Grid/DictionaryModuleGridService.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/CreateUDAs/ValueListServices.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/CreateUDAs/FormUDAService.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/CreateUDAs/Grid/DeleteGridService.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/CreateUDAs/Grid/EditGridUDAService.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/CreateUDAs/Grid/GridUDAService.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/CreateUDAs/HelpTaskServices.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/CreateUDAs/InvokersServices.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/CreateUDAs/MultipleLevel/DeleteMultiLevel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/CreateUDAs/MultipleLevel/multiLevelService.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/CreateUDAs/Note/AddNoteService.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/CreateUDAs/Note/MentionNoteEmpInfoService.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/GenericObjectServiceCall.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/LoadingRulesServiceCall.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/MentionService.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/UDAsServiceCall.dart';

//DI
class Injector {
  static final Injector _singleton = new Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  UDAsServiceCall get udasToRepository {
    return new UDAsServiceCall();
  }

  DynamicValueListRepository get dynamicValueListRepo {
    return new ValueListServices();
  }

  DictionaryValueListRepository get dictionaryValueListRepo {
    return new ValueListServices();
  }

  DictionaryModuleGridRepository get dictionaryModuleRepo {
    return new DictionaryModuleGridService();
  }

  GridUDAService get gridUDARepo {
    return new GridUDAService();
  }

  InvokersServices get invokerUDARepo {
    return new InvokersServices();
  }

  GenericObjectServiceCall get genericObjectToRepository {
    return new GenericObjectServiceCall();
  }

  HelpRepository get helpRepository {
    return new HelpTaskServices();
  }

  AssignmentInfoRepositry get assignmentInfoRepositry {
    return new AssignmentInfoService();
  }

  AssignmentInfoGetGropRepositry get assignmentInfoGetGropRepositry {
    return new AssignementInfoGetGroupInfoService();
  }

  AttachUploadRepositry get attachUploadRepositry {
    return new AttachUploadService();
  }

  MentionNoteEmpInfoRepository get mentionNoteEmpInfoViewRepository {
    return new MentionNoteEmpInfo();
  }

  NoteRepository get addNoteRepository {
    return new NoteUDAServices();
  }

  DeleteNoteRepository get deleteNoteRepository {
    return new DeleteNoteServices();
  }

  EditGridUDARepository get editAttachmentRepository {
    return new EditGridUDAServices();
  }

  IDeleteAttachmentRepository get deleteAttachmentReposatory {
    return new DeleteAttachmentService();
  }

  IEditAttachmentNoteRepository get editAttechmentNoteRepository {
    return new EditAttachmentService();
  }

  GridRecoredRepositry get deleteGridRepository {
    return new DeleteGridService();
  }

  IAssignmentInfoSaveEditRepository get saveAssignmentInfoRepository {
    return new AssignmentInfoSaveService();
  }

  IMultiLevelGetRepository get getMultLevelRepository {
    return new MultiLevelService();
  }

  DeleteMultiLevelRepository get deleteMultiLvelRepository {
    return new DeleteMultiLevelService();
  }

  FormUDARepository get formUDARepo {
    return FormUDAService();
  }

  FormUDAMappingRepository get formUDAMappingRepo {
    return FormUDAService();
  }

  LoadingRulesRepository get loadingRulesRepository {
    return LoadingRulesServiceCall();
  }

  MentionRepository get mentionRepository {
    return new MentionService();
  }
}
