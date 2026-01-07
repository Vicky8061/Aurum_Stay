import 'package:aurum_stay/View/saved_screen.dart';
import 'package:aurum_stay/View/widget/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import 'home_screen.dart';
import 'bookings_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    SavedScreen(),
    BookingsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: _screens[_currentIndex],
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: AppColors.card,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavItem(
            icon: Icons.home_rounded,
            label: "Home",
            isSelected: _currentIndex == 0,
            onTap: () => _onTabChange(0),
          ),
          NavItem(
            icon: Icons.favorite_rounded,
            label: "Wishlist",
            isSelected: _currentIndex == 1,
            onTap: () => _onTabChange(1),
          ),
          NavItem(
            icon: Icons.calendar_month_rounded,
            label: "Bookings",
            isSelected: _currentIndex == 2,
            onTap: () => _onTabChange(2),
          ),
          NavItem(
            icon: Icons.person_rounded,
            label: "Profile",
            isSelected: _currentIndex == 3,
            onTap: () => _onTabChange(3),
          ),
        ],
      ),
    );
  }

  void _onTabChange(int index) {
    if (_currentIndex == index) return;
    setState(() => _currentIndex = index);
  }
}
