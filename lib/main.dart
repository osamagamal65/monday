import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:monday/graph_ql_provider.dart';
import 'package:monday/widgets/client-provider.dart';

import 'models/board.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ClientProvider(
      uri: 'https://api.monday.com/v2',
      child: MaterialApp(
        title: 'Monday',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Query(
          options: QueryOptions(
            document: mondayBoards,
            variables: {
              'nRepositories': 50,
            },
            pollInterval: 10,
          ),
          builder: (QueryResult result,
              {VoidCallback refetch, FetchMore fetchMore}) {
            if (result.errors != null) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: result.errors
                        .map((error) => Text(error.message))
                        .toList(),
                  ),
                ),
              );
            } else if (result.loading) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text('Loading'),
                ),
              );
            }
            List<Board> boards = result.data['boards']
                .map<Board>((board) => Board.fromLazyCacheMap(board))
                .toList();
            print(boards);
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: Center(
                  child: Column(
                children: boards
                    .map<Widget>((Board value) => Text(value.name))
                    .toList(),
              )),
            );
          },
        ));
  }
}
