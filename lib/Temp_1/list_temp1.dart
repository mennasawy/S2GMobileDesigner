import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/Add_New_Panel_screen(Tasks_screen).dart';
import 'package:templets/Temp_1/Screens_temp1/Add_New_task_screen(Sticky_Notes).dart';
import 'package:templets/Temp_1/Screens_temp1/Add_New_task_screen(Tasks_screen).dart';
import 'package:templets/Temp_1/Screens_temp1/App_menus_screen.dart';
import 'package:templets/Temp_1/Screens_temp1/Application_screen.dart';
import 'package:templets/Temp_1/Screens_temp1/Company_settings.dart';
import 'package:templets/Temp_1/Screens_temp1/Dashboard_screen.dart';
import 'package:templets/Temp_1/Screens_temp1/Done_tasks(tasks).dart';
import 'package:templets/Temp_1/Screens_temp1/Module_screen.dart';
import 'package:templets/Temp_1/Screens_temp1/Monitor_screen.dart';
import 'package:templets/Temp_1/Screens_temp1/Notification_screen.dart';
import 'package:templets/Temp_1/Screens_temp1/Profile_temp_1.dart';
import 'package:templets/Temp_1/Screens_temp1/Question_&_answer_screen.dart';
import 'package:templets/Temp_1/Screens_temp1/Sticky_Notes_screen.dart';
import 'package:templets/Temp_1/Screens_temp1/Support_Screen.dart';
import 'package:templets/Temp_1/Screens_temp1/about_screen.dart';
import 'package:templets/Temp_1/Screens_temp1/change_password.dart';
import 'package:templets/Temp_1/Screens_temp1/chart_detail_screen.dart';
import 'package:templets/Temp_1/Screens_temp1/check_license_screen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen(create-edit-clone-view).dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/edit_profile_screen.dart';
import 'package:templets/Temp_1/Screens_temp1/filter_search(Advanced_search).dart';
import 'package:templets/Temp_1/Screens_temp1/hold_screen(tasks).dart';
import 'package:templets/Temp_1/Screens_temp1/inprocess(tasks).dart';
import 'package:templets/Temp_1/Screens_temp1/language.dart';
import 'package:templets/Temp_1/Screens_temp1/log_screen.dart';
import 'package:templets/Temp_1/Screens_temp1/login_temp_1.dart';
import 'package:templets/Temp_1/Screens_temp1/privacy.dart';
import 'package:templets/Temp_1/Screens_temp1/push_Notification.dart';
import 'package:templets/Temp_1/Screens_temp1/reset_password_screen.dart';
import 'package:templets/Temp_1/Screens_temp1/settings_screen.dart';
import 'package:templets/Temp_1/Screens_temp1/short_cuts_screen.dart';
import 'package:templets/Temp_1/Screens_temp1/task_form_screen(tasks).dart';
import 'package:templets/Temp_1/Screens_temp1/tasks(to-do%20list)screen.dart';
import 'package:templets/Temp_1/Screens_temp1/this_week_plan_screen(tasks).dart';

class List_temp1 extends StatelessWidget {
  static const routeName = '/list_temp1';

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
    'Done tasks (tasks)',
    'task form screen (tasks)',
    'Add New Panel screen (Tasks screen)',
    'Add New task screen (Tasks screen)',
    'Sticky Notes screen',
    'Add New task screen (Sticky Notes)',
    'short cuts screen',
    'Monitor screen',
    'filter search (Advanced search)',
    'create screen (create -edit -clone -view)',
    'log screen',
    'Application screen',
    'App menus screen',
    'Module screen',
    'Company settings',
    'Support Screen',
    'Question & answer screen',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of temp1'),
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
                  Navigator.of(context).pushNamed(loginTemp1.routeName);
                  break;
                case 'profile':
                  Navigator.of(context).pushNamed(profileTemp1.routeName);
                  break;
                case 'reset password screen':
                  Navigator.of(context)
                      .pushNamed(Temp1ResetPasswordScreen.routeName);
                  break;
                case 'settings screen':
                  Navigator.of(context).pushNamed(SettingScreen.routeName);
                  break;
                case 'check license screen':
                  Navigator.of(context).pushNamed(CheckLicense.routeName);
                  break;
                case 'Dashboard screen':
                  Navigator.of(context).pushNamed(DashboardScreen.routeName);
                  break;
                case 'Notification screen':
                  Navigator.of(context).pushNamed(NotificationScreen.routeName);
                  break;
                case 'edit profile screen':
                  Navigator.of(context)
                      .pushNamed(Temp1EditProfileScreen.routeName);
                  break;
                case 'change password':
                  Navigator.of(context).pushNamed(ChangePassword.routeName);
                  break;
                case 'push Notification':
                  Navigator.of(context)
                      .pushNamed(PushNotificationScreen.routeName);
                  break;
                case 'language':
                  Navigator.of(context).pushNamed(LanguageScreen.routeName);
                  break;
                case 'privacy':
                  Navigator.of(context).pushNamed(PrivacyScreen.routeName);
                  break;
                case 'about screen':
                  Navigator.of(context).pushNamed(aboutScreen1.routeName);
                  break;
                case 'tasks(to-do list) screen':
                  Navigator.of(context).pushNamed(TaskToDoScreen.routeName);
                  break;
                case 'chart detail screen':
                  Navigator.of(context).pushNamed(ChartDetail.routeName);
                  break;
                case 'this week plan screen (tasks)':
                  Navigator.of(context).pushNamed(WeekPlanScreen.routeName);
                  break;
                case 'hold screen (tasks)':
                  Navigator.of(context).pushNamed(HoldScreen.routeName);
                  break;
                case 'inprocess (tasks)':
                  Navigator.of(context).pushNamed(InprocessScreen.routeName);
                  break;
                case 'Done tasks (tasks)':
                  Navigator.of(context).pushNamed(DoneTaskScreen.routeName);
                  break;
                case 'task form screen (tasks)':
                  Navigator.of(context).pushNamed(TaskFormScreen.routeName);
                  break;
                case 'Add New Panel screen (Tasks screen)':
                  Navigator.of(context).pushNamed(AddNewPanelscreen1.routeName);
                  break;
                case 'Add New task screen (Tasks screen)':
                  Navigator.of(context).pushNamed(AddNewtasklscreen1.routeName);
                  break;
                case 'Sticky Notes screen':
                  Navigator.of(context).pushNamed(StickyNotesScreen.routeName);
                  break;
                case 'Add New task screen (Sticky Notes)':
                  Navigator.of(context).pushNamed(AddNewtasklscreen2.routeName);
                  break;
                case 'short cuts screen':
                  Navigator.of(context).pushNamed(ShortCutsScreen.routeName);
                  break;
                case 'Monitor screen':
                  Navigator.of(context).pushNamed(MonitorScreen.routeName);
                  break;
                case 'filter search (Advanced search)':
                  Navigator.of(context).pushNamed(FilterSearchScreen.routeName);
                  break;
                case 'create screen (create -edit -clone -view)':
                  Navigator.of(context).pushNamed(CreateScreen.routeName);
                  break;
                case 'log screen':
                  Navigator.of(context).pushNamed(LogScreen.routeName);
                  break;
                case 'Application screen':
                  Navigator.of(context).pushNamed(Applicationscreen.routeName);
                  break;
                case 'App menus screen':
                  Navigator.of(context).pushNamed(AppMenusscreen.routeName);
                  break;
                case 'Module screen':
                  Navigator.of(context).pushNamed(ModuleScreen.routeName);
                  break;
                case 'Company settings':
                  Navigator.of(context).pushNamed(CompanySetting.routeName);
                  break;
                case 'Support Screen':
                  Navigator.of(context).pushNamed(SupportScreen.routeName);
                  break;
                case 'Question & answer screen':
                  Navigator.of(context)
                      .pushNamed(Question_Answer_Screen.routeName);
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
