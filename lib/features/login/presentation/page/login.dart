import 'package:clean_architecture_flutter_app/features/login/presentation/bloc/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../injection_container.dart';
import '../widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<LoginCubit>(),
      child: Container(
        color: Colors.grey,
        height: 500,
        alignment: Alignment.center,
        child: Container(
          width: 400,
          height: 400,
          child: const LoginForm(),

        )
      ),
    );
  }
  
}