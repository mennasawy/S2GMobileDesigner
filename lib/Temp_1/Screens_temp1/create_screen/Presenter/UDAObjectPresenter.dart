// import 'package:templets/Models/CreateUDAs/MultipleLevel/MultipleLevelModel.dart';
// import 'package:templets/Models/UDAsWithValues.dart';
// import 'package:templets/dependency_injection.dart';

// abstract class UDAObjectViewContract {
//   void updateUDAWithRepoData(MultipleLevelModel uda);
// }

// abstract class UDAObjectContract {
//   void onLoadUDAObjectComplete(UDAsWithValues uda);
//   void onLoadUDAObjectError(error);
// }

// class UDAObjectPresenter implements UDAObjectContract {
//   UDAObjectViewContract view;
//   UDAsRepository _udasRepository;
//   final context;

//   UDAObjectPresenter(this.context, this.view){
//     _udasRepository = new Injector().udasToRepository;
//   }

//   void loadUDAObject(int udaID) {
//     _udasRepository.getUDAObject(context, udaID)
//         .then((uda) => this.onLoadUDAObjectComplete(uda))
//         .catchError((onError) => this.onLoadUDAObjectError(onError));
//   }

//   @override
//   void onLoadUDAObjectComplete(UDAsWithValues uda) {
//     // TODO: implement onLoadUDAObjectComplete
//     view.updateUDAWithRepoData(uda.multipleLevelRepository);
//   }

//   @override
//   void onLoadUDAObjectError(error) {
//     // TODO: implement onLoadUDAObjectError
//   }
// }
