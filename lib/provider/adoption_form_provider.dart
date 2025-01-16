import 'package:flutter/material.dart';
import 'package:paw_world/models/adoption_form_model.dart';
import 'package:paw_world/services/adoption_form_services.dart';

import '../network/api_response.dart';

class AdoptionFromProvider with ChangeNotifier {
  AdoptionFromProvider({required AdoptionFromService adoptPet}) {
    _adoptPet = adoptPet;
  }
  late final AdoptionFromService _adoptPet;
  ApiResponse<AdoptionFormModel> adoptionResponse = ApiResponse.loading();
  Future<void> form({
    required String name,
    required String email,
    required String phone,
    required bool hasOwnedPetBefore,
    required bool hasFencedYard,
    required bool isReadyToAdopt,
  }) async {
    print("form");
    try {
      final response = await _adoptPet.submitAdoptionForm(
        name: name,
        email: email,
        phone: phone,
        hasOwnedPetBefore: hasOwnedPetBefore,
        hasFencedYard: hasFencedYard,
        isReadyToAdopt: isReadyToAdopt,
      );

      adoptionResponse = ApiResponse.success(response);
      notifyListeners();
    } on Exception catch (e) {
      print("adoption api error $e");
      adoptionResponse = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
