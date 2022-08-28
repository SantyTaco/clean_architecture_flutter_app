import 'dart:convert';

import 'package:clean_architecture_flutter_app/core/errors/failures.dart';
import 'package:clean_architecture_flutter_app/core/exceptions.dart';
import 'package:clean_architecture_flutter_app/features/login/data/data_sourse/login_remote_data_source.dart';
import 'package:clean_architecture_flutter_app/features/login/data/models/login_post_model.dart';
import 'package:clean_architecture_flutter_app/features/login/domain/repositories/login_repositories.dart';
import 'package:dartz/dartz.dart';

class LoginRepositoryImpl implements LoginRepositories{
  final LoginRemoteDataSource loginRemoteDataSource;

  const LoginRepositoryImpl({required this.loginRemoteDataSource});

  @override
  Future<Either<Failures, bool>> nativeLogin({required userName, required password}) async {
    try {
      final loginBodyRequest = jsonEncode(LoginPostModel(userName: userName, password: password));
      print('loginBodyRequest: $loginBodyRequest');
      var response = await loginRemoteDataSource.nativeLogin(loginBody: loginBodyRequest);

      return Right(true);
    } on ServerException catch (e) {
      return Left(ServerFailure('Error'));
    }

  }

}