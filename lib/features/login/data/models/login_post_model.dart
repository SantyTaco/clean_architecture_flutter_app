class LoginPostModel {
  final userName;
  final password;

  LoginPostModel({required this.userName, required this.password});

  Map<String, String> toJson() {
    return {
      'username': userName,
      'password': password,
    };
  }
}