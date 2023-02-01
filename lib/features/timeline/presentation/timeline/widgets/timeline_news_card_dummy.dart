import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TimelineNewsCardDummy extends StatelessWidget {
  const TimelineNewsCardDummy({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: CalculateSize.getHeight(10),
      ),
      width: double.infinity,
      height: CalculateSize.getHeight(160),
      child: Shimmer.fromColors(
        baseColor: ColorFamily.greyPrimary,
        highlightColor: Colors.black12,
        child: Container(
          decoration: const BoxDecoration(
            color: ColorFamily.greyPrimary,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
