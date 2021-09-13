import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';

class CreateScreen extends StatelessWidget {
  static const routeName = '/CreateScreen1';
  @override
  Widget build(BuildContext context) {
    return CreateGenericObjectScreen(
      objectId: "1012",
      mode: FormModes.newMode,
      typeID: 1012,
      hasModifyPrivilage: true,
      typeTitle: "UDAs",
      moduleID: "1012",
    );
  }
}
