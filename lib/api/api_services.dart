import 'dart:convert';

import 'package:flutter_app/models/user_model.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<UserModel>> getUser() async {
    List<UserModel> userModel = [];
    try {
      http.Response res = await http.get(
        Uri.parse(url),
        headers: {
          "Content-type": "application/json",
        },
      );
      if (res.statusCode == 200) {
        List listUser = jsonDecode(res.body)['data'];
        for (int i = 0; i < listUser.length; i++) {
          userModel.add(UserModel.fromJson(listUser[i]));
        }
      }
    } catch (e) {
      print(e);
    }
    return userModel;
  }
}
