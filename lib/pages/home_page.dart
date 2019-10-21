import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:monday/graph_ql_provider.dart';
import 'package:monday/models/board.dart';
import 'package:monday/models/group.dart';
import 'package:monday/widgets/board-widget.dart';
import 'package:monday/widgets/board_query_widget.dart';
import 'package:monday/widgets/daynamic_baord.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    super.initState();
  }

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Builder(
              builder: (context) {
                switch (currentPage) {
                  case 0:
                    return BoardQueryWidget(boardId: '353719226');
                  case 1:
                    return BoardQueryWidget(boardId: '354704297');
                  case 2:
                    return BoardQueryWidget(boardId: '354716150');
                  case 3:
                    return DynamicBoard();
                }
              },
            ),
          ),
          bottomNavigationBar: FancyBottomNavigation(
            circleColor: Color(0xff07a3b2),
            activeIconColor: Colors.white,
            textColor: Color(0xff07a3b2),
            inactiveIconColor: Color(0xff07a3b2),
            tabs: [
              TabData(iconData: Icons.list, title: "Team Tasks"),
              TabData(iconData: Icons.calendar_today, title: "Feature Backlog"),
              TabData(iconData: Icons.book, title: "Programming language"),
              TabData(iconData: Icons.open_in_new, title: 'Dynamic')
            ],
            onTabChangedListener: (position) {
              setState(() {
                currentPage = position;
              });
            },
          )),
    );
  }
}
