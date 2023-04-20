import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_api_flutter_course/models/categories_model.dart';
import 'package:store_api_flutter_course/models/products_model.dart';

class ApiHandler {
  static const String _baseUrl = 'https://api.escuelajs.co/api/v1/products';
  static const String _baseUrlCategories =
      'https://api.escuelajs.co/api/v1/categories';

  static Future<List<ProductsModel>> getAllProducts() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> products = json.decode(response.body);
      return products.map((prod) => ProductsModel.fromJson(prod)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  //get categories
  static Future<List<Category>> getAllCategories() async {
    final response = await http.get(Uri.parse(_baseUrlCategories));
    if (response.statusCode == 200) {
      final List<dynamic> categories = json.decode(response.body);
      return categories.map((cat) => Category.fromJson(cat)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
