import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBarTemplate1/NTGAppBar.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class MonitorNew extends StatefulWidget {
  _Monitor createState() {
    return _Monitor();
  }
} //end of class Monitor

class _Monitor extends State<MonitorNew> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //check whether it loads privllage for monitor first then load monitor data or filtered data
    return new SafeArea(
        child: Scaffold(
            backgroundColor: WHITE,
            appBar: NTGAppBar(
              appBarType: AppBarType.appBarWithBack,
              appBarActions: appBarActions(),
              pageName: "monitor",
            ),
            body: buildBodyData(context)));
  }

  /////// app bar widget methods
  Row appBarActions() {
    return Row(
      children: <Widget>[searchIcon(), SizedBox(width: 10), addIcon(context)],
    );
  }

  Widget addIcon(context) {
    return GestureDetector(
        child: Image.asset(
      BTN_ADD,
      fit: BoxFit.cover,
      width: MediaQuery.of(context).size.width * 0.08,
    ));
  }

  Widget searchIcon() {
    return GestureDetector(
        child: Image.asset(IC_FILTER,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width * 0.08));
  }

  //////widget build methods ////////////
  Widget buildBodyData(context) {
    return Center(
        child:
            Column(children: [searchBar(context), monitorLoadedBody(context)]));
  }

  Widget monitorLoadedBody(context) {
    return drawMonitorRecordsListWidget(context);
  }

  Widget drawMonitorRecordsListWidget(context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Stack(
        children: [
          ListView.builder(
            itemBuilder: (context, position) =>
                moniorRecordCradWidget(context, position),
            itemCount: 1,
          ),
        ],
      ),
    ));
  }

  Widget moniorRecordCradWidget(BuildContext context, int position) {
    return Container(
      width: getScreenWidth(context) * 0.85,
      height: getScreenHeight(context) * 0.25,
      child: GestureDetector(
          child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: WHITE),
        ),
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                    child: buildUDAValueRow(context, position, 0), flex: 9),
                Expanded(
                  child: dropDownButtonsColumn(["log"], 'dropDown', position),
                  flex: 0,
                )
              ],
            ),
            buildUDAValueRow(context, position, 1),
//                buildUDAValueRow(context, position, 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: buildUDAValueRow(context, position, 2),
                  flex: 2,
                ),
                Expanded(child: buildbuttonsRow(context, position), flex: 2)
              ],
            )
          ],
        ),
      )),
    );
  }

  Widget dropDownButtonsColumn(List<String> list, String hint, int position) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 0),
      child: Container(
          height: 40,
          width: 33,
          child: Theme(
              data: Theme.of(context)
                  .copyWith(buttonTheme: ButtonTheme.of(context).copyWith()),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  isExpanded: true,
                  icon: Icon(Icons.more_vert),
                  iconSize: 30,
                  iconEnabledColor: GREY,
                  onChanged: (String newValue) {
                    setState(() {});
                  },
                  items: <String>["log"]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: GestureDetector(child: Text(value)),
                    );
                  }).toList(),
                ),
              ))),
    );
  }

  Widget buildbuttonsRow(BuildContext context, int position) {
    return Row(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
      BuildMonitorIcons(
        iconName: IC_DUPLICATE_FIELD,
      ),
      BuildMonitorIcons(
        iconName: IC_DELETE,
      ),
      BuildMonitorIcons(
        iconName: IC_EDIT_GRID,
      ),
    ]);
  }

  Widget BuildMonitorIcons({String iconName, Function onIconPressed}) {
    return Align(
      child: IconButton(
        iconSize: (iconName == IC_DELETE) ? 23 : 30,
        alignment: Alignment.bottomCenter,
        icon: Image.asset(
          iconName,
          width: (iconName == IC_EDIT_GRID) ? 18 : 22,
          height: 18,
          fit: BoxFit.fill,
        ),
        onPressed: onIconPressed,
      ),
    );
  }

  Widget buildUDAValueRow(BuildContext context, int position, int index) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
        child: Text(
          "age : 10",
          style: normalTextStyle,
          overflow: TextOverflow.ellipsis,
        ));
  }

  Widget whenNoDataRetrieved(context, String monitorListStatusMessage) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 120, 10, 0),
      child: Text(
        monitorListStatusMessage,
        style: normalBoldedTextStyle,
      ),
    );
  }

  Widget searchBar(context) {
    return Container(
//      height: getScreenHeight(context) * 0.13,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: SIZED_BOX_SMALL_HEIGHT,
          ),
          searchWithSelectedItems(),
          Container(
            padding: EdgeInsets.only(top: 5),
            width: getScreenWidth(context) * 0.95,
            height: getScreenHeight(context) * 0.15,
            decoration: BoxDecoration(
              border: Border(
                left: drawContainerBorder(),
                right: drawContainerBorder(),
                bottom: drawContainerBorder(),
              ),
            ),
            child: buildSearchList(),
          )
        ],
      ),
    );
  }

  Widget drawSearchWidgetInEditMode() {
    return Container(
      child: TextField(
        key: formKey,
        maxLines: 1,
        decoration: InputDecoration(
          filled: true,
          fillColor: LITE_BLUE,
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
          ),
          prefixIcon: Icon(Icons.search),
          focusedBorder: outlineInputBorder(),
          enabledBorder: outlineInputBorder(),
        ),
      ),
    );
  }

  Widget buildSearchList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Container(
            padding: EdgeInsets.all(4),
            width: getScreenWidth(context) - 35,
            child: Row(
              children: <Widget>[
                Text(
                  'uda :',
                  style: normalLightBlueTextStyle,
                ),
                Text(
                  "value",
                  style: normalTextStyle,
                ),
              ],
            ),
          ),
//                          )
        );
      },
    );
  }

  Widget searchWithSelectedItems() {
    return SingleChildScrollView(
        child: Container(
      decoration: drawSearchContainerBorder(LITE_BLUE),
      child:
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            color: Main_Blue,
          ),
        ),
        SingleChildScrollView(
          child: searchItemCard(),
        )
      ]),
    ));
  }

  Widget searchItemCard() {
    return Container(
      height: 35,
      width: 125,
      padding: const EdgeInsets.all(5),
      decoration: drawSearchContainerBorder(Colors.grey[100]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                "value",
                style: normalTextStyle,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(child: Icon(Icons.clear)),
          ),
        ],
      ),
    );
  }

  BoxDecoration drawSearchContainerBorder(Color color) {
    return BoxDecoration(
        color: color,
        border: Border.fromBorderSide(BorderSide(
          color: LITE_BLUE_ACCENT,
        )),
        borderRadius: BorderRadius.circular(8));
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: LITE_BLUE_ACCENT,
        width: TEXTFIELD_SEARCH_BORDER_RADUIS_WIDTH,
      ),
      borderRadius: BorderRadius.circular(15),
    );
  }

  BorderSide drawContainerBorder() {
    return BorderSide(
      color: Colors.grey[300],
      width: 2,
    );
  }
}
