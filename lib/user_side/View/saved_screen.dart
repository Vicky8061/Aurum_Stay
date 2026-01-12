import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bg,
      body: Center(
        child: Text("WishList", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
