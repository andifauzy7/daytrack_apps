import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    Key? key,
    required this.onEdit,
  }) : super(key: key);

  final VoidCallback onEdit;

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
        InkWell(
          onTap: onEdit,
          child: const Icon(
            Icons.edit,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
