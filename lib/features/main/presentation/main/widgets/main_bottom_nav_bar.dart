import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class MainBottomNavBar extends StatelessWidget {
  const MainBottomNavBar({
    Key? key,
    required this.index,
    this.onTap,
  }) : super(key: key);

  final int index;
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: index,
      unselectedItemColor: ColorFamily.greyPrimary,
      onTap: onTap,
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
    );
  }
}
