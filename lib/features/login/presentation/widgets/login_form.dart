import 'package:clean_architecture_flutter_app/features/login/presentation/bloc/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  var textValue = false;
  @override
  Widget build(BuildContext context) {
    return Material(
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            if(state is LoginSuccess) {
              textValue = state.value;
            }
            return Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: userController,
                      decoration: const InputDecoration(
                          label: Text('UserName')
                      ),
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                          label: Text('Password')
                      ),
                    ),
                    OutlinedButton(onPressed: () => {
                      context.read<LoginCubit>().callNativeLogin(userName: userController.text, password: passwordController.text)
                    }, child: Text('Login')),
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return Text('$textValue');
                      },
                    ),
                  ],
                )
            );
          },
        ),

    );
  }

}