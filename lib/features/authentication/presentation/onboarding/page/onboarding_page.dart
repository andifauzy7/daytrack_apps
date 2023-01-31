import 'package:daytrack_apps/core/service_locator/service_locator.dart';
import 'package:daytrack_apps/features/authentication/presentation/onboarding/bloc/onboarding_bloc.dart';
import 'package:daytrack_apps/features/authentication/presentation/sign_in/page/sign_in_page.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  bool _showPreviousButton(OnboardingState state) => state.indexContent != 0;

  bool _showSkipButton(OnboardingState state) =>
      state.indexContent == (state.lengthContent - 1);

  void _navigateToSignInPage(BuildContext context) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const SignInPage(),
        ),
      );

  void _dispatchPrevious(BuildContext context) =>
      BlocProvider.of<OnboardingBloc>(context).add(
        OnboardingPreviousStep(),
      );

  void _dispatchSkip(BuildContext context) =>
      BlocProvider.of<OnboardingBloc>(context).add(
        OnboardingSkipStep(),
      );

  void _dispatchNext(BuildContext context) =>
      BlocProvider.of<OnboardingBloc>(context).add(
        OnboardingNextStep(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => sl.get<OnboardingBloc>(),
        child: BlocConsumer<OnboardingBloc, OnboardingState>(
          listener: (context, state) {
            if (state is OnboardingNavigateToSignIn) {
              _navigateToSignInPage(context);
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                OnboardingImage(url: state.onboardingContent.picture),
                SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: CalculateSize.getWidth(18),
                          right: CalculateSize.getWidth(29),
                          top: CalculateSize.getHeight(22),
                        ),
                        child: OnboardingHeader(
                          showPreviousButton: _showPreviousButton(state),
                          showSkipText: _showSkipButton(state),
                          onPrevious: () => _dispatchPrevious(context),
                          onSkip: () => _dispatchSkip(context),
                        ),
                      ),
                      const Spacer(
                        flex: 4,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: CalculateSize.getWidth(30),
                        ),
                        child: OnboardingTextContent(
                          title: state.onboardingContent.title,
                          subtitle: state.onboardingContent.subtitle,
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: CalculateSize.getWidth(30),
                          right: CalculateSize.getWidth(30),
                          bottom: CalculateSize.getHeight(58),
                        ),
                        child: OnboardingFooter(
                          current: state.indexContent,
                          length: state.lengthContent,
                          onNext: () => _dispatchNext(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
