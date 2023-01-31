import 'package:daytrack_apps/core/usecase/usecase.dart';
import 'package:daytrack_apps/features/authentication/domain/usecases/set_onboarding_session_usecase.dart';
import 'package:daytrack_apps/gen/assets.gen.dart';
import 'package:daytrack_apps/shared/string_value.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/utils.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final SetOnboardingSessionUsecase setOnboardingSessionUsecase;
  int indexOnboarding = 0;
  static List<OnboardingContent> contentOnboarding = [
    OnboardingContent(
      picture: Assets.images.onboardingFirst.path,
      title: StringValue.onboardFirstTitle,
      subtitle: StringValue.onboardFirstSubtitle,
    ),
    OnboardingContent(
      picture: Assets.images.onboardingSecond.path,
      title: StringValue.onboardSecondTitle,
      subtitle: StringValue.onboardSecondSubtitle,
    ),
    OnboardingContent(
      picture: Assets.images.onboardingThird.path,
      title: StringValue.onboardThirdTitle,
      subtitle: StringValue.onboardThirdSubtitle,
    ),
  ];

  OnboardingBloc({required this.setOnboardingSessionUsecase})
      : super(
          OnboardingLoaded(
            onboardingContent: contentOnboarding[0],
            indexContent: 0,
            lengthContent: contentOnboarding.length,
          ),
        ) {
    on<OnboardingSkipStep>(_skipStepHandler);
    on<OnboardingNextStep>(_nextStepHandler);
    on<OnboardingPreviousStep>(_prevStepHandler);
  }

  Future<void> _skipStepHandler(
      OnboardingSkipStep event, Emitter<OnboardingState> emit) async {
    await setOnboardingSessionUsecase(
      NoParams(),
    );
    emit(
      OnboardingNavigateToSignIn(
        onboardingContent: contentOnboarding[indexOnboarding],
        lengthContent: contentOnboarding.length,
        indexContent: indexOnboarding,
      ),
    );
  }

  Future<void> _nextStepHandler(
      OnboardingNextStep event, Emitter<OnboardingState> emit) async {
    if (indexOnboarding + 1 >= contentOnboarding.length) {
      await setOnboardingSessionUsecase(
        NoParams(),
      );
      emit(
        OnboardingNavigateToSignIn(
          onboardingContent: contentOnboarding[indexOnboarding],
          lengthContent: contentOnboarding.length,
          indexContent: indexOnboarding,
        ),
      );
    } else {
      increment();
      emit(
        OnboardingLoaded(
          onboardingContent: contentOnboarding[indexOnboarding],
          lengthContent: contentOnboarding.length,
          indexContent: indexOnboarding,
        ),
      );
    }
  }

  Future<void> _prevStepHandler(
      OnboardingPreviousStep event, Emitter<OnboardingState> emit) async {
    decrement();
    emit(
      OnboardingLoaded(
        onboardingContent: contentOnboarding[indexOnboarding],
        lengthContent: contentOnboarding.length,
        indexContent: indexOnboarding,
      ),
    );
  }

  void increment() => indexOnboarding += 1;
  void decrement() => indexOnboarding -= 1;
}
