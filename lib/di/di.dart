import 'package:get_it/get_it.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../features/data/data_sources/datasources.dart';
import '../features/data/repositories/repositories.dart';
import '../features/domain/domain.dart';
import '../features/presentation/manager/manager.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator() async {
  /// For unit testing only
  sl.registerSingleton<Socket>(Socket());
  dataSources();
  repositories();
  useCase();
  cubit();
}

/// Register dataSources
void dataSources() {
  sl.registerLazySingleton<SocketServiceDatasource>(
    () => SocketServiceDatasourceImpl(sl()),
  );
}

/// Register repositories
void repositories() {
  sl.registerLazySingleton<SocketRepository>(() => SocketRepositoryImpl(sl()));
}

/// Register useCase
void useCase() {
  sl
    ..registerLazySingleton(() => SocketSend(sl()))
    ..registerLazySingleton(() => SocketReceive(sl()));
}

/// Register cubit
void cubit() {
  sl
    ..registerFactory(() => SocketCubit(sl(), sl()))
    ..registerFactory(() => SymbolsCubit(sl()))
    ..registerFactory(() => TicksCubit(sl()));
}
