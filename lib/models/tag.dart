class Tag {
  final int id;
  final String color;
  final String name;
  Tag({this.id, this.color, this.name});
  static Tag fromLazyCacheMap(dynamic map) {
    return Tag(id: map['id'], name: map['name'], color: map['color']);
  }
}
