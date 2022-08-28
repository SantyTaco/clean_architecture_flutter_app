import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';

abstract class LoginRepositories {
  Future<Either<Failures, bool>> nativeLogin({required userName, required password});
}