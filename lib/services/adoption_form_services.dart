import 'package:paw_world/models/adoption_form_model.dart';

import '../network/api_const.dart';
import '../network/http_client.dart';

class AdoptionFromService {
  late final PawWorldHttpClient _client;

  AdoptionFromService({required PawWorldHttpClient client}) {
    _client = client;
  }

  Future<AdoptionFormModel> submitAdoptionForm({
    required String name,
    required String email,
    required String phone,
    required bool hasOwnedPetBefore,
    required bool hasFencedYard,
    required bool isReadyToAdopt,
  }) async {
    print("submit form 1");
    final response = await _client.post(
      url: "${ApiConst.baseUrl}adoption",
      body: {
        'name': name,
        'email': email,
        'phone': phone,
        'hasOwnedPetBefore': hasOwnedPetBefore.toString(),
        'hasFencedYard': hasFencedYard.toString(),
        'isReadyToAdopt': isReadyToAdopt.toString(),
      },
    );
    return AdoptionFormModel.fromJson(response['data']);
  }
}
