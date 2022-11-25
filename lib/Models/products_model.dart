import 'package:flutter/cupertino.dart';
import 'package:store_app/Models/categories_model.dart';

class product extends ChangeNotifier {
  int? id;
  String? title;
  int? price;
  String? description;
  category? Category;
  List<String>? images;
  int? categoryId;

  product(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.Category,
      this.images,
      this.categoryId});

  product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    Category = json['category'] != null
        ? new category.fromJson(json['category'])
        : null;
    images = json['images'].cast<String>();
    categoryId = json['categoryId'];
  }
  static List<product> ProductsFromSnapshot(List productSnapshot) {
    return productSnapshot
        .map((singleProduct) => product.fromJson(singleProduct))
        .toList();
  }
}
