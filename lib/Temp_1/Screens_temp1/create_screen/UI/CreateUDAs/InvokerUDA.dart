import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/InvokersPresenter.dart';
import 'package:templets/Utilities/api_constant.dart';
import 'package:templets/Utilities/WidgetsUtilites/RaisedButton.dart';
import 'package:templets/Utilities/const.dart';
import 'package:flutter/material.dart';
import 'package:templets/Utilities/utility_methods.dart';

enum InvokerType {
  DBInvoker,
  SOAPInvoker,
  RuleInvoker,
}

class InvokerUDA extends StatefulWidget {
  final String title;
  final InvokerType type;
  final UDAsWithValues uda;
  final List<UDAsWithValues> udasList;
  final GenericObject genericObject;
  final Function(List<UDAsWithValues>) onValueChange;
  final String labelColor;

  final bool isVisible;
  final bool isReadOnly;

  InvokerUDA(
      {Key key,
      this.title,
      this.type,
      this.uda,
      this.labelColor,
      this.genericObject,
      this.udasList,
      this.onValueChange,
      this.isVisible,
      this.isReadOnly})
      : super(key: key);

  @override
  _InvokerUDAState createState() => _InvokerUDAState();
}

class _InvokerUDAState extends State<InvokerUDA>
    implements InvokersViewContract {
  InvokersUDAsPresenter invokerPresenter;
  bool loadingGenericObject = false;
  Color buttonColor;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return drawWidgetOrEmptyContainer(
        widget.isVisible, getInvokerButtonWidget());
  }

  BlueRaisedButtonWidget getInvokerButtonWidget() {
    return BlueRaisedButtonWidget(
      hinttext: widget.title ?? "",
      onpressed: widget.isReadOnly || loadingGenericObject
          ? null
          : () {
              postOnInvokerAction();
            },
      color: widget.labelColor,
    );
  }

  postOnInvokerAction() {
    widget.genericObject.udasValues = widget.udasList;
    invokerPresenter = InvokersUDAsPresenter(
        context: context,
        invokerView: this,
        genericObject: widget.genericObject);

    if (widget.type == InvokerType.DBInvoker)
      invokerPresenter.postDBInvokerAction(widget.uda.recId);
    else if (widget.type == InvokerType.SOAPInvoker)
      invokerPresenter.postSOAPInvokerAction(widget.uda.recId);
    else if (widget.type == InvokerType.RuleInvoker)
      invokerPresenter.postRuleInvokerAction(widget.uda.recId);

    setState(() {
      loadingGenericObject = true;
    });
  }

  @override
  void updateUDAsList(GenericObject genericObject) {
    // TODO: implement updateUDAsList

    setState(() {
      widget.onValueChange(genericObject.udasValues);
      loadingGenericObject = false;
    });
  }

  @override
  void onInvokerActionFailure(error) {
    // TODO: implement onInvokerActionFailure
    log(LogType.ERROR, "Invoker Action Error ===== ${error.toString()}");
    setState(() {
      loadingGenericObject = false;
    });
    if (error.code == CODE_EXPIRED_TOKEN)
      ShowExpiredTokenAlert(error.message, context);
  }
}
