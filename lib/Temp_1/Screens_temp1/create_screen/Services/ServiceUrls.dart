import 'package:templets/Utilities/const.dart';

class ServiceUrls {
  String serverUrl;
  String companyLogo;
  String port;
  String baseUrl;
  String mainFunctionUrl;
  String loginServiceUrl;
  String addUserServiceUrl;
  String menuUrl;
  String getAppBarMenus;
  String getMenuApps;
  String getTypesPrivllage;
  String udaControllerUrl;
  String typeUdaUrl;
  String typesServiceUrl;
  String businessTypeUrl;
  String objectStatusControllerUrl;
  String statusWithWeight;
  String udaSubPanel;
  String udaMultivalue;
  String addTemplateMonitor;
  String udaGrid;
  String templateMonitor;
  String getWatchListTickets;
  String deleteRuleTemplateByTemplateName;
  String watchList;
  String addWatchList;
  String genericObjectUrlOP;
  String genericObjectUrl;
  String getObjectsFieldsUrl;
  String objectsFieldsControllerUrl;
  String getDictionaryUDAValues;
  String getMultiValueUDA;
  String deleteoneWatch;
  String todolisturl;
  String todoListArchive;
  String pickUpTaskUrl;
  String workingHours;
  String getEmployeeTasksUrl;
  String handleSaveDoneTask;
  String addDoneNotification;
  String updateTask;
  String editTaskInfo;
  String planTemplateURL;
  String processTasks;
  String getPlanTemplates;
  String planTemplateTaskURL;
  String getPlanTasks;
  String getMentionedEmployee;
  String getMentionUsers;
  String Notification;
  String multipleSave;
  String getHelpText;
  String getEmpInfo;
  String SystemTxt = '/SystemTxt';
  String deletemobileObjects;
  String addSubStatus;
  String subStatus;
  String deleteSubStatus;
  String getSubStatusPanels;
  String addUsrSubSts;
  String dynamicValueList;
  String formUDA;
  String dashboard;
  String getlastRows;
  String resetPassword;
  String getRecordLogs;
  String getMyTasksPool;
  String getDelegatedTasksPool;
  String getMangerEmployees;
  String assignMembersToTask;
  String removeMemberFromTask;
  String getMemberByImage;
  String getPriority;
  String addNote;
  String changePassword;
  String myTodoList;
  String stickyNotes;
  String deleteOneStickyNote;
  String addOneStickyNote;
  String deleteNoteUda;
  String editGridUda;
  String deleteOneGridRecord;
  String saveAssignmentInfo;
  String deleteAttachment;
  String editAttachmentNote;
  String checkAndUncheckOneStickNote;
  String assignmentInfo;
  String getMuliLevelsData;
  String findTaskUdas;
  String taskRouts;
  String assignementInfoGetGroupInfo;
  String getFirstLevelMultiLevel;
  String getAnyLevelMultiLevel;
  String multiLevelRepo;
  String addEditMultiLevelRec;
  String dbInvoker;
  String soapInvoker;
  String ruleInvoker;
  String downloadImage;
  String udaObject;
  String formUDAMapping;
  String dictionaryValueList;
  String dictionaryModule;
  String loadingRules;
  String getDrillDownDetailsValue;
  String getFormUDAValuesForSearch;
  String getDashboardFreeModules;
  String getChartUDA;
  String getMonitorAssignmentInfo;
  String openReportPDF;
  String getThemes;
  String getThemeValues;
  String mobileObjects;
  String getAppDetails;
  String dashboardAllData;
  String DoneTasksCount;
  String getShortCuts;
  String getTaskById;
  String getMileStone;

  ServiceUrls(context) {
    baseUrl = 'https://smart2gotest.ntgeg.com/mob_dev/rest/';
    mobileObjects = baseUrl + 'mobileObjects/';
    addEditMultiLevelRec = baseUrl + 'UDAs/addMultipleLevelUdaRow';
    multiLevelRepo = 'MultipleLevelRepo/';
    getFirstLevelMultiLevel =
        baseUrl + multiLevelRepo + 'getAllParentLevelByParentIdIsNull/';
    getAnyLevelMultiLevel =
        baseUrl + multiLevelRepo + 'getAllParentLevelByParentId/';
    getMuliLevelsData = baseUrl + multiLevelRepo + 'getRepo/';
    saveAssignmentInfo = baseUrl + 'GenericObject';
    getlastRows = baseUrl + 'mobileObjects/getLatestRecords/';
    deletemobileObjects = baseUrl + 'mobileObjects/deleteobject';
    SystemTxt = baseUrl + 'SystemTxt/';
    mainFunctionUrl = baseUrl + 'MainFunciton/';
    loginServiceUrl = mainFunctionUrl + 'login/';
    //  loginServiceUrl = baseUrl + "mobileObjects/" + 'login/';
    addUserServiceUrl = mainFunctionUrl + 'addEmployee';
    // menuUrl = baseUrl + 'Menu/';
    menuUrl = baseUrl + 'mobileObjects/';
    getAppBarMenus = menuUrl + 'getAppBarMenus';
    getMenuApps = menuUrl + 'getMenuApps';
    getTypesPrivllage = baseUrl + "TypesGroups/";
    udaControllerUrl = baseUrl + 'UDAs/';
    getDictionaryUDAValues = udaControllerUrl + "getDictionaryUDAValues/";
    getMultiValueUDA = udaControllerUrl + "multivalue/";
    typeUdaUrl = udaControllerUrl + 'types/';
    // typeUdaUrl = baseUrl + "mobileObjects/types/";
    typesServiceUrl = baseUrl + 'TypesOperations/';
    businessTypeUrl = typesServiceUrl + 'types/';
    objectStatusControllerUrl = baseUrl + 'Status/';
    statusWithWeight = objectStatusControllerUrl + 'statuswithweight';
    // udaSubPanel = baseUrl + 'udaSubPanel/';
    udaSubPanel = baseUrl + 'mobileObjects/getAll/';
    udaMultivalue = udaControllerUrl + 'multivalue/';
    udaGrid = udaControllerUrl + 'grid/';
    addTemplateMonitor = baseUrl + 'TemplateMonitor';
    templateMonitor = addTemplateMonitor + '/getTemplatesByUser';
    deleteRuleTemplateByTemplateName = addTemplateMonitor + '/deleteTemplate';
    watchList = baseUrl + 'WatchList/';
    addWatchList = watchList + 'addWatchList';
    getWatchListTickets = watchList + 'getTicketWatchedToMobile/';
    genericObjectUrl = baseUrl + 'GenericObject/';
    genericObjectUrlOP = genericObjectUrl;
    getObjectsFieldsUrl = objectsFieldsControllerUrl;
    objectsFieldsControllerUrl = baseUrl + 'ObjectsFieldsRep/';
    deleteoneWatch = watchList + 'deleteoneWatch/';

    todolisturl = baseUrl + 'toDo/';
    getEmployeeTasksUrl = todolisturl + 'getEmployeeTasks';
    assignMembersToTask = todolisturl + 'AssignMembersToTask';
    handleSaveDoneTask = todolisturl + 'handleSaveDoneTask';
    addDoneNotification = todolisturl + 'addDoneNotification';
    updateTask = todolisturl + 'updateTask';
    editTaskInfo = todolisturl + 'editTaskInfo';
    todoListArchive = baseUrl + 'toDoArchive/AllData/';
    getMyTasksPool = todolisturl + 'AllData';
    getDelegatedTasksPool = todolisturl + "AllDelegateTasks";
    workingHours = todolisturl + 'workingHours?taskRecId=';
    findTaskUdas = todolisturl + 'findTaskUdas';
    pickUpTaskUrl = todolisturl + "chickInAndOutForTask";
    getMangerEmployees = baseUrl + "MainFunciton/getEmployeesByManagerId/";
    removeMemberFromTask = todolisturl + "RemoveEmployeeFromTask";
    getMemberByImage = todolisturl + "getMemberByImage";
    getPriority = baseUrl + "Urgent/";
    subStatus = baseUrl + 'SubStatus/';
    deleteSubStatus = subStatus + 'deleteSubStatus';

    taskRouts = todolisturl + 'taskRouts';
    planTemplateURL = baseUrl + 'PlanTemplate/';
    processTasks = planTemplateURL + 'processTasks';
    getPlanTemplates = planTemplateURL + 'getPlanTemplates';
    planTemplateTaskURL = baseUrl + 'PlanTemplateTask/';
    getPlanTasks = planTemplateTaskURL + 'getTasks';
    getMentionedEmployee = mainFunctionUrl + 'getMentionedEmployee/';
    getMentionUsers = mainFunctionUrl + 'getMentionUsers/';
    Notification = baseUrl + 'Notification';
    multipleSave = baseUrl + 'utils/multipleSave';
    getHelpText = baseUrl + 'getHelpUdaId/';
    getEmpInfo = mainFunctionUrl + 'getEmpInfo/';
    addSubStatus = todolisturl + 'addSubSts';
    subStatus = baseUrl + 'SubStatus/';
    addUsrSubSts = subStatus + 'addUsrSubSts';
    getSubStatusPanels = subStatus + 'AllData';
    DoneTasksCount = baseUrl + 'mobileTasks/getDoneTasks/';
    getTaskById = todolisturl + 'getToDoTask/';
    dynamicValueList = baseUrl + 'integrationRepo/excuteQuery/';
    formUDA = baseUrl + 'UDAs/getFormUDAValues/false/false';

    dashboard = baseUrl + 'DashBoard/' + 'charts';
    getDrillDownDetailsValue = baseUrl + "DashBoard" + "/drillDwonDetails";
    getDashboardFreeModules = baseUrl + "charts/getDashboardFreeModules";
    resetPassword = baseUrl + 'mobilesetting/' + 'resetPassword';
//    companyLogo = baseUrl + 'mobileLogoProfile/getlogobycompany/';
//    companyLogo = /*baseUrl*/ "https://tsystem.ntgeg.com/dev/rest/" +
    companyLogo = baseUrl + 'getlogobycompany/';
//    getRecordLogs=baseUrl+'GenericStatusLog/findAllByTypeId/';

    getRecordLogs = genericObjectUrl + 'getObjectLogs';

    addNote = baseUrl + 'UDAs';
    changePassword = baseUrl + 'mobilesetting/' + 'changeProfilePassword';
    deleteNoteUda = genericObjectUrl + 'genericDeleteGrid';
    editGridUda = baseUrl + 'UDAs/grid/gridRow/';
    stickyNotes = baseUrl + 'ToDoOperations/todo/';
    myTodoList = stickyNotes + 'employeeid/-1';
    deleteOneStickyNote = stickyNotes;
    addOneStickyNote = stickyNotes;
    editAttachmentNote = baseUrl + 'UDAs/Attachment/updateAttach/';
//    editAttachmentNote=baseUrl+'UDAs/Attachment/updateAttach/attachment_testsattachme';
    deleteAttachment = baseUrl + 'GenericObject/genericDeleteGrid/';
    deleteOneGridRecord = baseUrl + 'GenericObject/genericDeleteGrid/';
    checkAndUncheckOneStickNote = stickyNotes;
    assignmentInfo = mainFunctionUrl + 'getCorporation';
    assignementInfoGetGroupInfo = baseUrl + 'MainFunciton/' + 'groupMembers';
    dbInvoker = baseUrl + "/mobileDbInvoker/genericObjectRequest/";
    soapInvoker = baseUrl + "/mobileSoapInvoker/genericObjectRequest/";
    ruleInvoker = baseUrl + "/ruleBuilder/ruleInvokerExcute/genObj/";
    downloadImage = baseUrl + "utils/downloadFilesForMobile";
    udaObject = baseUrl + "UDAs/getUdaObject/";
    formUDAMapping = baseUrl + "UDAs/types/formListMapping/doMapping";
    dictionaryValueList = baseUrl + "UDAs/getDictionaryUDAValues/";
    // dictionaryModule = baseUrl + "UDAs/dictionaryData/";
    dictionaryModule = baseUrl + "mobileObjects/dictionaryData/";
    loadingRules = baseUrl + "mobileObjects/checkLoadingRules/";
    getFormUDAValuesForSearch = baseUrl + "UDAs/getFormUDAValues/";
    getChartUDA = baseUrl + "mobileObjects/getChartUdaDataMobile/";
    getMonitorAssignmentInfo = mainFunctionUrl + "getMonitorAssignmentInfo";
    getAppDetails = mobileObjects + "GetAppDetails/";
    getThemes = baseUrl + "Themes/getThemes";
    getThemeValues = baseUrl + "Themes/getThemeValues";
    dashboardAllData = baseUrl + "mobileObjects/charts";
    getShortCuts = baseUrl + "ShortCut/listDashBoardShortCut";
    getMileStone = baseUrl + 'PlanTemplateTask/getMileStoneTasks/';
  }

  loadServerData() async {
    // SettingsData data = SettingsData.fromJson(await sharedpref.read("setting"));
    // loaddata = data;
    // serverUrl = loaddata.server;
    // port = loaddata.port;
    baseUrl = 'https://smart2gotest.ntgeg.com/mob_dev/rest/';
    log(LogType.DEBUG, "Server URL ===== $serverUrl $port");
  }
}
