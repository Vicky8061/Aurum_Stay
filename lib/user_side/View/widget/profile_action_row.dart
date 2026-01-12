import 'package:aurum_stay/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileActionRow extends StatelessWidget {
  final IconData icon;
  final String label;

  const ProfileActionRow({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6),
        padding: EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.gold),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
