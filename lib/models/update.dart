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
}

class Replay {
  final int id;
  Replay({this.id});
}
