import 'package:flutter/foundation.dart';

import '../models/pet_model.dart';

class FavoritePetsProvider extends ChangeNotifier {
  final List<PetModel> _favoritePets = [];

  List<PetModel> get favoritePets => _favoritePets;

  void addFavoritePet(PetModel pet) {
    _favoritePets.add(pet);
    notifyListeners();
  }

  void removeFavoritePet(PetModel pet) {
    _favoritePets.remove(pet);
    notifyListeners();
  }

  bool isFavorite(PetModel pet) {
    return _favoritePets.contains(pet);
  }
}
