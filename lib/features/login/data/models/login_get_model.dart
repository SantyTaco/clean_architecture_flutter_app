import 'package:clean_architecture_flutter_app/features/login/domain/entities/login.dart';

class LoginGetModel extends LogIn{
  const LoginGetModel({required super.accessToken, required super.refreshToken, required super.idToken});

  factory LoginGetModel.fromJson(Map<String, dynamic> json) {
    print('from json: $json');
    return LoginGetModel (
        accessToken: json['accessToken'],
        refreshToken: json['refreshToken'],
        idToken: json['idToken'],
    );
  }
}