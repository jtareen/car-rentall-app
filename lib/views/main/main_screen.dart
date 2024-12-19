import 'package:car_renr_app/models/car_class.dart';
import 'package:car_renr_app/views/main/car_details_screen.dart';
import 'package:car_renr_app/views/main/chats_screen.dart';
import 'package:car_renr_app/views/main/feed_screen.dart';
import 'package:car_renr_app/views/main/profile/profile_screen.dart';
import 'package:car_renr_app/views/main/trips_screen.dart';
import 'package:car_renr_app/views/main/widgets/floating_action_button.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0; // Track the selected tab

  final List<Widget> _pages = [
    const FeedScreen(),
    TripsScreen(),
    ChatsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      floatingActionButton: CustomFloatingActionButton(icon: Icons.add, onPressed: () {}),
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