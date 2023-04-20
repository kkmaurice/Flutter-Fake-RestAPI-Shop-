// ignore_for_file: unnecessary_type_check

import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/models/categories_model.dart';

import '../services/api_handler.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> _categories = [];

  List<Category> get categories => _categories;

  Future<List<Category>> getCategories() async {
    var cat = await ApiHandler.getAllCategories();
    if (cat is List<Category>) {
      _categories = cat;
    }
    notifyListeners();
    return _categories;
  }
}
