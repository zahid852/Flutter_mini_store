import 'package:flutter/cupertino.dart';

class users extends ChangeNotifier {
  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;

  users(
      {this.id, this.email, this.password, this.name, this.role, this.avatar});

  users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    role = json['role'];
    avatar = json['avatar'];
  }

  static List<users> usersFromSnapshot(List userSnapshot) {
    return userSnapshot
        .map((singleUser) => users.fromJson(singleUser))
        .toList();
  }
}
