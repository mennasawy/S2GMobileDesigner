import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Invokers.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/dependency_injection.dart';
import 'package:flutter/material.dart';

abstract class InvokersContract {
  void onDBLoadGenericObjectComplete(GenericObject genericObject);
  void onDBLoadGenericObjectError(error);

  void onSOAPLoadGenericObjectComplete(GenericObject genericObject);
  void onSOAPLoadGenericObjectError(error);

  void onRuleLoadGenericObjectComplete(GenericObject genericObject);
  void onRuleLoadGenericObjectError(error);
}

abstract class InvokersViewContract {
  void updateUDAsList(GenericObject genericObject);
  void onInvokerActionFailure(error);
}

class InvokersUDAsPresenter implements InvokersContract {
  InvokersRepository _invokerUDARepository;
  InvokersViewContract invokerView;
  GenericObject genericObject;
  BuildContext context;

  InvokersUDAsPresenter({this.context, this.invokerView, this.genericObject}) {
    _invokerUDARepository = new Injector().invokerUDARepo;
  }

  void postDBInvokerAction(udaID) {
    _invokerUDARepository
        .getGenericObjectOnDBInvoker(context, genericObject, udaID)
        .then((c) => this.onDBLoadGenericObjectComplete(c))
        .catchError((onError) => this.onDBLoadGenericObjectError(onError));
  }

  void postSOAPInvokerAction(udaID) {
    _invokerUDARepository
        .getGenericObjectOnSOAPInvoker(context, genericObject, udaID)
        .then((c) => this.onSOAPLoadGenericObjectComplete(c))
        .catchError((onError) => this.onSOAPLoadGenericObjectError(onError));
  }

  void postRuleInvokerAction(udaID) {
    _invokerUDARepository
        .getGenericObjectOnRuleInvoker(context, genericObject, udaID)
        .then((c) => this.onRuleLoadGenericObjectComplete(c))
        .catchError((onError) => this.onRuleLoadGenericObjectError(onError));
  }

  @override
  void onDBLoadGenericObjectComplete(GenericObject genericObject) {
    // TODO: implement onDBLoadGenericObjectComplete
    invokerView.updateUDAsList(genericObject);
  }

  @override
  void onDBLoadGenericObjectError(error) {
    // TODO: implement onDBLoadGenericObjectError
    invokerView.onInvokerActionFailure(error);
  }

  @override
  void onRuleLoadGenericObjectComplete(GenericObject genericObject) {
    // TODO: implement onRuleLoadGenericObjectComplete
    invokerView.updateUDAsList(genericObject);
  }

  @override
  void onRuleLoadGenericObjectError(error) {
    // TODO: implement onRuleLoadGenericObjectError
    invokerView.onInvokerActionFailure(error);
  }

  @override
  void onSOAPLoadGenericObjectComplete(GenericObject genericObject) {
    // TODO: implement onSOAPLoadGenericObjectComplete
    invokerView.updateUDAsList(genericObject);
  }

  @override
  void onSOAPLoadGenericObjectError(error) {
    // TODO: implement onSOAPLoadGenericObjectError
    invokerView.onInvokerActionFailure(error);
  }
}
