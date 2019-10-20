import 'package:monday/models/board.dart';
import 'package:monday/models/group.dart';
import 'package:monday/models/tag.dart';
import 'package:monday/models/update.dart';
import 'package:monday/models/user.dart';

class Item {
  final String name;
  final String id;
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

  static Item fromLazyCacheMap(dynamic map) {
    return Item(
        id: map['id'],
        name: map['name'],
        board: Board.fromLazyCacheMap(map['board']),
        creator: User.formLazyCacheMap(map['creator']),
        group: Group.fromLazyCacheMap(map['group']),
        updates: map['updates'] != null
            ? map['updates']
                .map((update) => Update.fromLazyCacheMap(update))
                .toList()
            : [],
        tags: map['tags'] != null
            ? map['tags'].map((tag) => Tag.fromLazyCacheMap(tag)).toList()
            : []);
  }
}
