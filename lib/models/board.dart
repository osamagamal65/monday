import 'package:monday/models/item.dart';
import 'package:monday/models/tag.dart';
import 'package:monday/models/update.dart';
import 'package:monday/models/user.dart';

class Board {
  final String name;
  final String id;
  final String status;
  final dynamic boardFolderId;
  final List<dynamic> items;
  final List<dynamic> tags;
  final List<dynamic> updates;
  final dynamic owner;
  Board(
      {this.name,
      this.status,
      this.boardFolderId,
      this.items,
      this.owner,
      this.id,
      this.tags,
      this.updates});
  static Board fromLazyCacheMap(dynamic map) {
    return Board(
        id: map['id'],
        name: map['name'],
        status: map['status'],
        boardFolderId: map['board_folder_id'],
        owner:
            map['owner'] != null ? User.formLazyCacheMap(map['owner']) : null,
        tags: map['tags'] != null
            ? map['tags'].map((tag) => Tag.fromLazyCacheMap(tag)).toList()
            : [],
        updates: map['updates'] != null
            ? map['updates']
                .map((update) => Update.fromLazyCacheMap(update))
                .toList()
            : [],
        items: map['items'] != null
            ? map['items'].map((item) => Item.fromLazyCacheMap(item)).toList()
            : []);
  }
}
