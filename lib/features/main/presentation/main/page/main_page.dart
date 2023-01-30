import 'package:daytrack_apps/features/attendance/presentation/history/pages/history_page.dart';
import 'package:daytrack_apps/features/attendance/presentation/home/pages/home_page.dart';
import 'package:daytrack_apps/features/profile/presentation/profile/pages/profile_page.dart';
import 'package:daytrack_apps/features/timeline/presentation/timeline/pages/timeline_page.dart';
import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: indexPage,
          children: [
            HomePage(),
            const HistoryPage(),
            const TimelinePage(),
            const ProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: indexPage,
        unselectedItemColor: ColorFamily.greyPrimary,
        onTap: (value) => setState(() {
          indexPage = value;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}
