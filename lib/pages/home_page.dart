import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:monday/graph_ql_provider.dart';
import 'package:monday/models/board.dart';
import 'package:monday/models/group.dart';
import 'package:monday/widgets/board-widget.dart';

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
                    return _buildBoard('353719226');
                  case 1:
                    return _buildBoard('354704297');
                  case 2:
                    return _buildBoard('354716150');
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
              TabData(iconData: Icons.book, title: "Programming language")
            ],
            onTabChangedListener: (position) {
              setState(() {
                currentPage = position;
              });
            },
          )),
    );
  }

  Widget _buildLoadingScaffold() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: Center(
        child: Text('Loading'),
      ),
    );
  }

  Widget _buildErrorScaffold(List<GraphQLError> errors) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: errors.map((error) => Text(error.message)).toList(),
        ),
      ),
    );
  }

  Widget _buildBoard(String boardId) {
    return Query(
      options: QueryOptions(
        document: QueryHelper.mondayBoards(boardId),
        // variables: {
        //   'nRepositories': 50,
        // },
        pollInterval: 10,
      ),
      builder: (QueryResult result,
          {VoidCallback refetch, FetchMore fetchMore}) {
        if (result.errors != null) {
          return _buildErrorScaffold(result.errors);
        } else if (result.loading) {
          return _buildLoadingScaffold();
        }
        Board board = Board.fromLazyCacheMap(result.data['boards'][0]);
        print(board);
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Center(
              child: SingleChildScrollView(
            child: BoardWidget(
              board: board,
            ),
          )),
        );
      },
    );
  }
}
