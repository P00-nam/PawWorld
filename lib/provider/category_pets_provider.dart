import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:paw_world/models/pet_model.dart';
import 'package:paw_world/network/api_const.dart';
import 'package:paw_world/network/api_response.dart';
import 'package:paw_world/network/http_client.dart';

class CategoryPetsProvider with ChangeNotifier {
  late final PawWorldHttpClient _client;
  CategoryPetsProvider(this._client);

  ApiResponse<List<PetModel>> categoryPets = ApiResponse.loading();

  Future<void> fetchCategoryPets(String category) async {
    try {
      final response = await _client.get(
          url: '${ApiConst.baseUrl}getByCategory?keyword=$category');

      final decodedBody = jsonDecode(response.body);
      final pets = (decodedBody as List<dynamic>)
          .map((e) => PetModel.fromJson(e))
          .toList();
      categoryPets = ApiResponse.success(pets);
      notifyListeners();
    } catch (e) {
      print("Error $e");
      categoryPets = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
