import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Help.dart';
import 'package:templets/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

abstract class HelpUDAContract {
  void onLoadHelpTasksComplete(List<HelpUda> items);
  void onLoadHelpTasksError();
}

abstract class HelpUDAViewContract {
  void setHelpUDAText(String message);
}

class HelpPresenter implements HelpUDAContract {
  final int helpUDAID;
  final BuildContext context;
  HelpUDAViewContract helpUDAView;
  HelpRepository helpTasksRepository;

  HelpPresenter({this.helpUDAID, this.context, this.helpUDAView}) {
    helpTasksRepository = new Injector().helpRepository;
  }

  void loadHelp() {
    helpTasksRepository
        .getHelpTsk(context, helpUDAID)
        .then((c) => this.onLoadHelpTasksComplete(c))
        .catchError((onError) => this.onLoadHelpTasksError());
  }

  @override
  void onLoadHelpTasksComplete(List<HelpUda> items) {
    // TODO: implement onLoadHelpTasksComplete
    String messageee = items[0].en ?? items[0].ar;
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String decoded = stringToBase64.decode(messageee);
    // String messages = _parseHtmlString(decoded).replaceAll(RegExp('"'), '');
    // helpUDAView.setHelpUDAText(messages);
  }

  @override
  void onLoadHelpTasksError() {
    // TODO: implement onLoadHelpTasksError
  }

  // String _parseHtmlString(String htmlString) {
  //   var document = parse(htmlString);
  //   String parsedString = parse(document.body.text).documentElement.text;
  //   return parsedString;
  // }
}
