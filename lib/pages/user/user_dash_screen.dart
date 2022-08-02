import 'package:flutter/material.dart';

import '../../widgets/AppBars/home_app_bar.dart';
import '../../widgets/DashScreensContent/home_body.dart';

class UserDashScreen extends StatefulWidget {
  const UserDashScreen({Key? key}) : super(key: key);

  @override
  State<UserDashScreen> createState() => _UserDashScreenState();
}

class _UserDashScreenState extends State<UserDashScreen> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _dashScreens = [
    {
      'appBar': const HomeAppBar(),
      'body': const HomeScreenBody(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _dashScreens[_currentIndex]['appBar'],
      body: _dashScreens[_currentIndex]['body'],
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.blue,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black.withOpacity(.50),
        showUnselectedLabels: true,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        // type: BottomNavigation
        onTap: (index) {
          setState(
            () => _currentIndex = index,
          );
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.travel_explore_sharp),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
