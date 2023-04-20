// ignore_for_file: unnecessary_type_check

import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/models/products_model.dart';
import 'package:store_api_flutter_course/services/api_handler.dart';

class ProductProvider with ChangeNotifier{
  List<ProductsModel> _products = [];

  List<ProductsModel> get products => _products;

  Future<List<ProductsModel>> getProducts() async{
    var prod = await ApiHandler.getAllProducts();
    if (prod is List<ProductsModel>) {
      _products = prod;
    }
    notifyListeners();
    return _products;
  }
}