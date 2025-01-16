import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:paw_world/models/pet_model.dart';
import 'package:http/http.dart' as http;

import '../network/api_const.dart';

class PetProvider with ChangeNotifier {
  List<PetModel> _allPets = [];
  final List<PetModel> _favoritePets = [];

  List<PetModel> get allPets => _allPets;
  List<PetModel> get favoritePets => _favoritePets;

  Future<void> fetchAllPets() async {
    final response = await http.get(Uri.parse("${ApiConst.baseUrl}getPet"));
    final List<PetModel> loadedPets = [];
    final extractedData = json.decode(response.body) as List<dynamic>;

    for (var petData in extractedData) {
      loadedPets.add(PetModel(
        id: petData['_id'],
        name: petData['name'],
        color: petData['color'],
        gender: petData['gender'],
        description: petData['description'],
        imagePath: petData['imagePath'],
        category: petData['category'],
      ));
    }

    _allPets = loadedPets;
    notifyListeners();
  }

  void addFavoritePet(PetModel pet) {
    _favoritePets.add(pet);
    notifyListeners();
  }

  void removeFavoritePet(PetModel pet) {
    _favoritePets.remove(pet);
    notifyListeners();
  }

  bool isPetFavorite(PetModel pet) {
    return _favoritePets.contains(pet);
  }
}
