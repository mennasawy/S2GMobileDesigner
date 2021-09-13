// import 'package:flutter/material.dart';
// import 'package:tteest/model/enum_screens.dart';
// import 'package:tteest/Widgets/floating_button.dart';
// import 'package:tteest/presenter/bottom_bar_manager.dart';
// import 'package:tteest/presenter/texts_presenter.dart';
// import 'package:tteest/widgets/custom_bottomnav.dart';
// import 'package:tteest/widgets/floatingactionbutton_customloc.dart';

// class Dashboard extends StatefulWidget {
//   @override
//   _DashboardState createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   TextsPresenter _textspresenter = new TextsPresenter();
//   BottomBarManager bottomBarManager = new BottomBarManager();
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () => bottomBarManager.openPreviousScreen(context),
//       child: Scaffold(
//         backgroundColor: Colors.grey,
//         body: Container(
//           child: Center(
//             child: Text(_textspresenter.applicationtexts.dashboardScreenTitle),
//           ),
//         ),
//         bottomNavigationBar: BottomNavigatioBar(
//           context: context,
//           enumScreens: EnumScreens.dashboard,
//         ),
//         floatingActionButton: Floatingbutton(),
//         floatingActionButtonLocation: CustomFloatingActionButtonLocation(0, 15),
//       ),
//     );
//   }
// }
