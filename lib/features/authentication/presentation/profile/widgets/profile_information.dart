import 'package:daytrack_apps/features/attendance/presentation/home/widgets/widgets.dart';
import 'package:daytrack_apps/gen/assets.gen.dart';
import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({
    Key? key,
    required this.name,
    required this.email,
    this.avatar,
    required this.onEdit,
  }) : super(key: key);

  final Uint8List? avatar;
  final String name;
  final String email;
  final VoidCallback onEdit;

  ImageProvider _getImage() {
    if (avatar != null) {
      return MemoryImage(avatar!);
    }
    return AssetImage(Assets.images.avatar.path);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeHeader(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: CalculateSize.getWidth(16),
              vertical: CalculateSize.getHeight(20),
            ),
            child: ProfileAppBar(
              onEdit: onEdit,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: CalculateSize.getHeight(28),
          ),
          child: CircleAvatar(
            radius: CalculateSize.getWidth(84),
            backgroundImage: _getImage(),
            backgroundColor: Colors.transparent,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: CalculateSize.getHeight(20),
          ),
          child: Column(children: [
            Text(
              name,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontSize: 16,
                    color: ColorFamily.blackPrimary,
                  ),
            ),
            Text(
              email,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: ColorFamily.blackPrimary,
                  ),
            ),
          ]),
        ),
      ],
    );
  }
}
