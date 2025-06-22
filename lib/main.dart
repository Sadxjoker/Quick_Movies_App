import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:quickmovies/Discover_Screen.dart';
import 'package:quickmovies/Home_Screen.dart';
import 'package:quickmovies/Profile_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: NavigationBottomBar(),
    );
  }
}

class NavigationBottomBar extends StatefulWidget {
  const NavigationBottomBar({super.key});

  @override
  State<NavigationBottomBar> createState() => _NavigationBottomBarState();
}

class _NavigationBottomBarState extends State<NavigationBottomBar> {
  final List<Widget> screens = [
    HomeScreen(),
    DiscoverScreen(),
    ProfileScreen(),
    // MovieViewScreen(),
  ];

  int currentIndex = 0;
  void changedIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: changedIndex,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/home1.png",
            ),
            activeIcon: Image.asset(
              "assets/icons/home2.png",
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/play1.png",
            ),
            activeIcon: Image.asset(
              "assets/icons/play2.png",
            ),
            label: "Discover",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/person1.png",
              scale: 7.5,
            ),
            activeIcon: Image.asset(
              "assets/icons/person2.png",
              scale: 7,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
