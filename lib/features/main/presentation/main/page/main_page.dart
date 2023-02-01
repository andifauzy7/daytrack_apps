import 'package:daytrack_apps/core/service_locator/service_locator.dart';
import 'package:daytrack_apps/features/attendance/presentation/history/pages/history_page.dart';
import 'package:daytrack_apps/features/attendance/presentation/home/pages/home_page.dart';
import 'package:daytrack_apps/features/authentication/presentation/profile/pages/profile_page.dart';
import 'package:daytrack_apps/features/main/presentation/main/bloc/main_bloc.dart';
import 'package:daytrack_apps/features/timeline/presentation/timeline/pages/timeline_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = const [
      HomePage(),
      HistoryPage(),
      TimelinePage(),
      ProfilePage(),
    ];

    return BlocProvider(
      create: (_) => sl.get<MainBloc>(),
      child: BlocBuilder<MainBloc, int>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: pages[state],
            ),
            bottomNavigationBar: MainBottomNavBar(
              index: state,
              onTap: (value) => BlocProvider.of<MainBloc>(context).add(
                MainEvent(index: value),
              ),
            ),
          );
        },
      ),
    );
  }
}
