import 'package:monday/models/group.dart';
import 'package:monday/models/item.dart';
import 'package:monday/models/tag.dart';
import 'package:monday/models/update.dart';
import 'package:monday/models/user.dart';

class Board {
  final String name;
  final String id;
  final String status;
  final dynamic boardFolderId;
  final List<Item> items;
  final List<Tag> tags;
  final List<Update> updates;
  final List<Group> groups;
  final User owner;
  Board(
      {this.name,
      this.status,
      this.boardFolderId,
      this.items,
      this.owner,
      this.id,
      this.groups,
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
            ? map['tags'].map<Tag>((tag) => Tag.fromLazyCacheMap(tag)).toList()
            : [],
        groups: map['groups'] != null
            ? map['groups']
                .map<Group>((group) => Group.fromLazyCacheMap(group))
                .toList()
            : [],
        updates: map['updates'] != null
            ? map['updates']
                .map<Update>((update) => Update.fromLazyCacheMap(update))
                .toList()
            : [],
        items: map['items'] != null
            ? map['items']
                .map<Item>((item) => Item.fromLazyCacheMap(item))
                .toList()
            : []);
  }
}
