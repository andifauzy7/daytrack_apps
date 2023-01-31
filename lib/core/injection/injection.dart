import 'package:daytrack_apps/core/network/network_info.dart';
import 'package:daytrack_apps/core/service_locator/service_locator.dart';
import 'package:daytrack_apps/core/usecase/usecase.dart';
import 'package:daytrack_apps/features/authentication/di/authentication_dependencies.dart';
import 'package:daytrack_apps/features/authentication/domain/usecases/set_default_user_usecase.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Injection {
  Future<void> initialize() async {
    await _registerCoreDependencies();
    _registerDependencies();
    _setUserData();
  }

  void _registerDependencies() {
    AuthenticationDependencies();
  }

  Future<void> _registerCoreDependencies() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => http.Client());
    sl.registerLazySingleton(() => InternetConnectionChecker());
    sl.registerLazySingleton(() => sharedPreferences);
    sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(
        connectionChecker: sl(),
      ),
    );
  }

  Future<void> _setUserData() async {
    final SetDefaultUserUsecase setDefaultUserUsecase = sl();
    await setDefaultUserUsecase(
      NoParams(),
    );
  }
}
