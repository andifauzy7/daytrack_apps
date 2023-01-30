import 'package:daytrack_apps/features/authentication/presentation/widgets/authentication_text_theme.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:daytrack_apps/shared/string_value.dart';
import 'package:flutter/material.dart';

class SplashLogoApp extends StatelessWidget {
  const SplashLogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: CalculateSize.getWidth(45),
      ),
      child: const Text(
        StringValue.shortTitleApp,
        style: AuthenticationTextTheme.headlineText,
      ),
    );
  }
}
