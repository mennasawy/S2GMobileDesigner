import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//fonts
const double ICON_FONT_SIZE = 16.0;
const double LABEL_FONT_SIZE = 18.0;
const double TEXT_FONT_SIZE = 16.0;

//dimens
const double TEXTFIELD_BORDER_RADUIS = 5.0;
const double TEXTFIELD_BORDER_RADUIS_WIDTH = 2.0;
const double SIZED_BOX_MEDIUM_HEIGHT = 35.0;
const double SIZED_BOX_SMALL_HEIGHT = 10.0;
const double SIZED_BOX_LARGE_HEIGHT = 50.0;
const double WIDTH_OFFSET = 35;
const double TEXTFIELD_HEIGHT = 50;
const double TEXTFIELD_SEARCH_BORDER_RADUIS_WIDTH = 2.0;
const double TEXTFIELD_SEARCH_BORDER_RADUIS = 5.0;

//colors
Color RED = Colors.red;
Color LITE_GREY = Colors.blueGrey[50];
Color GREEN = Colors.green;
Color BLACK = Colors.black;
Color BLUE = Colors.blue;
Color GREY = Colors.grey[200];
Color DARK_GREY = Colors.grey;
Color WHITE = Colors.white;
Color BLACK26 = Colors.black26;
Color TRANSPARENT = Colors.transparent;

Color LITE_BLUE = Colors.lightBlue[50].withOpacity(0.3);
Color LITE_BLUE_ACCENT = Colors.lightBlueAccent.withOpacity(0.2);
Color DARK_BLUE = Colors.lightBlue[700];

Color LIGHT_GREEN = Colors.lightGreen;
Color YELLOW = Colors.yellow[500];
Color Main_Blue = Color(0xFF3D92CB);
Color Light_Blue = Color(0xFFF7FCFF);
Color Main_Green = Color(0xFF89B963);
Color Main_Dark_Grey = Color(0xFF3E3E3F);
Color Light_Grey = Color(0xFFFAFAFA); //Text Fields
Color Main_Red = Color(0xFFDC3B41);
Color Steal_blue = Color(0xFF4863A0);
Color Silk_blue = Color(0xFF488AC7); // support background
Color Blue_Koi = Color(0xFF659EC7);
Color Columbia_blue = Color(0xFF87AFC7);
Color Sky_blue = Color(0xFF6698FF);
Color Lite_Sky_Blue = Color(0xFF82CAFA);
Color Light_Green = Color(0xFF98FB98);

//Color Light_Yellow_Right =Color(0xFFEFCD4A);
//Color Light_Yellow_Left = Color(0xFFFFDB58);

Color Light_Yellow_Right = Color(0xFFF3E50D);
Color Light_Yellow_Left = Color(0xFFEEE231);
Color Light_Dark = Color(0xFF4A4A4A); /////////// main used
Color Text_Grey = Colors.black38.withOpacity(0.4); //////// hint default

const double OPACITY = 0.5;

//text
const String TEXT_CONST_RESET_PASSWORD_SCREEN =
    'Put your Register email ana will send you the password reset instructions ';

//alert Messages
const String USERNAME_AND_PASSWORD_DONT_MATH =
    " Please Enter Valid Username and password.";
// image assets
const String BG_LOGIN = "assets/bg_login.png";
const String BG_MENU = "assets/bg_menu.png";
const String BG_SPLASH = "assets/bg_splash.png";
const String BTN_ADD = "assets/bttn_add.png";
const String BTN_BACK = "assets/bttn_back.png";
const String BTN_CALENDER = "assets/bttn_calendarday.png";
const String BTN_EDIT = "assets/bttn_edit.png";
const String BTN_MENU_WHITE = "assets/bttn_menuwhite.png";
const String BTN_SEARCH = "assets/bttn_search.png";
const String IC_ARROW_CELL = "assets/ic_arrowcell.png";
const String IC_ATTACHED = "assets/ic_attached.png";
const String IC_CALENDER_TEXT = "assets/ic_calnedartxt.png";
const String IC_CHANGE_PASSWORD = "assets/ic_changepassword.png";
const String IC_CLOCK_TEXT_FIELD = "assets/ic_clocktxtfield.png";
const String IC_CLOSE = "assets/ic_close.png";
const String IC_COMPANY_SETTINGS = "assets/ic_companysettings.png";
const String IC_DROPDOWN = "assets/ic_dropdown.png";
const String IC_DUPLICATE_FIELD = "assets/ic_duplicatefield.png";
const String IC_EDIT_PROFILE = "assets/ic_editprofile.png";
const String IC_IMG_UPLOAD = "assets/ic_imgupload.png";
const String IC_INFO = "assets/ic_info.png";
const String IC_LANGUAGE = "assets/ic_language.png";
const String IC_LOCK_FIELD = "assets/ic_lockfield.png";
const String IC_MY_TASKS_TODO = "assets/ic_mytaskstodo.png";
const String IC_MY_TASKS_TOMORROW = "assets/ic_mytaskstodoarrow.png";
const String IC_NEWSPAPER = "assets/ic_newspaper.png";
const String IC_NOTIFICATION = "assets/ic_notificiation.png";
const String IC_NOTIFICATION_RED = "assets/ic_notificationred.png";
const String IC_PDF = "assets/ic_pdf.png";
const String IC_PUSH_SETTING = "assets/ic_pushsetting.png";
const String IC_PUSH_SHOW_PASSWORD = "assets/ic_showpassword.png";
const String IC_TEXT_FIELD_CHECK = "assets/ic_txtfieldcheck.png";
const String IC_WARNING_POPUP = "assets/ic_warningpopup.png";
const String IC_ZIP = "assets/ic_zip.png";
const String ILLUSTRATE_COMPANY_SETTINGS =
    "assets/illustrate_companysettings.png";
const String ILLUSTRATE_LANGUAGE = "assets/illustrate_language.png";
const String ILLUSTRATE_PASSWORD = "assets/illustrate_password.png";
const String ILLUSTRATE_PUSH = "assets/illustrate_push.png";
const String IMG_POWERED_BY_NTG = "assets/img_poweredbyntg.png";
const String IMG_SETTING_BG = "assets/img_settingbg.png";
const String STAGE_LOGO = "assets/stage_logo.png";
const String NTGAPPS_LOGO = "assets/NTGApps_logo.png";
const String IC_DELETE = "assets/ic_delete.png";
const String IC_MENU = "assets/ic_menu.png";
const String IC_CLOSE_X = 'assets/ic_closex.png';
const String SPLASH_COPY = "assets/Splash_Copy.png";
const String IC_FAQ = "assets/ic_faq.png";
const String IC_CONTACTUS = "assets/ic_contactus.png";
const String IC_QRSCANNER = "assets/ic_qrcode.png";
const String IC_QRCODEEDIT = "assets/ic_qrcodeedit.png";
const String IC_TODO_CALENDER = "assets/ic_todocalendar.png";
const String IC_TODO_CHECKED = "assets/ic_todochecked.png";
const String IC_TODO_UNCHECKED = "assets/ic_todounchecked.png";
// const String IC_TODO_UNCHECKED_BOX ="assets/todo_uncheckedbox.png";
const String IMG_PROFILE_NOPHOTO = 'assets/no-photo.png';
const String IMG_PROFILE_PLACEHOLDER = "assets/img_profileplaceholder.png";
const String BTTN_DAYS_AND_HOURS = "assets/bttn_workingdaysnhours.png";
const String IMG_ANSWERS_SCREEN = "assets/1.0x/img_faqbbg.png";
const String IC_TODO_CAUGHT_UP = "assets/ic_todoalcaughtup.png";
const String IC_ADD_TASK = "assets/ic_addtask.png";
const String IC_NOTIFICATION_ACTIVE = "assets/ic_notifications_active.png";
const String IC_NOTIFICATION_IN_ACTIVE = "assets/ic_notifications_inactive.png";

const String BTN_ADD_GRID_BLUEE = "assets/add_girdblue.png";
const String BTN_ADD_NEW_GRID = "assets/add_gridnew.png";
const String BTN_GRID_DOWNLOAD = "assets/download_bttn.png";
const String BTN_ATTACHMENT_DOWNLOAD = "assets/ic_attacheddownload.png";
const String IC_EDIT_GRID = "assets/ic_editgrid.png";
const String IC_FILTER = "assets/ic_filter.png";
const String IC_SORT = "assets/ic_sort.png";

const String IMG_CHANGE_PASSWORD = 'assets/2.0x/illustrate_password.png';
const String IMG_COMPANY_SETTINGSCREEN =
    'assets/2.0x/illustrate_companysettings.png';
const String IMG_LANGUAGE_SCREEN = 'assets/2.0x/illustrate_language.png';
const String IMG_NOTFICATION_SETING_SCREEN = 'assets/2.0x/illustrate_push.png';

const String FILE_COMPRESSED = "assets/file_compressed.png";
const String FILE_DOC = "assets/file_doc.png";
const String FILE_GENERIC = "assets/file_generic.png";
const String FILE_IMG = "assets/file_img.png";
const String FILE_PDF = "assets/file_pdf.png";
const String FILE_SOUND = "assets/file_sound.png";
const String FILE_TXT = "assets/file_txt.png";
const String FILE_VIDEO = "assets/file_video.png";
const String NOTE_ACTIVE = "assets/ic_note_active.png";
const String NOTE_INACTIVE = "assets/ic_note_inactive.png";

// Template2
const String IC_INCOMPLETE_TASK = "assets/ic_incomplete_task.png";
const String IC_COMPLETED_TASK = "assets/ic_completed_task.png";
const String IC_APPS_TEMP2 = "assets/apps_temp2.png";
const String IC_DASHBOARD_TEMP2 = "assets/dashboard_temp2.png";
const String IC_SHORTCUTS_TEMP2 = "assets/shortcuts_temp2.png";
const String IC_STICKYNOTES_TEMP2 = "assets/sticky-notes_temp2.png";
const String IC_TODOTASKS_TEMP2 = "assets/tasks_temp2.png";
const String IC_FILTER_2 = "assets/search_2.png";
const String TEMP2_IC_MENU = "assets/sort.png";
const String TEMP2_IC_TIME = "assets/time.png";
const String TEMP2_IC_FILTER = "assets/filter.png";
const String TEMP2_IC_SEACH_2 = "assets/search2.png";
const String TEMP2_IC_EDIT_2 = "assets/edit2.png";
const String TEMP2_IC_DELETE_2 = "assets/delete2.png";
const String TEMP2_IC_NOTIFICATION_2 = "assets/notification2.png";
const String TEMP2_IC_NOTIFICATION_SEEN_2 = "assets/notification_seen2.png";
const String TEMP2_ADD = "assets/add2.png";
const String TEMP2_ADD_NEW = "assets/temp2_add_new.png";
const String TEMP2_EDIT = "assets/temp2_edit.png";
const String TEMP2_DELETE = "assets/temp2_delete.png";
const String TEMP2_ADD_BLUE = "assets/temp2_add_blue.png";
const String TEMP2_DATE = "assets/temp2_date.png";
const String TEMP2_TIME = "assets/temp2_time.png";
const String TEMP2_DATE_TIME = "assets/temp2_date_time.png";
const String TEMP2_UPLOAD_ATTACH_2 = "assets/uploadAttach2.png";
const String TEMP2_DOWNLOAD_ATTACH_2 = "assets/uploadAttach2.png";
const String TEMP2_NOTE_ATTACH_2 = "assets/uploadAttach2.png";

//routs
const String INIT_ROUTE = "/";
const String MENU_ROUTE = "/Menu";
const String SPLASH_SCREEN_ROUTE = '/splash';
const String ProfileSettings_ROUTE = "/ProfileSettings";
const String EditProfile_ROUTE = "/EditProfile";
const String ChangePassword_ROUTE = "/ChangePassword";
const String NotificationSettings_ROUTE = "/NotificationSettings";
const String ChangeLanguage_ROUTE = "/ChangeLanguage";
const String CompanySettings_ROUTE = "/CompanySettings";
const String PrivacyPolicy_ROUTE = "/PrivacyPolicy";
const String ABOUT_ROUTE = "/About";
const String Dashboard_ROUTE = "/Dashboard";
const String Applications_ROUTE = "/Applications";
const String ToDo_ROUTE = "/ToDo";
const String TODO_AddNewTask_ROUTE = "/AddNewTask";
const String APP_SETTINGS = "/app_setting";
const String RESET_PASSWORD_SCREEN = "/reset_password_screen";
const String WorkingDays_Hours_ROUTE = "/WorkingDays_Hours";
const String MODULE_NAMED_SCREEN = "/Module_screen";
const String MONITOR_SCREEN_ROUTE = "/monitor";
const String MODULES_SCREEN_ROUTE = "/Modules";
const String SUPPORT_SCREEN_ROUTE = '/support_screen';
const String TODO_TASK_DEDAILS_ROUTE = '/todo_task_details';
const String LOG_SCREEN_ROUTE = '/log_screen';
const String LOG_CARD_SCREEN_ROUTE = '/log_screen';
const String FAQSCREEN_ROUTE = '/Answers';
const String My_TODO_LIST_SCREEN_ROUTE = '/my_todo_list';
const String Task_Creation_Screen_SCREEN_ROUTE = '/create_task';
const String GRID_ROWS_SCREEN = '/grid_rows';
const String ADD_GRID_SCREEN = '/add_grid_screen';
const String MULTI_LEVEL_SCREEN = '/multi_level_screen';

//handle error
const String RESULT = "result";
const String STATUS = "status";
const String TIME_STAMP = "key";
const String ERROR = "error";
const String CODE = "code";
const String MESSAGE = "message";
const String KEY = "key";
const String YES = "Yes";
const String NO = "No";

//error cods
const String CODE_401 = "401";
const String CODE_9 = "9";
const String CODE_3 = "3";
const String CODE_2 = "2";
const String CODE_1 = "1";
const String CODE_0 = "0";
const String CODE_0000 = '0000';
const String CODE_0099 = '0099';
const String CODE_40001 = "40001";
const String CODE_40002 = "40002";
const String CODE_40006 = "40006";
const String CODE_LOGOUT = "000";
const String CODE_NOT_FOUND = "001";
const String NOT_MATCH = "002";
const String PASSWORD_NOTUPDATE = "003";
const String CODE_PROFILE_EXCEPTION = "888888";
const String CODE_LOGIN_RECAPTURE = "009";
const String SERVER_ERROR = "server_error";
const String INTERNET_ERROR = "internet_error";
const String ERROR_HAPPENED = "Error happened"; //
const String REQUEST_FAILED = "requestFailed"; //
const String TIME_OUT = "Client timeout";
const String LINE_BREAK = "\n";
const String NO_SUCH_METHOD_ERROR = "NoSuchMethodError";
const String SOCKET_EXCEPTION = "SocketException";
const String TIMEOUT_EXCEPTION = "TimeoutException";
const String HANDSHAKE_EXCEPTION = "HandshakeException";
const String FORMAT_EXCEPTION = "FormatException";
const String TYPE_ERROR = " TypeError";
const String STATUS_CODE = "statusCode:";
const String USER_NOT_FOUND = "User is Not Found";
const String FAILED_TO_UPDATE_PASSWORD = "failed to update password";
const String PASSWORD_NOT_MATCH = "password not matching";

//list
const List<String> listTitle = [
  'Lorem Ipsum Level 3',
  'Update account email address ',
  'Change Password',
  'Modify privacy Settinge',
  'Setting ',
  'Edit Profile',
  'Change Profile Photo'
];

//TextStyles
//----------------Profile Settings----------------
TextStyle profileSettingsTitleStyle =
    TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white);
TextStyle FAQScreenTitleStyle =
    TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.black);
TextStyle changePasswordCenterTitleStyle =
    TextStyle(fontSize: 20, color: Colors.grey);
TextStyle profileSettingsSubtitleStyle =
    TextStyle(fontSize: 16, color: Colors.white);
TextStyle profileSettingsMenuItemStyle =
    TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black);
TextStyle QuestionAnswersStyle = TextStyle(fontWeight: FontWeight.bold);
///// Footer Styles
TextStyle textFooterWidgetStyle = TextStyle(
    color: Colors.black,
    decoration: TextDecoration.none,
    fontFamily: 'Montserrat',
    fontSize: 14.0);
TextStyle textMyTodoTitleStyle = TextStyle(
    color: Colors.black,
    decoration: TextDecoration.none,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w900,
    fontSize: 22.0);
TextStyle buttonFooterWidgetStyle =
    TextStyle(fontSize: 14.0, color: Colors.blue, fontFamily: 'Montserrat');
//// Notification Setting style
TextStyle FROM_TO_STYLE = TextStyle(color: Colors.grey, fontSize: 18.0);

//// Search style
TextStyle hintStyleSearchTextField =
    TextStyle(color: GREY.withOpacity(OPACITY), fontSize: 18.0);

///moudle name screen list style
TextStyle itemListSearch = TextStyle(
    color: BLACK, fontFamily: 'Montserrat', fontWeight: FontWeight.bold);
//DropDawnUDA style
TextStyle DropDownUDA = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
    color: BLACK);

////reset password screen constant paragraph
TextStyle constResetPasswordScreenParagraphTextStyle = TextStyle(
    color: Colors.grey,
    decoration: TextDecoration.none,
    fontFamily: 'Montserrat',
    fontSize: 18.0);
TextStyle styleDashboard = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
TextStyle todoTabsTextStyle = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 19,
    fontWeight: FontWeight.w400,
    color: BLACK);

TextStyle titlesTextStyle = TextStyle(
    fontFamily: 'Tahoma',
    color: BLACK,
    fontSize: 20,
    fontWeight: FontWeight.w700);
TextStyle whiteTitlesTextStyle = TextStyle(
    fontFamily: 'Tahoma',
    color: WHITE,
    fontSize: 20,
    fontWeight: FontWeight.w700);
TextStyle subtitlesTextStyle = TextStyle(
    fontFamily: 'Tahoma',
    color: BLACK,
    fontSize: 17,
    fontWeight: FontWeight.w700);
TextStyle normalTextStyle = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: BLACK,
    decoration: TextDecoration.none);
TextStyle normalWhiteTextStyle = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 14,
    color: WHITE,
    fontWeight: FontWeight.w400);
TextStyle normalGreyTextStyle = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 17,
    fontWeight: FontWeight.w400,
    color: DARK_GREY);
TextStyle normalBlueTextStyle = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: Blue_Koi);
TextStyle normalLightBlueTextStyle = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: Colors.blue[700]);
TextStyle normalBoldedTextStyle = TextStyle(
    fontFamily: 'SF Pro Text', fontSize: 18, fontWeight: FontWeight.w700);
TextStyle normalWhiteBoldedTextStyle = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: WHITE);

TextStyle errorTextStyle = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: RED);
TextStyle boldtitlesTextStyle = TextStyle(
    fontFamily: 'Tahoma',
    color: BLACK,
    fontSize: 23,
    fontWeight: FontWeight.w700);
TextStyle whiteBoldtitlesTextStyle = TextStyle(
    fontFamily: 'Tahoma',
    color: WHITE,
    fontSize: 23,
    fontWeight: FontWeight.w700);
TextStyle labelTextStyle = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 15,
    color: BLACK,
    fontWeight: FontWeight.w400);
TextStyle labelMandatoryTextStyle = TextStyle(
    fontFamily: 'SF Pro Text',
    color: Main_Red,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none);
TextStyle hintTextFieldTextStyle =
    TextStyle(fontFamily: 'SF Pro Text', fontSize: 13, color: Text_Grey);

TextStyle noteTextStyle = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 17,
    fontWeight: FontWeight.w400,
    color: BLACK);
TextStyle dateTextStyle = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 15,
    color: BLACK,
    fontWeight: FontWeight.w400);
TextStyle greyLogTimeTextStyle = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: DARK_GREY);
TextStyle blueLogDateTextStyle = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: Blue_Koi);
TextStyle panelUnselectedStyle =
    TextStyle(color: DARK_GREY, fontFamily: 'SF Pro Text');
TextStyle panelSelectedStyle = TextStyle(
    color: BLACK, fontFamily: 'SF Pro Text', fontWeight: FontWeight.w700);

TextStyle gridBoldedTextStyle(Color color) {
  return TextStyle(
      fontFamily: 'SF Pro Text',
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: color == null ? Light_Dark : color);
}

TextStyle normalGridTextStyle(Color color) {
  return TextStyle(
      fontFamily: 'SF Pro Text',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: color == null ? Light_Dark : color);
}
