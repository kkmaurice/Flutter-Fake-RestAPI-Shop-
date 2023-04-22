// ignore_for_file: unnecessary_type_check, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/models/products_model.dart';
import 'package:store_api_flutter_course/services/api_handler.dart';

class ProductProvider with ChangeNotifier {
  List<ProductsModel> _products = [];

  List<ProductsModel> get products => _products;

  List<ProductsModel> _searchList = [];
  List<ProductsModel> get searchList => _searchList;
  // ProductsModel? get productModel => _productModel;

  Future<List<ProductsModel>> getProducts() async {
    var prod = await ApiHandler.getAllProducts();
    if (prod is List<ProductsModel>) {
      _products = prod;
    }
    notifyListeners();
    return _products;
  }

  // get product by id
  ProductsModel getProductById(int id) {
    return _products.firstWhere((element) => element.id == id);
  }

  // get product by category
  // List<ProductsModel> getProductByCategory(String category) {
  //   return _products.where((element) => element.category == category).toList();
  // }

  //search product
  List<ProductsModel> searchProduct(String query) {
    _searchList = _products.where((element) => element.title!.toLowerCase().contains(query.toLowerCase())).toList();
    notifyListeners();
    return _searchList;
  }
}
