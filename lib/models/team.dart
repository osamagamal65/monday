import 'package:monday/models/user.dart';

class Team {
  final int id;
  final String name;
  final String pictureUrl;
  final List<User> users;
  Team({this.id, this.name, this.pictureUrl, this.users});
  static Team fromLLazyCacheMap(dynamic map) {
    return Team(
        id: map['id'],
        name: map['name'],
        pictureUrl: map['picture_url'],
        users:
            map['users'].map((user) => User.formLazyCacheMap(user)).toList());
  }
}
