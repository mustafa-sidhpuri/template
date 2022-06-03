

import 'package:get_it/get_it.dart';

import 'data/repository/login_repository_impl.dart';
import 'domain/repository/LoginRepository.dart';
import 'domain/usecases/login_user.dart';
import 'presentation/controller/bloc/login_bloc.dart';

final sl = GetIt.instance;

Future init()async{
  // bloc
  sl.registerLazySingleton(() => LoginBloc(login: sl()));

  // usecase
  sl.registerLazySingleton(() => Login(repository: sl()));

  // repository
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl());
}