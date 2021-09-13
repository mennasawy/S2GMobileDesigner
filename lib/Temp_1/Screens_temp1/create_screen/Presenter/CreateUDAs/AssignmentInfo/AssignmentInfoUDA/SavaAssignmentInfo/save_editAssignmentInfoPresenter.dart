// import 'package:templets/Models/CreateUDAs/AssignmentInfo/editAssignmentInfo.dart';
// import 'package:templets/Models/CreateUDAs/AssignmentInfo/saveAssignmentInfoBody.dart';
// import 'package:templets/Models/CreateUDAs/AssignmentInfo/save_editAssaigmentInfoResponse.dart';
// import 'package:templets/Models/ErrorResponse/error_data.dart';
// import 'package:templets/dependency_injection.dart';
// import 'package:templets/UI/CreateUDAs/AssignmentInfoUDA/AssignmentInfoUDAViewInterface/ISavaEditAssignmentInfoView.dart';
// import 'package:templets/UI/CreateUDAs/AssignmentInfoUDA/AssignmentInfoUDAViewInterface/IEditAssignmentInfoView.dart';
// import 'package:flutter/material.dart';
// import 'ISaveEditAssignmentInfoPresenter.dart';

// class SaveAssignmentInfoPresenter implements ISaveEditAssignmentInfoPresenter {
//   ISaveAssignmentInfoView saveAssignmentInfoView;
//   IEditAssignmentInfoView editAssignmentInfoView;
//   IAssignmentInfoSaveEditRepository iAssignmentInfoSaveRepository;

//   SaveAssignmentInfoPresenter(
//       this.saveAssignmentInfoView, this.editAssignmentInfoView) {
//     iAssignmentInfoSaveRepository = new Injector().saveAssignmentInfoRepository;
//   }

//   void saveData(
//       BuildContext context, AssignmentInfoSaveBody assignmentInfoSaveBody) {
//     iAssignmentInfoSaveRepository
//         .saveAssignmentInfo(context, assignmentInfoSaveBody)
//         .then((c) => saveAssignmentInfoView.onSaveAssignmentInfoComplete(c))
//         .catchError((onError) => saveAssignmentInfoView
//             .onSaveAssignmentInfoError(onError is FlutterError
//                 ? ErrorResponse(message: onError.message)
//                 : onError is AssertionError
//                     ? ErrorResponse(message: onError.message)
//                     : onError));
//   }

//   void editData(
//       BuildContext context, AssignmentInfoEditBody assignmentInfoEditBody) {
//     iAssignmentInfoSaveRepository
//         .editAssignmentInfo(context, assignmentInfoEditBody)
//         .then((c) => editAssignmentInfoView.onEditAssignmentInfoComplete(c))
//         .catchError((onError) => editAssignmentInfoView
//             .onEditAssignmentInfoError(onError is FlutterError
//                 ? ErrorResponse(message: onError.message)
//                 : onError is AssertionError
//                     ? ErrorResponse(message: onError.message)
//                     : onError));
//   }

//   @override
//   void saveEditAssignmentInfo(
//       BuildContext context, AssignmentInfoSaveBody assignmentInfoSaveBody) {
//     saveData(context, assignmentInfoSaveBody);
//   }

//   @override
//   void editAssignmentInfo(
//       BuildContext context, AssignmentInfoEditBody assignmentInfoEditBody) {
//     editData(context, assignmentInfoEditBody);
//   }
// }
