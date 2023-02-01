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
          children: [
            Text(
              'Profile',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontSize: 16,
                    color: Theme.of(context).canvasColor,
                  ),
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
