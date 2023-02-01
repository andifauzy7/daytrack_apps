import 'package:daytrack_apps/core/service_locator/service_locator.dart';
import 'package:daytrack_apps/features/main/presentation/main/bloc/main_bloc.dart';

class MainDependencies {
  MainDependencies() {
    _registerController();
  }
}

void _registerController() {
  sl.registerFactory(
    () => MainBloc(),
  );
}
