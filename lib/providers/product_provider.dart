// ignore_for_file: unnecessary_type_check

import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/models/products_model.dart';
import 'package:store_api_flutter_course/services/api_handler.dart';

class ProductProvider with ChangeNotifier {
  List<ProductsModel> _products = [];

  List<ProductsModel> get products => _products;

  // ProductsModel? _productModel;
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

  // Future<ProductsModel> getProductById(int id) async {
  //   var prod = await ApiHandler.getProductById(id);
  //   if (prod is ProductsModel) {
  //     _productModel = prod;
  //   }
  //   notifyListeners();
  //   return _productModel!;
  // }
}
