import 'package:daytrack_apps/features/main/presentation/widgets/main_text_theme.dart';
import 'package:daytrack_apps/gen/assets.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
    required this.title,
    required this.name,
  }) : super(key: key);

  final String title;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: CalculateSize.getWidth(22),
          backgroundImage: AssetImage(Assets.images.onboardingFirst.path),
          backgroundColor: Colors.transparent,
        ),
        SizedBox(
          width: CalculateSize.getWidth(8),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: MainTextTheme.homeTitleAppBar,
            ),
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: MainTextTheme.homeHeadingLight,
            ),
          ],
        ),
        const Spacer(),
        const Icon(
          Icons.notifications_outlined,
          color: Colors.white,
        ),
      ],
    );
  }
}
