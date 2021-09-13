import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/AssignmentInfo/AsignementInfoGetGroupModel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/AssignmentInfo/AssignementInfoGetGroupBodyModel.dart';
import 'package:templets/dependency_injection.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/AssignmentInfoUDA/AssignmentInfoUDAViewInterface/AssignementInfoGetroupView.dart';
import 'package:flutter/cupertino.dart';

class AssignementInfoGetGroupPresenter {
  AssignementInfoGetroupView assignementInfoGetroupView;
  AssignmentInfoGetGropRepositry assignmentInfoGetGropRepositry;
  AssignementInfoGetGroupPresenter(this.assignementInfoGetroupView) {
    assignmentInfoGetGropRepositry =
        new Injector().assignmentInfoGetGropRepositry;
  }
  void loadMembers(BuildContext context,
      AssignmentInfoGetGroupInfoBody assignmentInfoGetGroupInfoBody) {
    assignmentInfoGetGropRepositry
        .getGroupInfo(context, assignmentInfoGetGroupInfoBody)
        .then((c) => assignementInfoGetroupView.onLoadComplete(c))
        .catchError(
            (onError) => assignementInfoGetroupView.onLoadError(onError));
  }
}
