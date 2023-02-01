import 'package:daytrack_apps/core/service_locator/service_locator.dart';
import 'package:daytrack_apps/features/timeline/data/datasources/timeline_local_data_source.dart';
import 'package:daytrack_apps/features/timeline/data/datasources/timeline_remote_data_source.dart';
import 'package:daytrack_apps/features/timeline/data/repositories/timeline_repository_impl.dart';
import 'package:daytrack_apps/features/timeline/domain/repositories/timeline_repository.dart';
import 'package:daytrack_apps/features/timeline/domain/usecases/get_latest_news_usecase.dart';
import 'package:daytrack_apps/features/timeline/presentation/timeline/bloc/timeline_bloc.dart';

class TimelineDependencies {
  TimelineDependencies() {
    _registerUseCase();
    _registerRepository();
    _registerDataSource();
    _registerController();
  }

  void _registerUseCase() {
    sl.registerLazySingleton<GetLatestNewsUsecase>(
      () => GetLatestNewsUsecase(
        sl(),
      ),
    );
  }

  void _registerRepository() {
    sl.registerLazySingleton<TimelineRepository>(
      () => TimelineRepositoryImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
        networkInfo: sl(),
      ),
    );
  }

  void _registerDataSource() {
    sl.registerLazySingleton<TimelineRemoteDataSource>(
      () => TimelineRemoteDataSourceImpl(
        client: sl(),
      ),
    );
    sl.registerLazySingleton<TimelineLocalDataSource>(
      () => TimelineLocalDataSourceImpl(
        sharedPreferences: sl(),
      ),
    );
  }

  void _registerController() {
    sl.registerFactory(
      () => TimelineBloc(
        getLatestNewsUsecase: sl(),
      ),
    );
  }
}
