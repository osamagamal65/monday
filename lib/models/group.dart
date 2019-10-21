class Group {
  final String id;
  final String color;
  final String name;
  Group({this.id, this.name, this.color});
  static Group fromLazyCacheMap(dynamic map) {
    print(map['color']);
    return map != null
        ? Group(name: map['title'], id: map['id'], color: map['color'])
        : null;
  }
}
