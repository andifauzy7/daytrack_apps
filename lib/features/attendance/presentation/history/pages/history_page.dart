import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(
            const Duration(seconds: 1),
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: CalculateSize.getWidth(16),
            vertical: CalculateSize.getHeight(10),
          ),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) => HistoryAttendanceCard(
              title: 'Saatnya Check-In',
              subtitle: '21:13 WIB',
              actionText: 'Check-In',
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
