import 'package:aurum_stay/controller/BottomNavController.dart';
import 'package:aurum_stay/controller/user_booking_controller.dart';
import 'package:aurum_stay/user_side/View/home_screen.dart';
import 'package:aurum_stay/user_side/View/mybooking_screen.dart';
import 'package:aurum_stay/user_side/View/profile_screen.dart';
import 'package:aurum_stay/user_side/View/saved_screen.dart';
import 'package:aurum_stay/user_side/View/widget/bottom_nav_bar.dart';
import 'package:aurum_stay/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navController = Get.put(BottomNavController());
    final bookingsController = Get.put(UserBookingsController());

    return Scaffold(
      backgroundColor: AppColors.bg,

      body: Obx(() {
        switch (navController.currentIndex.value) {
          case 0:
            return const HomeScreen();
          case 1:
            return const SavedScreen();
          case 2:
            return MyBookingsScreen(
              bookings: bookingsController.bookings,
            ); // ✅ reactive list passed here
          case 3:
            return const ProfileScreen();
          default:
            return const HomeScreen();
        }
      }),

      bottomNavigationBar: Obx(() => _buildBottomNav(navController)),
    );
  }

  Widget _buildBottomNav(BottomNavController controller) {
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
            isSelected: controller.currentIndex.value == 0,
            onTap: () => controller.changeTab(0),
          ),
          NavItem(
            icon: Icons.favorite_rounded,
            label: "Wishlist",
            isSelected: controller.currentIndex.value == 1,
            onTap: () => controller.changeTab(1),
          ),
          NavItem(
            icon: Icons.calendar_month_rounded,
            label: "Bookings",
            isSelected: controller.currentIndex.value == 2,
            onTap: () => controller.changeTab(2),
          ),
          NavItem(
            icon: Icons.person_rounded,
            label: "Profile",
            isSelected: controller.currentIndex.value == 3,
            onTap: () => controller.changeTab(3),
          ),
        ],
      ),
    );
  }
}
