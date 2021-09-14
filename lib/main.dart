import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:templets/Temp_1/Screens_temp1/ContactUs.dart';
import 'package:templets/Temp_1/Screens_temp1/todo_screens/AddNewPanelScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/todo_screens/ArchiveTaskScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/todo_screens/PanelWithTasksScreen.dart';
import 'package:templets/Temp_2/Screens_temp2/todo_screens/AddNewPanelScreen.dart';
import 'package:templets/Temp_2/Screens_temp2/todo_screens/PanelWithTasksScreen.dart';
import 'package:templets/Temp_2/Screens_temp2/todo_screens/ToDoListScreen.dart';
import 'package:templets/Utilities/StorageUtils/noteUda_provider.dart';
import 'package:templets/Temp_1/Screens_temp1/login_temp_1.dart';
import 'Temp_1/Screens_temp1/AdvancedSearchAssignmentInfo.dart';
import 'Temp_1/Screens_temp1/MonitorLogCardDetailsScreen.dart';
import 'Temp_1/Screens_temp1/Profile_temp_1.dart';
import 'Temp_1/Screens_temp1/SideMenu.dart';
import 'Temp_1/Screens_temp1/StickyNotesCreation.dart';
import 'Temp_1/Screens_temp1/WorkingDaysHours.dart';
import 'Temp_1/list_temp1.dart';
import 'Temp_2/Screens_temp2/AddStickyNote2.dart';
import 'Temp_2/Screens_temp2/BottomBarScreen.dart';
import 'Temp_2/Screens_temp2/ShortCutItemScreen.dart';
import 'Temp_2/Screens_temp2/login_temp_2.dart';
import 'Temp_2/Screens_temp2/profile_temp_2.dart';
import 'Temp_2/list_temp2.dart';
import 'Temp_1/Screens_temp1/about_screen.dart';
import 'Temp_1/Screens_temp1/Add_New_task_screen(Sticky_Notes).dart';
import 'Temp_1/Screens_temp1/Add_New_task_screen(Tasks_screen).dart';
import 'Temp_1/Screens_temp1/App_menus_screen.dart';
import 'Temp_1/Screens_temp1/Application_screen.dart';
import 'Temp_1/Screens_temp1/change_password.dart';
import 'Temp_1/Screens_temp1/chart_detail_screen.dart';
import 'Temp_1/Screens_temp1/check_license_screen.dart';
import 'Temp_1/Screens_temp1/create_screen(create-edit-clone-view).dart';
import 'Temp_1/Screens_temp1/Company_settings.dart';
import 'Temp_1/Screens_temp1/Dashboard_screen.dart';
import 'Temp_1/Screens_temp1/edit_profile_screen.dart';
import 'Temp_1/Screens_temp1/filter_search(Advanced_search).dart';
import 'Temp_1/Screens_temp1/hold_screen(tasks).dart';
import 'Temp_1/Screens_temp1/language.dart';
import 'Temp_1/Screens_temp1/log_screen.dart';
import 'Temp_1/Screens_temp1/Module_screen.dart';
import 'Temp_1/Screens_temp1/Monitor_screen.dart';
import 'Temp_1/Screens_temp1/Notification_screen.dart';
import 'Temp_1/Screens_temp1/privacy.dart';
import 'Temp_1/Screens_temp1/push_Notification.dart';
import 'Temp_1/Screens_temp1/Question_&_answer_screen.dart';
import 'Temp_1/Screens_temp1/reset_password_screen.dart';
import 'Temp_1/Screens_temp1/settings_screen.dart';
import 'Temp_1/Screens_temp1/short_cuts_screen.dart';
import 'Temp_1/Screens_temp1/Sticky_Notes_screen.dart';
import 'Temp_1/Screens_temp1/Support_Screen.dart';
import 'Temp_1/Screens_temp1/task_form_screen(tasks).dart';
import 'Temp_1/Screens_temp1/this_week_plan_screen(tasks).dart';

/////////////////////////////////////////////////////////////
import 'Temp_2/Screens_temp2/about_screen.dart';
import 'Temp_2/Screens_temp2/Add_New_task_screen(Sticky_Notes).dart';
import 'Temp_2/Screens_temp2/Add_New_task_screen(Tasks_screen).dart';
import 'Temp_2/Screens_temp2/change_password.dart';
import 'Temp_2/Screens_temp2/chart_detail_screen.dart';
import 'Temp_2/Screens_temp2/check_license_screen.dart';
import 'Temp_2/Screens_temp2/create_screen(create-edit-clone-view).dart';
import 'Temp_2/Screens_temp2/Dashboard_screen.dart';
import 'Temp_2/Screens_temp2/Done_tasks(tasks).dart';
import 'Temp_2/Screens_temp2/edit_profile_screen.dart';
import 'Temp_2/Screens_temp2/filter_search(Advanced_search).dart';
import 'Temp_2/Screens_temp2/hold_screen(tasks).dart';
import 'Temp_2/Screens_temp2/language.dart';
import 'Temp_2/Screens_temp2/log_screen.dart';
import 'Temp_2/Screens_temp2/Monitor_screen.dart';
import 'Temp_2/Screens_temp2/Notification_screen.dart';
import 'Temp_2/Screens_temp2/privacy.dart';
import 'Temp_2/Screens_temp2/push_Notification.dart';
import 'Temp_2/Screens_temp2/reset_password_screen.dart';
import 'Temp_2/Screens_temp2/settings_screen.dart';
import 'Temp_2/Screens_temp2/short_cuts_screen.dart';
import 'Temp_2/Screens_temp2/Sticky_Notes_screen.dart';
import 'Temp_2/Screens_temp2/task_form_screen(tasks).dart';
import 'Temp_2/Screens_temp2/this_week_plan_screen(tasks).dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NoteUdaProvider()),
      ],
      child: MaterialApp(
          title: 'Home Page',
          home: Scaffold(
              appBar: AppBar(
                title: const Text('Home Page'),
              ),
              body: _buttons()),
          routes: {
            //temp 1################################################
            List_temp1.routeName: (ctx) => List_temp1(),
            profileTemp1.routeName: (ctx) => profileTemp1(),
            loginTemp1.routeName: (ctx) => loginTemp1(),
            aboutScreen1.routeName: (ctx) => aboutScreen1(),
            AddNewPanelscreen1.routeName: (ctx) => AddNewPanelscreen1(),
            AddNewtasklscreen1.routeName: (ctx) => AddNewtasklscreen1(),
            AddNewtasklscreen2.routeName: (ctx) => AddNewtasklscreen2(),
            AppMenusscreen.routeName: (ctx) => AppMenusscreen(),
            Applicationscreen.routeName: (ctx) => Applicationscreen(),
            ChangePassword.routeName: (ctx) => ChangePassword(),
            ChartDetail.routeName: (ctx) => ChartDetail(),
            CheckLicense.routeName: (ctx) => CheckLicense(),
            CompanySetting.routeName: (ctx) => CompanySetting(),
            CreateScreen.routeName: (ctx) => CreateScreen(),
            DashboardScreen.routeName: (ctx) => DashboardScreen(),
            DoneTaskScreen.routeName: (ctx) => DoneTaskScreen(),
            Temp1EditProfileScreen.routeName: (ctx) => Temp1EditProfileScreen(),
            FilterSearchScreen.routeName: (ctx) => FilterSearchScreen(),
            HoldScreen.routeName: (ctx) => HoldScreen(),
            InprocessScreen.routeName: (ctx) => InprocessScreen(),
            LanguageScreen.routeName: (ctx) => LanguageScreen(),
            LogScreen.routeName: (ctx) => LogScreen(),
            ModuleScreen.routeName: (ctx) => ModuleScreen(),
            MonitorScreen.routeName: (ctx) => MonitorScreen(),
            NotificationScreen.routeName: (ctx) => NotificationScreen(),
            PrivacyScreen.routeName: (ctx) => PrivacyScreen(),
            PushNotificationScreen.routeName: (ctx) => PushNotificationScreen(),
            Question_Answer_Screen.routeName: (ctx) => Question_Answer_Screen(),
            Temp1ResetPasswordScreen.routeName: (ctx) =>
                Temp1ResetPasswordScreen(),
            SettingScreen.routeName: (ctx) => SettingScreen(),
            ShortCutsScreen.routeName: (ctx) => ShortCutsScreen(),
            StickyNotesScreen.routeName: (ctx) => StickyNotesScreen(),
            SupportScreen.routeName: (ctx) => SupportScreen(),
            TaskFormScreen.routeName: (ctx) => TaskFormScreen(),
            TaskToDoScreen2.routeName: (ctx) => TaskToDoScreen2(),
            WeekPlanScreen.routeName: (ctx) => WeekPlanScreen(),
            FilteredAdvancedSearch.routeName: (ctx) => FilteredAdvancedSearch(),
            ContactUs.routeName: (ctx) => ContactUs(),
            WorkingDayHour.routeName: (ctx) => WorkingDayHour(),
            StickyNotesCreation.routeName: (ctx) => StickyNotesCreation(),
            SideMenu.routeName: (ctx) => SideMenu(),
            MonitorLogCardDetailsScreen.routeName: (ctx) =>
                MonitorLogCardDetailsScreen(),

            //temp 2################################################

            List_temp2.routeName: (ctx) => List_temp2(),
            loginTemp2.routeName: (ctx) => loginTemp2(),
            profileTemp2.routeName: (ctx) => profileTemp2(),
            aboutScreen2.routeName: (ctx) => aboutScreen2(),
            AddNewPanelscreen2.routeName: (ctx) => AddNewPanelscreen2(),
            AddNewtasklscreen1_2.routeName: (ctx) => AddNewtasklscreen1_2(),
            AddNewtasklscreen2_2.routeName: (ctx) => AddNewtasklscreen2_2(),
            ChangePassword2.routeName: (ctx) => ChangePassword2(),
            ChartDetail2.routeName: (ctx) => ChartDetail2(),
            CheckLicense2.routeName: (ctx) => CheckLicense2(),
            CreateScreen2.routeName: (ctx) => CreateScreen2(),
            Temp2DashboardScreen2.routeName: (ctx) => Temp2DashboardScreen2(),
            DoneTaskScreen2.routeName: (ctx) => DoneTaskScreen2(),
            EditProfileScreen2.routeName: (ctx) => EditProfileScreen2(),
            FilterSearchScreen2.routeName: (ctx) => FilterSearchScreen2(),
            HoldScreen2.routeName: (ctx) => HoldScreen2(),
            InprocessScreen2.routeName: (ctx) => InprocessScreen2(),
            LanguageScreen2.routeName: (ctx) => LanguageScreen2(),
            LogScreen2.routeName: (ctx) => LogScreen2(),
            Temp2MonitorScreen2.routeName: (ctx) => Temp2MonitorScreen2(),
            NotificationScreen2.routeName: (ctx) => NotificationScreen2(),
            PrivacyScreen2.routeName: (ctx) => PrivacyScreen2(),
            PushNotificationScreen2.routeName: (ctx) =>
                PushNotificationScreen2(),
            ResetPasswordScreen2.routeName: (ctx) => ResetPasswordScreen2(),
            SettingScreen2.routeName: (ctx) => SettingScreen2(),
            ShortCutsScreen2.routeName: (ctx) => ShortCutsScreen2(),
            StickyNotesScreen2.routeName: (ctx) => StickyNotesScreen2(),
            ArchiveTaskScreen2.routeName: (ctx) => ArchiveTaskScreen2(),
//            TaskToDoScreen2.routeName: (ctx) => TaskToDoScreen2(),
            WeekPlanScreen2.routeName: (ctx) => WeekPlanScreen2(),
            AddStickyNote2.routeName: (ctx) => AddStickyNote2(),
            BottomBarScrenn.routeName: (ctx) => BottomBarScrenn(),
            SideMenu.routeName: (ctx) => SideMenu(),
            ShortCutItemScreen.routeName: (ctx) => ShortCutItemScreen(),
          }),
    );
  }
}

class _buttons extends StatelessWidget {
  const _buttons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  child: Text(
                    "Temp1",
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).pushNamed(List_temp1.routeName);
                  },
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: RaisedButton(
                  child: Text(
                    "Temp2",
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).pushNamed(List_temp2.routeName);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
