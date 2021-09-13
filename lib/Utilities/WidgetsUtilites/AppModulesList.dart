import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Utilities/app_constants.dart';

enum AppModule { ModulesName, ModuleTypes }

ScrollController _scrollController = ScrollController();

Widget buildAppModuleList() {
  List<String> menu = ["module name 1", "module name 2"];

  return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: menu.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 63.5,
              child: Container(
                color: index % 2 == 0 ? LITE_BLUE : WHITE,
                child: ListTile(
                  title: Text(menu[index], style: normalTextStyle),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ),
            );
          }));
}
