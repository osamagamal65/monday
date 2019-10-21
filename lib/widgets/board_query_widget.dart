import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:monday/models/board.dart';
import 'package:monday/widgets/board-widget.dart';

import '../graph_ql_provider.dart';

class BoardQueryWidget extends StatelessWidget {
  final String boardId;
  BoardQueryWidget({@required this.boardId});
  @override
  Widget build(BuildContext context) {
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
          return _buildErrorScaffold(context, result.errors);
        } else if (result.loading) {
          return _buildLoadingScaffold(context);
        }
        Board board = result.data != null &&
                result.data['boards'] != null &&
                result.data['boards'].isNotEmpty
            ? Board.fromLazyCacheMap(result.data['boards'][0])
            : null;
        print(board);
        return board != null
            ? Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Center(
                    child: SingleChildScrollView(
                  child: BoardWidget(
                    board: board,
                  ),
                )),
              )
            : _buildErrorScaffold(context, [
                GraphQLError(
                    message: 'No Boards avalibale, Please try another Id')
              ]);
      },
    );
  }

  Widget _buildLoadingScaffold(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: Center(
        child: Text('Loading'),
      ),
    );
  }

  Widget _buildErrorScaffold(BuildContext context, List<GraphQLError> errors) {
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
}
