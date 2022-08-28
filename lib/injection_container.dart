import 'package:clean_architecture_flutter_app/features/login/data/data_sourse/login_remote_data_source.dart';
import 'package:clean_architecture_flutter_app/features/login/data/repositories/login_repository_impl.dart';
import 'package:clean_architecture_flutter_app/features/login/domain/repositories/login_repositories.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'features/login/domain/use_cases/nativeLogin.dart';
import 'features/login/presentation/bloc/login_cubit.dart';


final serviceLocator = GetIt.instance;

Future<void> init() async {
  initExternal();
  initLoginDependencies();
}

void initLoginDependencies() {
  //Bloc
  serviceLocator.registerFactory(() => LoginCubit(nativeLogin: serviceLocator()));

  //Use Cases
  serviceLocator.registerLazySingleton(() => NativeLogin(repository: serviceLocator()));

  //Repository
  serviceLocator.registerLazySingleton<LoginRepositories>(() => LoginRepositoryImpl(loginRemoteDataSource: serviceLocator()));

  //Data Source
  serviceLocator.registerLazySingleton<LoginRemoteDataSource>(() => LoginRemoteDataSourceImplement(client: serviceLocator()));
}

Future<void> initExternal() async {
  serviceLocator.registerLazySingleton(() => http.Client());
}