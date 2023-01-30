import 'package:daytrack_apps/features/authentication/presentation/sign_in/page/sign_in_page.dart';
import 'package:daytrack_apps/features/authentication/presentation/widgets/authentication_text_theme.dart';
import 'package:daytrack_apps/gen/assets.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:daytrack_apps/shared/string_value.dart';
import 'package:flutter/material.dart';

import '../utils/onboarding_content.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int indexOnboarding = 0;

  List<OnboardingContent> contentOnboarding = [
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

  void increment() => setState(() {
        indexOnboarding += 1;
      });

  void decrement() => setState(() {
        indexOnboarding -= 1;
      });

  void nextPage() {
    if (indexOnboarding + 1 >= contentOnboarding.length) {
      navigateToSignInPage();
    } else {
      increment();
    }
  }

  void navigateToSignInPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const SignInPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            contentOnboarding[indexOnboarding].picture,
            gaplessPlayback: true,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: indexOnboarding != 0,
                        child: InkWell(
                          onTap: decrement,
                          child: const Icon(
                            Icons.chevron_left,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      indexOnboarding == (contentOnboarding.length - 1)
                          ? const SizedBox.shrink()
                          : InkWell(
                              onTap: navigateToSignInPage,
                              child: const Text(
                                StringValue.onboardSkip,
                                style: AuthenticationTextTheme.skipText,
                              ),
                            )
                    ],
                  ),
                ),
                const Spacer(
                  flex: 4,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: CalculateSize.getWidth(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contentOnboarding[indexOnboarding].title,
                        style: AuthenticationTextTheme.headlineText,
                      ),
                      Text(
                        contentOnboarding[indexOnboarding].subtitle,
                        style: AuthenticationTextTheme.subtitleText,
                      ),
                    ],
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(children: [
                        for (int i = 0; i < contentOnboarding.length; i++)
                          AnimatedContainer(
                            width: indexOnboarding == i
                                ? CalculateSize.getWidth(50)
                                : CalculateSize.getWidth(30),
                            margin: EdgeInsets.only(
                              right: CalculateSize.getWidth(5),
                            ),
                            height: CalculateSize.getHeight(8),
                            decoration: BoxDecoration(
                              color: indexOnboarding == i
                                  ? Theme.of(context).primaryColor
                                  : Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            duration: const Duration(milliseconds: 300),
                          )
                      ]),
                      const Spacer(
                        flex: 1,
                      ),
                      InkWell(
                        onTap: nextPage,
                        child: Container(
                          width: CalculateSize.getWidth(40),
                          height: CalculateSize.getWidth(40),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
