import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_api_flutter_course/models/categories_model.dart';
import 'package:store_api_flutter_course/models/products_model.dart';
import 'package:store_api_flutter_course/models/users_model.dart';

class ApiHandler {
  static const String _baseUrl = 'https://api.escuelajs.co/api/v1/products';
  static const String _baseUrlCategories =
      'https://api.escuelajs.co/api/v1/categories?';
  static const String _baseUrlUsers = 'https://api.escuelajs.co/api/v1/users';

  static Future<List<ProductsModel>> getAllProducts() async {
    try{
      final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> products = json.decode(response.body);
      return products.map((prod) => ProductsModel.fromJson(prod)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
    }catch(e){  
      throw Exception('Failed to load posts $e');
    }
  }

  //get categories
  static Future<List<Category>> getAllCategories() async {
    try{
      final response = await http.get(Uri.parse(_baseUrlCategories));
    if (response.statusCode == 200) {
      final List<dynamic> categories = json.decode(response.body);
      return categories.map((cat) => Category.fromJson(cat)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
    }catch(e){
      throw Exception('Failed to load posts $e');
    }
  }

  // get user
  static Future<List<UserModel>> getAllUsers() async {
    try{
      final response = await http.get(Uri.parse(_baseUrlUsers));
    if (response.statusCode == 200) {
      final List<dynamic> users = json.decode(response.body);
      return users.map((user) => UserModel.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
    }catch(e){
      throw Exception('Failed to load posts $e');
    }
  }

  // get product by id
  static Future<ProductsModel> getProductById(int id) async {
    try{
      final response = await http.get(Uri.parse('$_baseUrl/$id'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> product = json.decode(response.body);
      return ProductsModel.fromJson(product);
    } else {
      throw Exception('Failed to load posts');
    }
    }catch(e){
      throw Exception("Failed to load posts $e");
  }
}
}