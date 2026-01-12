import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class MybookingScreen extends StatelessWidget {
  const MybookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bg,
      body: Center(
        child: Text("Bookings", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
