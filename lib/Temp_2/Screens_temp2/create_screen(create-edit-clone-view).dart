import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateGenericObjectScreen.dart';

class CreateScreen2 extends StatelessWidget {
  static const routeName = '/CreateScreen';
  @override
  Widget build(BuildContext context) {
    return Temp2CreateGenericObjectScreen(
      objectId: "1012",
      mode: FormModes.newMode,
      typeID: 1012,
      hasModifyPrivilage: true,
      typeTitle: "UDAs",
      moduleID: "1012",
    );
    // MaterialApp(
    //   home: Scaffold(
    //     appBar: AppBar(
    //       leading: InkWell(
    //         onTap: () {
    //           Navigator.pop(context);
    //         },
    //         child: Icon(
    //           Icons.arrow_back_ios,
    //           color: Colors.black54,
    //         ),
    //       ),
    //       title: const Text(' CreateScreen  temp 2'),
    //     ),
    //     body: const Center(
    //       child: Text('Screen'),
    //     ),
    //   ),
    // );
  }
}
