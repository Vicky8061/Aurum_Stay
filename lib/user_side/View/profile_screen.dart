import 'package:aurum_stay/user_side/View/widget/profile_action_row.dart';
import 'package:aurum_stay/user_side/View/widget/profile_header.dart';
import 'package:aurum_stay/user_side/View/widget/profile_menu_tile.dart';
import 'package:aurum_stay/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: AppColors.bg,
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ProfileHeader(),
            SizedBox(height: 24),
            Row(
              children: [
                ProfileActionRow(icon: Icons.favorite, label: "WishList"),
                ProfileActionRow(icon: Icons.calendar_today, label: "Bookings"),
                ProfileActionRow(icon: Icons.settings, label: "Settings"),
              ],
            ),
            SizedBox(height: 28),
            ProfileMenuTile(icon: Icons.person_outline, title: "Edit Profile"),
            ProfileMenuTile(icon: Icons.payment, title: "Payment Methods"),
            ProfileMenuTile(icon: Icons.location_on, title: "Saved Address"),
            ProfileMenuTile(icon: Icons.help_outline, title: "Help & Support"),
            ProfileMenuTile(
              icon: Icons.logout,
              title: "Logout",
              isLogout: true,
            ),
          ],
        ),
      ),
    );
  }
}
