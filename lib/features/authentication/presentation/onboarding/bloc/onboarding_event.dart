part of 'onboarding_bloc.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

class OnboardingNextStep extends OnboardingEvent {}

class OnboardingPreviousStep extends OnboardingEvent {}

class OnboardingSkipStep extends OnboardingEvent {}
