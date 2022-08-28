import 'package:equatable/equatable.dart';

class LogIn extends Equatable {
  const LogIn({required this.accessToken, required this.refreshToken, required this.idToken});

  final String accessToken;
  final String refreshToken;
  final String idToken;

  @override
  List<Object?> get props => [accessToken, refreshToken, idToken];
}