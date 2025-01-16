import 'package:flutter/material.dart';
import 'package:paw_world/models/pet_model.dart';

import '../network/api_response.dart';
import '../services/search_service.dart';

class SearchProvider with ChangeNotifier {
  late final SearchService _searchPet;

  SearchProvider({required SearchService searchPet}) {
    _searchPet = searchPet;
  }

  ApiResponse<List<PetModel>> getSearchResponse = ApiResponse.loading();

  Future<void> searchPosts({required String keyword}) async {
    try {
      final response = await _searchPet.searchPosts(keyword: keyword);
      getSearchResponse = ApiResponse.success(response);
      notifyListeners();
    } on Exception {
      getSearchResponse = ApiResponse.error("something went wrong");
      notifyListeners();
    }
  }
}
