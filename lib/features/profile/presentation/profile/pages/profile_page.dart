import 'package:daytrack_apps/features/attendance/presentation/home/widgets/home_header.dart';
import 'package:daytrack_apps/features/profile/presentation/profile/widgets/profile_app_bar.dart';
import 'package:daytrack_apps/gen/assets.gen.dart';
import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeHeader(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: CalculateSize.getWidth(16),
                    vertical: CalculateSize.getHeight(20),
                  ),
                  child: const ProfileAppBar(),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: CalculateSize.getHeight(28),
                ),
                child: CircleAvatar(
                  radius: CalculateSize.getWidth(84),
                  backgroundImage:
                      AssetImage(Assets.images.onboardingFirst.path),
                  backgroundColor: Colors.transparent,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: CalculateSize.getHeight(20),
                ),
                child: Column(children: [
                  Text(
                    'Amanda Khairunisa',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontSize: 16,
                          color: ColorFamily.blackPrimary,
                        ),
                  ),
                  Text(
                    'amanda.kh@daytrack.com',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: ColorFamily.blackPrimary,
                        ),
                  ),
                ]),
              ),
              Text(
                'Divisi',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: ColorFamily.blackPrimary,
                    ),
              ),
              Text(
                'MARKETING',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      color: ColorFamily.blackPrimary,
                    ),
              ),
              SizedBox(
                height: CalculateSize.getHeight(20),
              ),
              Text(
                'Supervisor',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: ColorFamily.blackPrimary,
                    ),
              ),
              Text(
                'REYNALDI S',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      color: ColorFamily.blackPrimary,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
