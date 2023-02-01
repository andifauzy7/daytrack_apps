import 'package:daytrack_apps/features/attendance/presentation/check_attendance/pages/check_attendance_page.dart';
import 'package:daytrack_apps/features/authentication/presentation/user_info_header/widgets/user_info_header.dart';
import 'package:daytrack_apps/features/timeline/presentation/announcement/widgets/widgets.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:daytrack_apps/shared/components/app_bar_rounded.dart';
import 'package:daytrack_apps/shared/constants_value.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarRounded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: CalculateSize.getWidth(16),
                    vertical: CalculateSize.getHeight(20),
                  ),
                  child: const UserInfoHeader(),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: CalculateSize.getWidth(8),
                  vertical: CalculateSize.getHeight(8),
                ),
                child: const HomeImageSlider(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: CalculateSize.getWidth(8),
                  vertical: CalculateSize.getHeight(8),
                ),
                child: HomeAttendanceCard(
                  type: HomeAttendanceCardType.checkIn,
                  title: 'Saatnya Check-In',
                  subtitle: '21:13 WIB',
                  actionText: 'Check-In',
                  onPressed: () => Navigator.pushNamed(
                    context,
                    ConstantsValue.attendanceRoute,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: CalculateSize.getWidth(12),
                  vertical: CalculateSize.getHeight(12),
                ),
                child: AnnouncementCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
