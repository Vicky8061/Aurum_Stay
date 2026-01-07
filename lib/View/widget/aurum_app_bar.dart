import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:aurum_stay/utils/app_colors.dart';

class AurumAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AurumAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.bg,
      elevation: 0,
      title: Row(
        children: [
          Shimmer.fromColors(
            baseColor: AppColors.gold,
            highlightColor: Colors.white,
            child: const Text(
              "Aurum",
              style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2),
            ),
          ),
          const SizedBox(width: 6),
          const Text(
            "Stay",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 12),
          child: Icon(Icons.notifications_outlined, color: AppColors.gold),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
