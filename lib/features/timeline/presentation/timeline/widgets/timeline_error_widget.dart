import 'package:daytrack_apps/gen/assets.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TimelineErrorWidget extends StatelessWidget {
  const TimelineErrorWidget({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: CalculateSize.getWidth(24),
            vertical: CalculateSize.getHeight(8),
          ),
          child: Lottie.asset(Assets.animation.loadedError),
        ),
        Text(errorMessage),
      ],
    );
  }
}
