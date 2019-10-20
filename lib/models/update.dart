import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:monday/models/user.dart';

class Update {
  final int id;
  final String body;
  final DateTime createdTime;
  final User creator;
  final List<Replay> replies;
  final String textBody;

  Update(
      {this.id,
      this.creator,
      this.body,
      this.createdTime,
      this.replies,
      this.textBody});
  static Update fromLazyCacheMap(dynamic map) {
    return Update(
        body: map['body'],
        id: map['id'],
        creator: User.formLazyCacheMap(map['creator']),
        replies: map['replies'] != null && map['replies'] is List
            ? map['replies'].map((replay) => Replay.fromLazyCacheMap(replay))
            : [],
        createdTime: DateTime(map['created_time']));
  }
}

class Replay {
  final int id;
  Replay({this.id});
  static Replay fromLazyCacheMap(dynamic map) {
    return Replay(id: map['id']);
  }
}
