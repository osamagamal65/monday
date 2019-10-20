import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:monday/models/team.dart';

class User {
  final int id;
  final String email;
  final String name;
  final String title;
  final String url;
  final String photoOriginal;
  final String photoThumb;
  final String phone;
  final String mobilePhone;
  final List<Team> teams;
  User(
      {this.id,
      this.email,
      this.mobilePhone,
      this.name,
      this.title,
      this.url,
      this.phone,
      this.photoOriginal,
      this.teams,
      this.photoThumb});

  static User formLazyCacheMap(LazyCacheMap map) {
    return map != null
        ? User(
            id: map['id'],
            title: map['title'],
            email: map['email'],
            mobilePhone: map['mobile_phone'],
            name: map['name'],
            phone: map['phone'],
            url: map['url'],
            photoOriginal: map['photo_original'],
            photoThumb: map['photo_thumb'])
        : null;
  }
}
