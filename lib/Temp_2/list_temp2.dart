import 'package:flutter/material.dart';
import 'package:templets/Temp_2/Screens_temp2/login_temp_2.dart';
import 'package:templets/Temp_2/Screens_temp2/profile_temp_2.dart';
import 'package:templets/Temp_2/Screens_temp2/tasks(to-do%20list)screen.dart';
import 'package:templets/Temp_2/Screens_temp2/todo_screens/AddNewPanelScreen.dart';
import 'package:templets/Temp_2/Screens_temp2/todo_screens/PanelWithTasksScreen.dart';
import 'package:templets/Temp_2/Screens_temp2/todo_screens/ToDoListScreen.dart';
import 'Screens_temp2/about_screen.dart';
import 'Screens_temp2/Add_New_Panel_screen(Tasks_screen).dart';
import 'Screens_temp2/Add_New_task_screen(Sticky_Notes).dart';
import 'Screens_temp2/Add_New_task_screen(Tasks_screen).dart';
import 'Screens_temp2/change_password.dart';
import 'Screens_temp2/chart_detail_screen.dart';
import 'Screens_temp2/check_license_screen.dart';
import 'Screens_temp2/create_screen(create-edit-clone-view).dart';
import 'Screens_temp2/Dashboard_screen.dart';
import 'Screens_temp2/Done_tasks(tasks).dart';
import 'Screens_temp2/edit_profile_screen.dart';
import 'Screens_temp2/filter_search(Advanced_search).dart';
import 'Screens_temp2/hold_screen(tasks).dart';
import 'Screens_temp2/inprocess(tasks).dart';
import 'Screens_temp2/language.dart';
import 'Screens_temp2/log_screen.dart';
import 'Screens_temp2/Monitor_screen.dart';
import 'Screens_temp2/Notification_screen.dart';
import 'Screens_temp2/privacy.dart';
import 'Screens_temp2/push_Notification.dart';
import 'Screens_temp2/reset_password_screen.dart';
import 'Screens_temp2/settings_screen.dart';
import 'Screens_temp2/short_cuts_screen.dart';
import 'Screens_temp2/Sticky_Notes_screen.dart';
import 'Screens_temp2/task_form_screen(tasks).dart';
import 'Screens_temp2/this_week_plan_screen(tasks).dart';

class List_temp2 extends StatelessWidget {
  static const routeName = '/list_temp2';

  final List<String> items = <String>[
    'login',
    'profile',
    'reset password screen',
    'settings screen',
    'check license screen',
    'Dashboard screen',
    'Notification screen',
    'edit profile screen',
    'change password',
    'push Notification',
    'language',
    'privacy',
    'about screen',
    'tasks(to-do list) screen',
    'chart detail screen',
    'this week plan screen (tasks)',
    'hold screen (tasks)',
    'inprocess (tasks)',
    // 'Done tasks (tasks)',
    'Archive task screen (tasks)',
    'Add New Panel screen (Tasks screen)',
    'Add New task screen (Tasks screen)',
    'Sticky Notes screen',
    'Add New task screen (Sticky Notes)',
    'short cuts screen',
    'Monitor screen',
    'filter search (Advanced search)',
    'create screen (create -edit -clone -view)',
    'log screen',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of temp2'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(' ${items[index]}'),
            onTap: () {
              switch (items[index]) {
                case 'login':
                  //go to the login screen
                  Navigator.of(context).pushNamed(loginTemp2.routeName);
                  break;
                case 'profile':
                  //go to the profile screen
                  Navigator.of(context).pushNamed(profileTemp2.routeName);
                  break;
                case 'reset password screen':
                  Navigator.of(context)
                      .pushNamed(ResetPasswordScreen2.routeName);
                  break;
                case 'settings screen':
                  Navigator.of(context).pushNamed(SettingScreen2.routeName);
                  break;
                case 'check license screen':
                  Navigator.of(context).pushNamed(CheckLicense2.routeName);
                  break;
                case 'Dashboard screen':
                  Navigator.of(context)
                      .pushNamed(Temp2DashboardScreen2.routeName);
                  break;
                case 'Notification screen':
                  Navigator.of(context)
                      .pushNamed(NotificationScreen2.routeName);
                  break;
                case 'edit profile screen':
                  Navigator.of(context).pushNamed(EditProfileScreen2.routeName);
                  break;
                case 'change password':
                  Navigator.of(context).pushNamed(ChangePassword2.routeName);
                  break;
                case 'push Notification':
                  Navigator.of(context)
                      .pushNamed(PushNotificationScreen2.routeName);
                  break;
                case 'language':
                  Navigator.of(context).pushNamed(LanguageScreen2.routeName);
                  break;
                case 'privacy':
                  Navigator.of(context).pushNamed(PrivacyScreen2.routeName);
                  break;
                case 'about screen':
                  Navigator.of(context).pushNamed(aboutScreen2.routeName);
                  break;
                case 'tasks(to-do list) screen':
                  Navigator.of(context).pushNamed(TaskToDoScreen2.routeName);
                  break;
                case 'chart detail screen':
                  Navigator.of(context).pushNamed(ChartDetail2.routeName);
                  break;
                case 'this week plan screen (tasks)':
                  Navigator.of(context).pushNamed(WeekPlanScreen2.routeName);
                  break;
                case 'hold screen (tasks)':
                  Navigator.of(context).pushNamed(HoldScreen2.routeName);
                  break;
                case 'inprocess (tasks)':
                  Navigator.of(context).pushNamed(InprocessScreen2.routeName);
                  break;
                // case 'Done tasks (tasks)':
                //   Navigator.of(context).pushNamed(DoneTaskScreen2.routeName);
                //   break;
                case 'Archive task screen (tasks)':
                  Navigator.of(context).pushNamed(ArchiveTaskScreen2.routeName);
                  break;
                case 'Add New Panel screen (Tasks screen)':
                  Navigator.of(context).pushNamed(AddNewPanelscreen2.routeName);
                  break;
                case 'Add New task screen (Tasks screen)':
                  Navigator.of(context)
                      .pushNamed(AddNewtasklscreen1_2.routeName);
                  break;
                case 'Sticky Notes screen':
                  Navigator.of(context).pushNamed(StickyNotesScreen2.routeName);
                  break;
                case 'Add New task screen (Sticky Notes)':
                  Navigator.of(context)
                      .pushNamed(AddNewtasklscreen2_2.routeName);
                  break;
                case 'short cuts screen':
                  Navigator.of(context).pushNamed(ShortCutsScreen2.routeName);
                  break;
                case 'Monitor screen':
                  Navigator.of(context)
                      .pushNamed(Temp2MonitorScreen2.routeName);
                  break;
                case 'filter search (Advanced search)':
                  Navigator.of(context)
                      .pushNamed(FilterSearchScreen2.routeName);
                  break;
                case 'create screen (create -edit -clone -view)':
                  Navigator.of(context).pushNamed(CreateScreen2.routeName);
                  break;
                case 'log screen':
                  Navigator.of(context).pushNamed(LogScreen2.routeName);
                  break;
              }
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
