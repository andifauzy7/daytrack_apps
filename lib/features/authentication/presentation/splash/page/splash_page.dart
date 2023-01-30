import 'package:daytrack_apps/core/service_locator/service_locator.dart';
import 'package:daytrack_apps/features/authentication/presentation/onboarding/page/onboarding_page.dart';
import 'package:daytrack_apps/features/authentication/presentation/splash/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const OnboardingPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: BlocProvider(
        create: (_) => sl.get<SplashBloc>(),
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
      ),
    );
  }
}
