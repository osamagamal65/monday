import 'package:monday/models/user.dart';

class Team {
  final int id;
  final String name;
  final String pictureUrl;
  final List<User> users;
  Team({this.id, this.name, this.pictureUrl, this.users});
}
