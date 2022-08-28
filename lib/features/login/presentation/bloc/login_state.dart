part of 'login_cubit.dart';

@immutable
abstract class LoginState extends Equatable{}

class LoginInitial extends LoginState {
  LoginInitial();
  @override
  List<Object?> get props => [false];
}

class LoginSuccess extends LoginState {
  final bool value;
  LoginSuccess(this.value);
  @override
  List<Object?> get props => [value];
}
