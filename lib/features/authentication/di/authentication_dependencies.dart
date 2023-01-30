import 'package:daytrack_apps/core/service_locator/service_locator.dart';
import 'package:daytrack_apps/features/authentication/presentation/splash/bloc/splash_bloc.dart';

class AuthenticationDependencies {
  AuthenticationDependencies() {
    _registerUseCase();
    _registerRepository();
    _registerDataSource();
    _registerController();
  }

  void _registerUseCase() {}

  void _registerRepository() {}

  void _registerDataSource() {}

  void _registerController() {
    sl.registerFactory(
      () => SplashBloc(),
    );
  }
}
