import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/use_cases/nativeLogin.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final NativeLogin nativeLogin;
  LoginCubit({required this.nativeLogin}) : super(LoginInitial());

  Future<void> callNativeLogin({required String userName, required String password}) async {
    final response = await nativeLogin.repository.nativeLogin(userName: userName, password: password);

    print('response cubit $response');

    userName.isNotEmpty && password.isNotEmpty ? emit(LoginSuccess(true)) : emit(LoginSuccess(false));
  }
}
