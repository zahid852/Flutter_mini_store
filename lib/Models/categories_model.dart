import 'package:flutter/cupertino.dart';

class category extends ChangeNotifier {
  int? id;
  String? name;
  String? image;

  category({this.id, this.name, this.image});

  category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
  static List<category> CategoryFromSnapshot(List categorySnapshot) {
    return categorySnapshot
        .map((singleCategory) => category.fromJson(singleCategory))
        .toList();
  }
}
