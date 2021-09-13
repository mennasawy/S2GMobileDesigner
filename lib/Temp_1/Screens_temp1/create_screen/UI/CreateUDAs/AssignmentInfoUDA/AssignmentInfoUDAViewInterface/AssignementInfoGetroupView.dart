import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/AssignmentInfo/AsignementInfoGetGroupModel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/ErrorResponse/error_data.dart';

abstract class AssignementInfoGetroupView {
  void onLoadComplete(List<AssignmentInfoGetGroupInfoModel> AsignementInfoList);
  void onLoadError(ErrorResponse errorResponse);
}
