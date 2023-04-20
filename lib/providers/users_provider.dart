// ignore_for_file: unnecessary_type_check

import 'package:flutter/material.dart';

import '../models/users_model.dart';
import '../services/api_handler.dart';

class UsersProvider with ChangeNotifier{
  List<UserModel> _users = [];

  List<UserModel> get users => _users;

  Future<List<UserModel>> getUsers() async{
    var user = await ApiHandler.getAllUsers();
    if (user is List<UserModel>) {
      _users = user;
    }
    notifyListeners();
    return _users;
  }

}