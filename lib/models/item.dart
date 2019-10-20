import 'package:monday/models/board.dart';
import 'package:monday/models/group.dart';
import 'package:monday/models/tag.dart';
import 'package:monday/models/update.dart';
import 'package:monday/models/user.dart';

class Item {
  final String name;
  final int id;
  final List<Tag> tags;
  final List<Update> updates;
  final User creator;
  final Board board;
  final Group group;
  Item(
      {this.name,
      this.id,
      this.updates,
      this.tags,
      this.board,
      this.creator,
      this.group});
}
