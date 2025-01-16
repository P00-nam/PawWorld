import 'package:paw_world/models/pet_model.dart';

import '../network/api_const.dart';
import '../network/http_client.dart';

class SearchService {
  late final PawWorldHttpClient _client;

  AuthService({required PawWorldHttpClient client}) {
    _client = client;
  }

  Future<List<PetModel>> searchPosts({required String keyword}) async {
    final response = await _client.get(
        url: '${ApiConst.baseUrl}searchByType?keyword=$keyword');

    return (response as List<dynamic>)
        .map((e) => PetModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
