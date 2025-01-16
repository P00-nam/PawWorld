import 'package:flutter/material.dart';
import 'package:paw_world/network/http_client.dart';
import 'package:paw_world/models/user_model.dart';

import '../network/api_const.dart';

class AuthService {
  late final PawWorldHttpClient _client;

  AuthService({required PawWorldHttpClient client}) {
    _client = client;
  }
  PawWorldHttpClient get client => _client;

  Future<UserModel> login(
      {required String email, required String password}) async {
    final response = await _client.post(url: "${ApiConst.baseUrl}logIn", body: {
      'email': email,
      'password': password,
    });
    print("Response is $response");
    return UserModel.fromJson((response as Map<String, dynamic>)['user']);
  }

  Future signUp({required String email, required String password}) async {
    final response =
        await _client.post(url: "${ApiConst.baseUrl}signUp", body: {
      'email': email,
      'password': password,
    });

    debugPrint("resposne is $response");
  }
}
