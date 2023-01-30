import 'package:daytrack_apps/gen/fonts.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:daytrack_apps/shared/string_value.dart';
import 'package:flutter/material.dart';

class SplashVersionIndicator extends StatelessWidget {
  const SplashVersionIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(
          flex: 1,
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: CalculateSize.getHeight(20),
          ),
          child: CircularProgressIndicator(
            color: Theme.of(context).canvasColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: CalculateSize.getHeight(16),
          ),
          child: Text(
            StringValue.versionApp,
            style: TextStyle(
              fontFamily: FontFamily.inter,
              color: Theme.of(context).canvasColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}
