import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/MultipleLevel/MultipleLevelRowData.dart';
import 'package:flutter/material.dart';

abstract class IGETMultiLevelDataPresenter {
  void getLevels(BuildContext context, String repoId);
  void getFirstLevel(BuildContext context, String repoId);
  void getLevelById(BuildContext context, String repoId, String id);
  void addMultilevelRec(BuildContext context,
      MultipleLevelRowData multiLevelAddEditRequest, String udaName);
  void editMultilevelRec(BuildContext context,
      MultipleLevelRowData multiLevelAddEditRequest, String udaName);
}
