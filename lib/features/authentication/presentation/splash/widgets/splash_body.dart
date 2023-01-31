import 'package:daytrack_apps/features/authentication/presentation/onboarding/page/onboarding_page.dart';
import 'package:daytrack_apps/features/authentication/presentation/splash/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SplashBloc>(context).add(
      SplashRequestSession(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashLoaded) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const OnboardingPage(),
            ),
          );
        }
      },
      child: Stack(
        children: const [
          Center(
            child: SplashLogoApp(),
          ),
          Center(
            child: SplashVersionIndicator(),
          )
        ],
      ),
    );
  }
}
