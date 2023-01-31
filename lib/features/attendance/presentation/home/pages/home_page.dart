import 'package:daytrack_apps/features/attendance/presentation/check_attendance/pages/check_attendance_page.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(
            const Duration(seconds: 1),
          );
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeHeader(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: CalculateSize.getWidth(16),
                      vertical: CalculateSize.getHeight(20),
                    ),
                    child: const HomeAppBar(
                      title: 'Selamat Siang',
                      name: 'Andi Fauzy',
                    ),
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
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CheckAttendancePage(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: CalculateSize.getWidth(12),
                    vertical: CalculateSize.getHeight(12),
                  ),
                  child: HomeAnnouncement(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
