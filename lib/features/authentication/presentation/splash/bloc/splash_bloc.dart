import 'package:daytrack_apps/core/usecase/usecase.dart';
import 'package:daytrack_apps/features/authentication/domain/usecases/get_login_session_usecase.dart';
import 'package:daytrack_apps/features/authentication/domain/usecases/get_onboarding_session_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final GetLoginSessionUsecase getLoginSessionUsecase;
  final GetOnboardingSessionUsecase getOnboardingSessionUsecase;

  SplashBloc({
    required this.getLoginSessionUsecase,
    required this.getOnboardingSessionUsecase,
  }) : super(SplashInitial()) {
    on<SplashRequestSession>(_splashRequestHandler);
  }

  Future<void> _splashRequestHandler(
    SplashRequestSession event,
    Emitter<SplashState> emit,
  ) async {
    bool isLogin = false;
    bool isOnboarded = false;

    emit(SplashLoading());
    final loginSession = await getLoginSessionUsecase(
      NoParams(),
    );
    loginSession.fold(
      (_) {},
      (value) => isLogin = value,
    );
    final onboardSession = await getOnboardingSessionUsecase(
      NoParams(),
    );
    onboardSession.fold(
      (_) {},
      (value) => isOnboarded = value,
    );

    /// Add delaye to see loading, because access localStorage is too fast
    await Future.delayed(const Duration(seconds: 3), () {});
    if (isLogin) {
      emit(
        SplashNavigateToMain(),
      );
    } else {
      if (isOnboarded) {
        emit(
          SplashNavigateToSignIn(),
        );
      } else {
        emit(
          SplashNavigateToOnboarding(),
        );
      }
    }
  }
}
