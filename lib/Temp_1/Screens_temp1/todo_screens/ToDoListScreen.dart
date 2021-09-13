import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskToDoScreen extends StatefulWidget {
  static const routeName = '/TaskToDoScreen1';
  @override
  _TaskToDoScreenState createState() => _TaskToDoScreenState();
}

class _TaskToDoScreenState extends State<TaskToDoScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: todoAppbar(),
        body: Column(
          children: <Widget>[
            getSearchAndPanelsWidget(context),
            Expanded(
              flex: 1,
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: <Widget>[
                  tasksTabsList(context),
                  tasksTabsList(context),
                  tasksTabsList(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  todoAppbar() {
    return AppBar(
      title: Text(
        'Tasks',
        style: TextStyle(
            fontFamily: 'Tahoma',
            color: BLACK,
            fontSize: 20,
            fontWeight: FontWeight.w700),
      ),
      backgroundColor: WHITE,
      elevation: 0,
      actions: TodoAppbarButtonsActions(),
    );
  }

  List<Widget> TodoAppbarButtonsActions() {
    return [
      IconButton(
          icon: Image.asset(IC_ADD_TASK), color: Main_Green, onPressed: () {}),
      Padding(
        padding: EdgeInsets.all(19),
        child: Image.asset(
          IC_MENU,
          fit: BoxFit.cover,
        ),
      ),
    ];
  }

  getSearchAndPanelsWidget(context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 52),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Container(height: 135, child: panelCardsWidget(context)),
              ),
              TabBar(
                labelStyle: todoTabsTextStyle,
//                unselectedLabelColor: ThemeManager.themeColor(
//                    ThemeSection.todo, ThemeProperty.tabsFontColor),
                labelColor: BLACK,
                controller: _tabController,
//                indicatorColor: ThemeManager.themeColor(ThemeSection.todo,
//                    ThemeProperty.selectedTabBackgroundColor),
                indicatorPadding: EdgeInsets.only(left: 20, right: 20),
                tabs: [
                  Tab(text: 'My Tasks'),
                  Tab(
                    text: 'Delegated',
                  ),
                  Tab(
                    text: 'My Team',
                  )
                ],
              ),
            ],
          ),
        ),
        getSearchWidget()
      ],
    );
  }

  getSearchWidget() {
    return Container(
      height: 50,
      padding: EdgeInsets.only(left: 5, right: 5),
      width: getScreenWidth(context),
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: LITE_BLUE,
          prefixIcon: IconButton(
            onPressed: () => {},
            icon: Icon(Icons.search),
          ),
          focusedBorder: outlineInputBorder(),
          enabledBorder: outlineInputBorder(),
        ),
      ),
    );
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

  Padding panelCardsWidget(context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            buildPanelCards(),
            AddPanalCardChildreenWidget(context)
          ],
        ));
  }

  buildPanelCards() {
    return Container(
      width: 135,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          color: BLUE,
          border: Border.all(color: LITE_GREY, width: 2),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin:
                    EdgeInsets.only(left: getScreenWidth(context) * 0.25 - 20),
                height: 25,
                child: IconButton(
                    onPressed: () {},
                    alignment: Alignment.topRight,
                    icon: Icon(
                      Icons.clear,
                      size: 17,
                      color: WHITE,
                    )),
                alignment: Alignment.topRight,
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text('In Process \n        2 \n     Tasks',
                      style: TextStyle(
                          fontFamily: 'Tahoma',
                          color: BLACK,
                          fontWeight: FontWeight.w700,
                          fontSize: getScreenWidth(context) *
                              0.042)) //normalWhiteBoldedTextStyle,
                  ),
            ]),
      ),
    );
  }

  AddPanalCardChildreenWidget(context) {
    return Container(
        width: 135,
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
            color: Light_Blue,
            border: Border.all(color: LITE_GREY, width: 2),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                IconButton(
                  icon: Image.asset(BTN_ADD),
                  onPressed: () {},
                ),
                Text('New Panel',
                    style: TextStyle(
                        fontFamily: 'Tahoma',
                        color: Blue_Koi,
                        fontWeight: FontWeight.w700,
                        fontSize: getScreenWidth(context) * 0.042)),
              ],
            )));
  }

  Widget tasksTabsList(context) {
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 30, left: 5, right: 5),
          height: 200,
          margin: EdgeInsets.only(bottom: 7),
          width: getScreenWidth(context),
          child: GestureDetector(
            onTap: () {},
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Light_Grey, width: 0),
                ),
                child: tasksBodyListWidget()),
          ),
        )
      ],
    );
  }

  tasksBodyListWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
//              color: ThemeManager.themeColor(
//                  ThemeSection.todo, ThemeProperty.cardBackgroundColor),
            width: getScreenWidth(context) * 0.82,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          'Task Name',
                          style: TextStyle(
                              fontFamily: 'Tahoma',
                              color: BLACK,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.people,
                            size: 20,
                            color: Main_Green,
                          ),
                          onPressed: () {})
                    ],
                  ),
                  flex: 1,
                ),
                SizedBox(
                  height: 3,
                ),
                Expanded(
                  child: Text(
                    'Task Description   ',
                    style: normalTextStyle,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  flex: 2,
                ),
                SizedBox(
                  height: 6,
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 185,
                        height: 17,
                        decoration: BoxDecoration(
                            border: Border.all(color: GREY, width: 1),
                            borderRadius: BorderRadius.circular(20)),
                        child: LinearProgressIndicator(
                          backgroundColor: LITE_GREY,
                          valueColor: AlwaysStoppedAnimation<Color>(RED),
                          value: 1,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text('1-1-2020'),
                        ),
                      ),
                    ],
                  ),
                  flex: 1,
                ),
                Text('Over Due , +99  Days late ')
              ],
            )),
        Container(
          width: getScreenWidth(context) * 0.093,
          decoration: BoxDecoration(
              color: Light_Blue,
              border: Border.all(color: GREY, width: 0),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          child: Center(
              child: IconButton(
            icon: Image.asset(IC_TODO_UNCHECKED),
            onPressed: () {},
          )),
        ),
      ],
    );
  }
}
