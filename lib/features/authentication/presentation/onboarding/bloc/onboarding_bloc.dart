import 'package:daytrack_apps/gen/assets.gen.dart';
import 'package:daytrack_apps/shared/string_value.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/utils.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
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

  OnboardingBloc()
      : super(
          OnboardingLoaded(
            onboardingContent: contentOnboarding[0],
            indexContent: 0,
            lengthContent: contentOnboarding.length,
          ),
        ) {
    on<OnboardingEvent>((event, emit) {
      if (event is OnboardingSkipStep) {
        emit(
          OnboardingNavigateToSignIn(
            onboardingContent: contentOnboarding[indexOnboarding],
            lengthContent: contentOnboarding.length,
            indexContent: indexOnboarding,
          ),
        );
      }

      if (event is OnboardingNextStep) {
        if (indexOnboarding + 1 >= contentOnboarding.length) {
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

      if (event is OnboardingPreviousStep) {
        decrement();
        emit(
          OnboardingLoaded(
            onboardingContent: contentOnboarding[indexOnboarding],
            lengthContent: contentOnboarding.length,
            indexContent: indexOnboarding,
          ),
        );
      }
    });
  }

  void increment() => indexOnboarding += 1;

  void decrement() => indexOnboarding -= 1;
}
