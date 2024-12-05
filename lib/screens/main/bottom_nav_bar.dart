import 'package:car_renr_app/screens/main/chats_screen.dart';
import 'package:car_renr_app/screens/main/main_screen.dart';
import 'package:car_renr_app/screens/main/profile_screen.dart';
import 'package:car_renr_app/screens/main/trips_screen.dart';
import 'package:car_renr_app/utils/styles.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0; // Track the selected tab

  final List<Widget> _pages = [
    ProfileScreen(),
    TripsScreen(),
    ChatsScreen(),
    const MainScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),

      floatingActionButton: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [primary800, primary700, primary600]),
          borderRadius: BorderRadius.circular(25)
        ),
        child: const Icon(Icons.add, size: 30, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shadowColor: Colors.black,
        padding: const EdgeInsets.all(0),
        elevation: 30,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              icon: _currentIndex == 0
                  ? 'assets/icons/home_icon_filled.png'
                  : 'assets/icons/home_icon.png',
              onTap: () => _updateIndex(0),
            ),
            _buildNavItem(
              icon: _currentIndex == 1
                  ? 'assets/icons/car_icon_filled.png'
                  : 'assets/icons/car_icon.png',
              onTap: () => _updateIndex(1),
            ),
            const SizedBox(width: 40), // Space for FAB
            _buildNavItem(
              icon: _currentIndex == 2
                  ? 'assets/icons/message_icon_filled.png'
                  : 'assets/icons/message_icon.png',
              onTap: () => _updateIndex(2),
            ),
            _buildNavItem(
              icon: _currentIndex == 3
                  ? 'assets/icons/profile_icon_filled.png'
                  : 'assets/icons/profile_icon.png',
              onTap: () => _updateIndex(3),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({required String icon, required VoidCallback onTap}) {
    return Expanded(child: IconButton(
      icon: Image.asset(icon),
      onPressed: onTap,
    ));
  }

  void _updateIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}