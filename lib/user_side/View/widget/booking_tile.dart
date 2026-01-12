import 'package:aurum_stay/utils/app_colors.dart';
import 'package:flutter/material.dart';

class BookingTile extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback? onTap;
  const BookingTile({
    super.key,
    required this.title,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: Colors.white70)),
            const SizedBox(height: 6),
            Text(
              value,
              style: const TextStyle(
                color: AppColors.goldText,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
