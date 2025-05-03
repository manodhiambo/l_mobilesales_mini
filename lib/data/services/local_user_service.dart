import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/user_model.dart';

class LocalUserService {
  Future<List<UserModel>> loadUsers() async {
    final String jsonString = await rootBundle.loadString('assets/user_data.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((e) => UserModel.fromJson(e)).toList();
  }
}
