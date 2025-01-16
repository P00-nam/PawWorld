
class UserModel {
  final String email;
  final String password;

  UserModel({required this.email, required this.password});

  factory UserModel.fromJson(Map<String, dynamic> userData) {
    return UserModel(
      email: userData["email"],
      password: userData["password"],
    );
  }
}
