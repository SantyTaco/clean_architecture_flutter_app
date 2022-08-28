import 'package:clean_architecture_flutter_app/core/errors/failures.dart';
import 'package:clean_architecture_flutter_app/features/login/domain/repositories/login_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/use_cases/use_cases.dart';

class NativeLogin implements UseCase<bool, Params> {
  final LoginRepositories repository;

  const NativeLogin({required this.repository});

  @override
  Future<Either<Failures, bool>> call(Params params) async {
    return await repository.nativeLogin(userName: params.userName , password: params.password);
  }
}

class Params extends Equatable {
  final String userName;
  final String password;

  const Params({required this.userName, required this.password});

  @override
  List<Object?> get props => [userName, password];
}