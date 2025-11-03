import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/http_client/client.dart';
import 'core/network/network_info.dart';
import 'core/network/network_info_impl.dart';
import 'features/task/data/datasources/task_remote_datasource.dart';
import 'features/task/data/repositories/task_repository_impl.dart';
import 'features/task/domain/repositories/task_repository.dart';
import 'features/task/domain/usecases/task_usecase.dart';
import 'features/task/presentation/bloc/task/task_bloc.dart';

GetIt sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Core / Services
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));


  // Bloc
  sl.registerFactory(() => TaskBloc(useCase: sl()));

  // Use cases
  sl.registerLazySingleton(() => TaskUseCase(repository: sl()));

  // Repositories
  sl.registerLazySingleton<TaskRepository>(
      () => TaskRepositoryImpl(remoteDataSource: sl()));
  // Data sources
  sl.registerLazySingleton<TaskRemoteDataSource>(
      () => TaskRemoteDataSourceImpl(client: sl()));
  // Http service
  sl.registerLazySingleton<BaseApiClient>(() => BaseApiClient());
  // SharedPreferences
  sl.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());
}
