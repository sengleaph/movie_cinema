import 'package:flutter/material.dart';

import '../home_page/home_page.dart';
import '../location/location_page.dart';
import '../profile/profile_page.dart';
import '../snake/snake_page.dart';

class BottonNavigationBar extends StatefulWidget {
  final int initialIndex;

  const BottonNavigationBar({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  State<BottonNavigationBar> createState() => _BottonNavigationBarState();
}

class _BottonNavigationBarState extends State<BottonNavigationBar> {
  int index = 0;

  @override
  void initState() {
    super.initState();
    index = widget.initialIndex;
  }

  List<Widget> pages = [
    const HomePage(),
    const LocationPage(),
    const SnakePage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red.shade400,
        unselectedItemColor: Colors.grey,
        currentIndex: index,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home', // Use localized string
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            activeIcon: Icon(Icons.location_on),
            label: 'Location', // Use localized string
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood_outlined),
            activeIcon: Icon(Icons.fastfood_rounded),
            label: 'Snake', // Use localized string
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile', // Use localized string
          ),
        ],
      ),
    );
  }
}
