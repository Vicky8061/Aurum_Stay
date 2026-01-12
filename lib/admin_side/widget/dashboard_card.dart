import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const DashboardCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 16,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ICON
          CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.gold.withOpacity(0.15),
            child: Icon(icon, color: AppColors.goldText, size: 22),
          ),

          const Spacer(),

          /// VALUE
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 6),

          /// TITLE
          Text(
            title,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
