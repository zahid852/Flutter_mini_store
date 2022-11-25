import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/Models/categories_model.dart';
import 'package:store_app/Models/products_model.dart';
import 'package:store_app/Models/user_model.dart';
import 'package:store_app/consts/api_consts.dart';

class ApiHandler {
  static Future<List<dynamic>> getData(
      {required String target, String? limit}) async {
    try {
      final uri = Uri.https(BASE_URL, 'api/v1/$target',
          target == 'products' ? {'offset': '0', 'limit': limit} : {});
      final response = await http.get(uri);
      final data = jsonDecode(response.body);
      List tempList = [];
      if (response.statusCode != 200) {
        // print('message ${data['status']}');
        throw data['message'];
      }
      for (var v in data) {
        tempList.add(v);
      }
      return tempList;
    } catch (error) {
      log('An error occured ${error.toString()}');
      throw error.toString();
    }
  }

  static Future<List<product>> getAllProducts({required String limit}) async {
    List tempList = await getData(target: 'products', limit: limit);
    return product.ProductsFromSnapshot(tempList);
  }

  static Future<List<category>> getAllCategories() async {
    List tempList = await getData(target: 'categories');
    return category.CategoryFromSnapshot(tempList);
  }

  static Future<List<users>> getAllUsers() async {
    List tempList = await getData(target: 'users');
    return users.usersFromSnapshot(tempList);
  }
}
