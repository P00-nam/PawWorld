import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:paw_world/login_signup/user_model.dart';

class Api {
  static const baseUrl = "http://192.168.1.9/api/";

  static addUser(Map pdata) async {
    var url = Uri.parse("${baseUrl}add_user");
    try {
      final res = await http.post(url, body: pdata);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        debugPrint(data);
      } else {
        debugPrint("Request failed with status: ${res.statusCode}");
      }
    } catch (e) {
      debugPrint("Request failed with error: $e");
    }
  }

  static getUser() async {
    List<UserModel> users = [];

    var url = Uri.parse("${baseUrl}get_user");
    try {
      final res = await http.post(
        url,
      );
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        data['users'].forEach((value) => {
              users.add(
                  UserModel(email: value["email"], password: value["password"]))
            });
        return users;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint("Request failed with error: $e");
    }
  }
}
