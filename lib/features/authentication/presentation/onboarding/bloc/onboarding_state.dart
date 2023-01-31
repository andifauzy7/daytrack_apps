part of 'onboarding_bloc.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState({
    required this.onboardingContent,
    required this.indexContent,
    required this.lengthContent,
  });
  final OnboardingContent onboardingContent;
  final int lengthContent;
  final int indexContent;

  @override
  List<Object> get props => [onboardingContent];
}

class OnboardingLoaded extends OnboardingState {
  const OnboardingLoaded({
    required super.onboardingContent,
    required super.lengthContent,
    required super.indexContent,
  });
}

class OnboardingNavigateToSignIn extends OnboardingState {
  const OnboardingNavigateToSignIn({
    required super.onboardingContent,
    required super.lengthContent,
    required super.indexContent,
  });
}
