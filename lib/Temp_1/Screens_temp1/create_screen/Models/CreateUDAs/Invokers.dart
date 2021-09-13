import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';

abstract class InvokersRepository {
  Future<GenericObject> getGenericObjectOnDBInvoker(
      context, genericObject, udaID);

  Future<GenericObject> getGenericObjectOnSOAPInvoker(
      context, genericObject, udaID);

  Future<GenericObject> getGenericObjectOnRuleInvoker(
      context, genericObject, udaID);
}

abstract class ReportRepository {}
