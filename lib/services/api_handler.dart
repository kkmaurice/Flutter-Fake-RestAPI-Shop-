import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_api_flutter_course/models/products_model.dart';

class ApiHandler {
  static const String _baseUrl = 'https://api.escuelajs.co/api/v1/products';

  // static Future<void> getAllProducts() async {
  //   var response = await http.get(Uri.parse(_baseUrl));
  //   print("response: ${jsonDecode(response.body)[4]['description']}");
  // }

  static Future<List<ProductsModel>> getAllProducts() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> products = json.decode(response.body);
      return products.map((prod) => ProductsModel.fromJson(prod)).toList();
      
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
