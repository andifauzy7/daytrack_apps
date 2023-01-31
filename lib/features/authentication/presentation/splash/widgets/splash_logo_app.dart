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
      child: Text(
        StringValue.shortTitleApp,
        style: Theme.of(context).textTheme.headline4!.copyWith(
              color: Theme.of(context).canvasColor,
            ),
      ),
    );
  }
}
