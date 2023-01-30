import 'package:daytrack_apps/features/main/presentation/widgets/main_text_theme.dart';
import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Profile',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: MainTextTheme.homeHeadingLight,
            ),
          ],
        ),
        const Spacer(),
        const Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ],
    );
  }
}
