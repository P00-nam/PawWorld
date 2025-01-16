import 'package:flutter_test/flutter_test.dart';
import 'package:paw_world/models/pet_model.dart';
import 'package:paw_world/models/user_model.dart';
import 'package:paw_world/network/api_response.dart';
import 'package:paw_world/network/http_client.dart';
import 'package:paw_world/provider/login_provider.dart';
import 'package:paw_world/services/auth_service.dart';

class MockAuthService implements AuthService {
  @override
  Future<UserModel> login(
      {required String email, required String password}) async {
    // Mock the login response here
    await Future.delayed(const Duration(seconds: 1));

    if (email == 'pass@gmail.com') {
      return UserModel(
        email: email,
        password: password,
      );
    }
    throw Exception("Something went wrong");
  }

  @override
  Future<List<PetModel>> searchPosts({required String keyword}) {
    // TODO: implement searchPosts
    throw UnimplementedError();
  }

  @override
  Future signUp({
    required String email,
    required String password,
  }) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  // TODO: implement client
  PawWorldHttpClient get client => throw UnimplementedError();

  @override
  Future logout({userId}) {
    // TODO: implement logout
    throw UnimplementedError();
  }
}

void main() {
  group('LoginProvider', () {
    late LoginProvider loginProvider;
    late MockAuthService mockAuthService;

    setUp(() {
      mockAuthService = MockAuthService();
      loginProvider = LoginProvider(authService: mockAuthService);
    });

    test(
        'login() should set loginResponse to ApiResponse.success on successful login',
        () async {
      // Arrange
      const email = 'pass@gmail.com';
      const password = 'password';

      // Act
      await loginProvider.login(email: email, password: password);

      // Assert
      expect(loginProvider.loginResponse.status, equals(Status.success));
      expect(loginProvider.loginResponse.data, isA<UserModel>());
      expect(loginProvider.loginResponse.error, isNull);
    });

    test(
        'login() should set loginResponse to ApiResponse.error on failed login',
        () async {
      // Arrange
      const email = 'fail@example.com';
      const password = 'wrong_password';

      // Act
      await loginProvider.login(email: email, password: password);

      // Assert
      expect(loginProvider.loginResponse.status, equals(Status.error));
      expect(loginProvider.loginResponse.data, isNull);
      expect(loginProvider.loginResponse.error, isNotNull);
    });
  });
}
