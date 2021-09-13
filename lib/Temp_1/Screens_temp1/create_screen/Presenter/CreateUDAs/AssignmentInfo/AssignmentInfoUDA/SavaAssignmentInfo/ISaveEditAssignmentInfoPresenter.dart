import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/AssignmentInfo/editAssignmentInfo.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/AssignmentInfo/saveAssignmentInfoBody.dart';
import 'package:flutter/material.dart';

abstract class ISaveEditAssignmentInfoPresenter {
  void saveEditAssignmentInfo(
      BuildContext context, AssignmentInfoSaveBody assignmentInfoSaveBody);

  void editAssignmentInfo(
      BuildContext context, AssignmentInfoEditBody assignmentInfoEditBody) {}
}
