import 'package:daytrack_apps/core/service_locator/service_locator.dart';
import 'package:daytrack_apps/features/authentication/data/datasources/authentication_local_data_source.dart';
import 'package:daytrack_apps/features/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:daytrack_apps/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:daytrack_apps/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:daytrack_apps/features/authentication/domain/usecases/get_login_session_usecase.dart';
import 'package:daytrack_apps/features/authentication/domain/usecases/get_onboarding_session_usecase.dart';
import 'package:daytrack_apps/features/authentication/domain/usecases/set_default_user_usecase.dart';
import 'package:daytrack_apps/features/authentication/domain/usecases/set_login_session_usecase.dart';
import 'package:daytrack_apps/features/authentication/domain/usecases/set_onboarding_session_usecase.dart';
import 'package:daytrack_apps/features/authentication/presentation/onboarding/bloc/onboarding_bloc.dart';
import 'package:daytrack_apps/features/authentication/presentation/sign_in/bloc/sign_in_bloc.dart';
import 'package:daytrack_apps/features/authentication/presentation/splash/bloc/splash_bloc.dart';

class AuthenticationDependencies {
  AuthenticationDependencies() {
    _registerUseCase();
    _registerRepository();
    _registerDataSource();
    _registerController();
  }

  void _registerUseCase() {
    sl.registerLazySingleton<GetLoginSessionUsecase>(
      () => GetLoginSessionUsecase(
        sl(),
      ),
    );
    sl.registerLazySingleton<GetOnboardingSessionUsecase>(
      () => GetOnboardingSessionUsecase(
        sl(),
      ),
    );
    sl.registerLazySingleton<SetLoginSessionUsecase>(
      () => SetLoginSessionUsecase(
        sl(),
      ),
    );
    sl.registerLazySingleton<SetOnboardingSessionUsecase>(
      () => SetOnboardingSessionUsecase(
        sl(),
      ),
    );
    sl.registerLazySingleton<SetDefaultUserUsecase>(
      () => SetDefaultUserUsecase(
        sl(),
      ),
    );
  }

  void _registerRepository() {
    sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
        networkInfo: sl(),
      ),
    );
  }

  void _registerDataSource() {
    sl.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImpl(
        client: sl(),
      ),
    );
    sl.registerLazySingleton<AuthenticationLocalDataSource>(
      () => AuthenticationLocalDataSourceImpl(
        sharedPreferences: sl(),
      ),
    );
  }

  void _registerController() {
    sl.registerFactory(
      () => SplashBloc(
        getLoginSessionUsecase: sl(),
        getOnboardingSessionUsecase: sl(),
      ),
    );
    sl.registerFactory(
      () => OnboardingBloc(
        setOnboardingSessionUsecase: sl(),
      ),
    );
    sl.registerFactory(
      () => SignInBloc(
        setLoginSessionUsecase: sl(),
      ),
    );
  }
}
