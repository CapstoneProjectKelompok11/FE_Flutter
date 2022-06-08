import 'package:app_booking_office/screen/booking_office/home_screen.dart';
import 'package:app_booking_office/screen/booking_office/inbox_screen.dart';
import 'package:app_booking_office/screen/booking_office/profile_screen.dart';
import 'package:app_booking_office/screen/booking_office/saved_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  final screen = <Widget>[
    const HomeScreen(),
    SavedScreen(),
    InboxScreen(),
    ProfileScreen()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: IndexedStack(
        index: _selectedIndex,
        children: screen,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xFF4D89FF),
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_rounded,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline), label: 'Saved'),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.chat_bubble,
                ),
                label: 'Inbox'),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.person_circle,
                ),
                label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
