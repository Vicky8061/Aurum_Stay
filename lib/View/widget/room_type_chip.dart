import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class RoomTypeChip extends StatelessWidget {
  final String title;
  final bool isSelected;

  const RoomTypeChip({
    super.key,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.gold : AppColors.card,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
